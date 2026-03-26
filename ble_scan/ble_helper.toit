import ble
import .ble_utils
import .periodic_timer

SERVICE_UUID    ::= ble.BleUuid "6e40fff0-b5a3-f393-e0a9-e50e24dcca9e"
WRITE_CHAR_UUID ::= ble.BleUuid "6e400002-b5a3-f393-e0a9-e50e24dcca9e"
READ_CHAR_UUID  ::= ble.BleUuid "6e400003-b5a3-f393-e0a9-e50e24dcca9e"

CMD_BATTERY               ::= 0x03
CMD_POWER_OFF             ::= 0x08
CMD_MANUAL_MEASUREMENT    ::= 0x69
CMD_NOTIFICATION          ::= 0x73

measurements_counter/int  := 0

class BleHelper :
  
  next_step_/string := "none"

  connect_attempts/int  := 0

  current-sub-type/int  := 0  //  ???

  reader_task_      := null  // Variable for store task
  is_running_/bool  := false

  data_/Map := {:}

  process_timer_/PeriodicTimer := PeriodicTimer 3
  process_counter_/int      := 0

  remote-device_/ble.RemoteDevice?            := null
  
  w-characteristic_/ble.RemoteCharacteristic? := null
  r-characteristic_/ble.RemoteCharacteristic? := null

  lookup_table_ := {:}

  constructor device/ble.RemoteScannedDevice? :

    data_["name"] = device.data.name
    data_["rssi"] = device.rssi
    data_["mac"]  = conv-to-mac-address "$device.identifier"

    createLookupTable

  next_step :
    return next_step_

  data :
    return data_

  handleBatteryLevel p/any -> none :
    result/any := impBatteryLevel p
    print "battery level: [$result]"
    data_["battery"]  = result["battery"]
    data_["charging"] = result["charging"]

  handleNotification p/any -> none :
    result/Map := impNotification p
    print "Notification->$result"
    if (result.contains "battery") :
      data_["battery"]  = result["battery"]
      data_["charging"] = result["charging"]
        
  handleMeasurement p/any -> none :
    result/Map := impManualMeasure p
    parameter_name/string := parameter-name p[1] 
    data_["measure"] = parameter_name
    data_["value"] = result["value"]
    error/bool := result["error"]  
    if error == false:
      data_["units"] = result["units"]

    print "$parameter_name: ($data_["value"] $data_["units"])"    

  handlePowerOff p/any -> none :
    print "handlePowerOff: $p"

  handle data/any :
    key := data[0]
    if not lookup_table_.contains key :
      print "handle [$key] failed"
      return
    fun/Lambda := lookup_table_[key]
    fun.call data 

  createLookupTable :
    lookup_table_[CMD_BATTERY]            = :: | p | handleBatteryLevel p
    lookup_table_[CMD_POWER_OFF]          = :: | p | handlePowerOff p
    lookup_table_[CMD_MANUAL_MEASUREMENT] = :: | p | handleMeasurement p
    lookup_table_[CMD_NOTIFICATION]       = :: | p | handleNotification p

  connect-services remote-device/ble.RemoteDevice -> bool :
    remote-device_ = remote-device
    catch --trace=false :

    // Discover the service.
      services := remote-device_.discover-services [SERVICE_UUID]
      service/ble.RemoteService := services.first

    // Discover the write characteristic.
      write-characteristics := service.discover-characteristics [WRITE_CHAR_UUID]
      write-characteristic/ble.RemoteCharacteristic := write-characteristics.first
      w-characteristic_ = write-characteristic

    // Discover the read characteristic.
      read-characteristics := service.discover-characteristics [READ_CHAR_UUID]
      read-characteristic/ble.RemoteCharacteristic  := read-characteristics.first
      r-characteristic_ = read-characteristic

    // Subscribe
      subscribe read-characteristic

      return true

    return false


  is_running -> bool :
    return is_running_

  subscribe r-characteristic/ble.RemoteCharacteristic :
    is_running_ = true
    reader_task_ = task::
      r-characteristic.subscribe
      while is_running_ :
        if is_running_ :
          incoming-data := r-characteristic.wait-for-notification          
          handle incoming-data
          process_counter_++
          //sleep --ms=1

  observation :

    rc/bool := false

    print "observation: $process_counter_"
    if (process_counter_ == 0) :
      process_timer_.final
      print "next_step->$next_step_"
      if (next_step_ == "stop-battery-level") :
        sub-type/int := get-subtype
        print "sub-type->$sub-type"
        if sub-type > 0 :
          task::
            rc = measure sub-type
            if not rc :
              reset_measurements_counter
              dispose
        else :
          task::
            dispose

      else :  
        //cb.call next_step_
        keep_measure data_

        task::
          sub-type/int := get-subtype
          
          if sub-type < 0 :
            print "End sequense of measurements"
            task::
              dispose
          else :
            task::
              rc = measure sub-type
              if not rc :
                reset_measurements_counter
                dispose
    else :
      process_counter_= 0

  reset_measurements_counter :
      measurements_counter--
      if measurements_counter < 0 :
        measurements_counter = 0

  keep_measure data/Map :
    data["time"] = time
    if data["value"] == "0" or data["value"] == "0/0":
      data["value"] = "Missing data"
    print "$data"

  get-subtype -> int :
    //print "get-subtype $measurements_counter $sequence.size"
    result/int := -1
    if measurements_counter < sequence.size :  
      result = sequence[measurements_counter]
      measurements_counter++
      if measurements_counter == sequence.size :
        measurements_counter = 0
    return result  

  requestPowerOff w-characteristic/ble.RemoteCharacteristic -> none :
    next_step_ = "stop-app"
    w-characteristic.write power_off //packet
    process_counter_ = 0
    process_timer_.start ::observation

  measure_battery :
    error := catch --trace=false :    
      requestBatteryLevel w-characteristic_
    if error == "Write error" :
      throw "Lost BLE connection"  
    //-> test throw "Lost BLE connection"  

  requestBatteryLevel w-characteristic/ble.RemoteCharacteristic -> none :
    next_step_ = "stop-battery-level"
    error := catch --trace=false :
      w-characteristic.write battery_level //packet
      process_counter_ = 0
      process_timer_.start ::observation
    if error :
      print "------- requestBatteryLevel: $error -------"
      throw "Write error" //  Maybe device unavailable

  powerOff :
    requestPowerOff w-characteristic_

  measure sub-type/int -> bool :
    current-sub-type = sub-type
    error := catch --trace=false :    
      requestToMeasute w-characteristic_ sub-type
      return true
    if error :
      print "******* measure $sub-type->[$error] *******"
      if error == "Write error" :
        data_["measure"] = parameter-name sub-type
        data_["value"] = "Lost BLE connection"
        return false
        //test throw "Lost BLE connection"
    return false      

  requestToMeasute w-characteristic/ble.RemoteCharacteristic sub-type/int -> none :
    next_step_ = "stop-measure"
    packet/ByteArray := parameter-cmd sub-type
    error := catch --trace=false :
      w-characteristic.write packet
      process_counter_ = 0
      process_timer_.start ::observation
    if error :
      print "------- requestToMeasute: $error -------"
      throw "Write error" //  Maybe device unavailable

  dispose :
    if not is_running_ : return
    
    try :
      error := catch --trace=false :
        r-characteristic_.unsubscribe
      if error :
        print "unsubscribe->$error"  
    finally :  
      process_timer_.final
      is_running_ = false
      reader_task_.cancel
      reader_task_ = null  // Clear task
      remote-device_.close
      print "BleHelper is disposed"

