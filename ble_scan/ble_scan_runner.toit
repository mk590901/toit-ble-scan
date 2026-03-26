import ble
import ntp
import esp32 show adjust-real-time-clock
import .ble_utils
import .ble_helper

// ──────────────────────────────────────────────
TARGET_NAME   ::= "R09_0803"          // Device name
SCAN_TIMEOUT  ::= Duration --ms=4000  // Single pass scanning time
RETRY_DELAY   ::= Duration --ms=1500  // Pause between scanning cycles
CLOSE_TIMEOUT ::= Duration --ms=5000  // Pause between measuring cycles

main:

  sync_time

  adapter := ble.Adapter
  central := adapter.central

  print "BLE central started. Looking for '$TARGET_NAME'..."

  while true :
    device/ble.RemoteScannedDevice? := find_device_by_name central TARGET_NAME
    if not device:
      print "Device '$TARGET_NAME' not found. Retrying in $RETRY_DELAY.in_ms ms..."
      sleep RETRY_DELAY
      continue

    print "Found target device: $device.identifier, rssi: $device.rssi dBm"

    // Trying to connect
    ble-remote-device/ble.RemoteDevice? := connect_with_retry central device
    if ble-remote-device :

      print "Connected successfully..."

      helper/BleHelper? := BleHelper device 

      rc/bool := helper.connect-services ble-remote-device

      if rc :
        error := catch --trace=false :
          helper.measure_battery
        if error :
          print "! $error !"  
          helper.dispose

      if not helper.is_running :
        print "sleep CLOSE_TIMEOUT"
        sleep CLOSE_TIMEOUT

    else:
      print "Failed to connect. Trying again via $RETRY_DELAY..."
      sleep RETRY_DELAY


find_device_by_name central/ble.Central name/string -> ble.RemoteScannedDevice? :
  found := null

  central.scan --duration=SCAN_TIMEOUT: | device/ble.RemoteScannedDevice |
    if device.data.name and device.data.name == name :
      if not found /*or device.rssi > found.rssi*/ :   // we take the one with the best signal
        found = device
      // can break if don't need the strongest signal
        return found

  return found

connect_with_retry central/ble.Central device/ble.RemoteScannedDevice -> ble.RemoteDevice?:
  retries := 3  //  1 - check error
  backoff := Duration --ms=500

  for i := 1; i <= retries; i++ :
    print "Attempting to connect $i/$retries to $device.identifier ..."
    catch --trace = false :
      client := central.connect device.identifier
      return client

    print "Connection error: waiting $backoff.in_ms ms"
    sleep backoff
    backoff *= 2   // exponential backoff

  print "Failed to connect after $retries attempts"
  return null

sync_time :
  now := Time.now
  if now < (Time.parse "2022-01-10T00:00:00Z"):
    result ::= ntp.synchronize
    if result:
      adjust-real-time-clock result.adjustment
      print "Set time to $Time.now by adjusting $result.adjustment"
    else:
      print "ntp: synchronization request failed"
  else:
    print "We already know the time is $now"
