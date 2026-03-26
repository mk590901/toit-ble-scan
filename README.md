# TOIT-BLE-SCAN App

## Introduction
The app on __Toit__ shown below, running on an ESP32-S3, enables continuous measurement of seven medical parameters using __COLMI R09__ or __R12__ _smart rings_: __heart rate__, __SpO2__, __blood pressure__, __temperature__, __HRV__, __stress__ and __blood sugar__. The patient does not need to be in the room where the chip is installed. The app continuously monitors the smart ring's availability and, if the connection is lost, attempts to reconnect to the device and resume measurements from where they were previously.

## Notes

> App using the ntp package (https://docs.toit.io/tutorials/misc/date-time)

> Command to run app:
```
micrcx@micrcx-desktop:~/toit/ble_scan$ jag run -d basic ble_scan_runner.toit
Scanning for device with name: 'basic'
Running 'ble_scan_runner.toit' on 'basic' ...
Success: Sent 86KB code to 'basic' in 3.58s
micrcx@micrcx-desktop:~/toit/ble_scan$ 
```
## Trace log
The trace log is given below:
```
micrcx@micrcx-desktop:~/toit/ble_scanner$ jag monitor -p /dev/ttyACM0
Starting serial monitor of port '/dev/ttyACM0' ...
2-b0f8-050daa4188e7 stopped
ar] INFO: program 7b318899-7b61-261ted
We already know the time is 2026-03-25T10:12:52.660529Z
BLE central started. Looking for 'R09_0803'...
Found target device: #[0x00, 0x30, 0x38, 0x47, 0x31, 0x08, 0x03], rssi: -83 dBm
Attempting to connect 1/3 to #[0x00, 0x30, 0x38, 0x47, 0x31, 0x082-b0f8-050daa4188e7 stopped
ESP-ROM:esp32s3-20210327
Build:Mar 27 2021
rst:0x1 (POWERON),boot:0x8 (SPI_FAST_FLASH_BOOT)
SPIWP:0xee
mode:DIO, clock div:1
load:0x3fce2810,len:0xe0
load:0x403c8700,len:0x4
load:0x403c8704,len:0xa3c
load:0x403cb700,len:0x2678
entry 0x403c8860
E (329) quad_psram: PSRAM ID read error: 0x00ffffff, PSRAM chip not found or not supported, or wrong PSRAM line mode
E (329) esp_psram: PSRAM enabled but initialization failed. Bailing out.
[toit] INFO: starting <v2.0.0-alpha.190>
[toit] DEBUG: clearing RTC memory: invalid checksum
[toit] INFO: running on ESP32S3 - revision 0.2
[wifi] DEBUG: connecting
E (3875) wifi:Association refused too many times, max allowed 1
[wifi] DEBUG: connected
[wifi] INFO: network address dynamically assigned through dhcp {ip: 192.168.1.151}
[wifi] INFO: dns server address dynamically assigned through dhcp {ip: [213.57.2.5, 213.57.22.5]}
[jaguar.http] INFO: running Jaguar device 'basic' (id: 'f36e943e-7d54-41da-b340-036e294cf1f8') on 'http://192.168.1.151:9000'
[jaguar] INFO: program b66a7652-5fc0-f03d-e821-787cb0126e19 started
ntp: synchronization request failed
BLE central started. Looking for 'R09_0803'...
Found target device: #[0x00, 0x30, 0x38, 0x47, 0x31, 0x08, 0x03], rssi: -91 dBm
Attempting to connect 1/3 to #[0x00, 0x30, 0x38, 0x47, 0x31, 0x08, 0x03] ...
Connected successfully...
battery level: [{battery: 80, charging: false}]
observation: 1
Device 'R09_0803' not found. Retrying in 1500 ms...
observation: 0
Timer deleted
next_step->stop-battery-level
sub-type->2
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
Device 'R09_0803' not found. Retrying in 1500 ms...
bp: (0/0 mmHg)
observation: 7
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
observation: 6
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
Device 'R09_0803' not found. Retrying in 1500 ms...
observation: 5
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
observation: 7
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
Device 'R09_0803' not found. Retrying in 1500 ms...
bp: (0/0 mmHg)
bp: (0/0 mmHg)
observation: 6
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
observation: 6
bp: (0/0 mmHg)
bp: (0/0 mmHg)
Device 'R09_0803' not found. Retrying in 1500 ms...
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
observation: 5
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
observation: 5
bp: (0/0 mmHg)
bp: (0/0 mmHg)
Device 'R09_0803' not found. Retrying in 1500 ms...
bp: (117/77 mmHg)
bp: (117/77 mmHg)
bp: (117/76 mmHg)
bp: (117/76 mmHg)
observation: 6
bp: (117/76 mmHg)
bp: (117/76 mmHg)
bp: (117/76 mmHg)
bp: (117/76 mmHg)
bp: (117/76 mmHg)
bp: (117/76 mmHg)
observation: 6
Device 'R09_0803' not found. Retrying in 1500 ms...
observation: 0
Timer deleted
next_step->stop-measure
{name: R09_0803, rssi: -91, mac: 30:38:47:31:08:03, battery: 80, charging: false, measure: bp, value: 117/76, units: mmHg, time: 1970/01/01 00:01:02.222}
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
Device 'R09_0803' not found. Retrying in 1500 ms...
hr: (0 bpm)
hr: (0 bpm)
observation: 7
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
observation: 6
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
Device 'R09_0803' not found. Retrying in 1500 ms...
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
observation: 6
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
observation: 6
hr: (0 bpm)
hr: (0 bpm)
Device 'R09_0803' not found. Retrying in 1500 ms...
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
observation: 6
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
observation: 6
hr: (0 bpm)
Device 'R09_0803' not found. Retrying in 1500 ms...
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
[wifi] DEBUG: closing
[wifi] DEBUG: connecting
hr: (0 bpm)
[wifi] DEBUG: connected
hr: (0 bpm)
observation: 6
hr: (0 bpm)
hr: (0 bpm)
[wifi] INFO: network address dynamically assigned through dhcp {ip: 192.168.1.151}
[wifi] INFO: dns server address dynamically assigned through dhcp {ip: [213.57.2.5, 213.57.22.5]}
[jaguar.http] INFO: running Jaguar device 'basic' (id: 'f36e943e-7d54-41da-b340-036e294cf1f8') on 'http://192.168.1.151:9000'
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
observation: 6
hr: (0 bpm)
Device 'R09_0803' not found. Retrying in 1500 ms...
hr: (0 bpm)
hr: (86 bpm)
hr: (86 bpm)
hr: (86 bpm)
hr: (86 bpm)
observation: 6
hr: (84 bpm)
hr: (84 bpm)
hr: (84 bpm)
hr: (84 bpm)
hr: (84 bpm)
Device 'R09_0803' not found. Retrying in 1500 ms...
hr: (84 bpm)
observation: 6
observation: 0
Timer deleted
next_step->stop-measure
{name: R09_0803, rssi: -91, mac: 30:38:47:31:08:03, battery: 80, charging: false, measure: hr, value: 84, units: bpm, time: 1970/01/01 00:01:36.312}
spo2: (0 %)
Device 'R09_0803' not found. Retrying in 1500 ms...
spo2: (0 %)
spo2: (0 %)
spo2: (0 %)
spo2: (0 %)
spo2: (0 %)
observation: 6
spo2: (0 %)
spo2: (0 %)
spo2: (0 %)
spo2: (0 %)
spo2: (0 %)
spo2: (0 %)
observation: 6
Device 'R09_0803' not found. Retrying in 1500 ms...
observation: 0
Timer deleted
next_step->stop-measure
{name: R09_0803, rssi: -91, mac: 30:38:47:31:08:03, battery: 80, charging: false, measure: spo2, value: Missing data, units: %, time: 1970/01/01 00:01:46.912}
------- requestToMeasute: NimBLE error, Type: host, error code: 0x07. No open connection -------
******* measure 11->[Write error] *******
unsubscribe->NimBLE error, Type: client, error code: 0x07. See https://gist.github.com/mikkeldamsgaard/0857ce6a8b073a52d6f07973a441ad54
BleHelper is disposed
Device 'R09_0803' not found. Retrying in 1500 ms...
Device 'R09_0803' not found. Retrying in 1500 ms...
Device 'R09_0803' not found. Retrying in 1500 ms...
Found target device: #[0x00, 0x30, 0x38, 0x47, 0x31, 0x08, 0x03], rssi: -84 dBm
Attempting to connect 1/3 to #[0x00, 0x30, 0x38, 0x47, 0x31, 0x08, 0x03] ...
Connected successfully...
battery level: [{battery: 80, charging: false}]
observation: 1
Device 'R09_0803' not found. Retrying in 1500 ms...
observation: 0
Timer deleted
next_step->stop-battery-level
sub-type->11
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
Device 'R09_0803' not found. Retrying in 1500 ms...
temp: (0 °C)
observation: 7
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
observation: 6
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
Device 'R09_0803' not found. Retrying in 1500 ms...
temp: (0 °C)
temp: (0 °C)
observation: 6
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
observation: 6
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
Device 'R09_0803' not found. Retrying in 1500 ms...
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
observation: 6
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
observation: 6
temp: (0 °C)
temp: (0 °C)
Device 'R09_0803' not found. Retrying in 1500 ms...
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
observation: 6
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
temp: (0 °C)
observation: 6
temp: (0 °C)
temp: (0 °C)
Device 'R09_0803' not found. Retrying in 1500 ms...
temp: (36.4 °C)
temp: (36.4 °C)
temp: (36.4 °C)
temp: (36.4 °C)
observation: 6
temp: (36.4 °C)
temp: (36.4 °C)
temp: (36.4 °C)
temp: (36.4 °C)
temp: (36.4 °C)
temp: (36.4 °C)
observation: 6
Device 'R09_0803' not found. Retrying in 1500 ms...
observation: 0
Timer deleted
next_step->stop-measure
{name: R09_0803, rssi: -84, mac: 30:38:47:31:08:03, battery: 80, charging: false, measure: temp, value: 36.4, units: °C, time: 1970/01/01 00:02:48.245}
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (0 mg/dL)
Device 'R09_0803' not found. Retrying in 1500 ms...
bs: (0 mg/dL)
bs: (0 mg/dL)
observation: 7
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (0 mg/dL)
observation: 6
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (0 mg/dL)
Device 'R09_0803' not found. Retrying in 1500 ms...
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (0 mg/dL)
observation: 6
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (0 mg/dL)
observation: 6
bs: (0 mg/dL)
bs: (0 mg/dL)
Device 'R09_0803' not found. Retrying in 1500 ms...
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (0 mg/dL)
observation: 6
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (0 mg/dL)
observation: 6
bs: (0 mg/dL)
Device 'R09_0803' not found. Retrying in 1500 ms...
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (0 mg/dL)
observation: 6
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (0 mg/dL)
Device 'R09_0803' not found. Retrying in 1500 ms...
bs: (0 mg/dL)
observation: 6
bs: (0 mg/dL)
bs: (0 mg/dL)
bs: (95 mg/dL)
bs: (90 mg/dL)
bs: (106 mg/dL)
bs: (92 mg/dL)
observation: 6
bs: (97 mg/dL)
bs: (90 mg/dL)
bs: (101 mg/dL)
bs: (99 mg/dL)
bs: (94 mg/dL)
Device 'R09_0803' not found. Retrying in 1500 ms...
bs: (103 mg/dL)
observation: 6
observation: 0
Timer deleted
next_step->stop-measure
{name: R09_0803, rssi: -84, mac: 30:38:47:31:08:03, battery: 80, charging: false, measure: bs, value: 103, units: mg/dL, time: 1970/01/01 00:03:22.481}
hrv: (0 ms)
hrv: (0 ms)
Device 'R09_0803' not found. Retrying in 1500 ms...
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
observation: 7
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
observation: 6
Device 'R09_0803' not found. Retrying in 1500 ms...
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
observation: 6
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
Device 'R09_0803' not found. Retrying in 1500 ms...
hrv: (0 ms)
observation: 6
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
observation: 6
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
Device 'R09_0803' not found. Retrying in 1500 ms...
hrv: (0 ms)
hrv: (0 ms)
observation: 6
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
observation: 6
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
Device 'R09_0803' not found. Retrying in 1500 ms...
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
observation: 6
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
observation: 6
hrv: (0 ms)
hrv: (0 ms)
Device 'R09_0803' not found. Retrying in 1500 ms...
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
observation: 6
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
observation: 6
hrv: (0 ms)
hrv: (0 ms)
Device 'R09_0803' not found. Retrying in 1500 ms...
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
observation: 6
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
observation: 6
hrv: (0 ms)
Device 'R09_0803' not found. Retrying in 1500 ms...
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
observation: 7
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
Device 'R09_0803' not found. Retrying in 1500 ms...
hrv: (0 ms)
observation: 6
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
observation: 5
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
Device 'R09_0803' not found. Retrying in 1500 ms...
hrv: (0 ms)
hrv: (0 ms)
observation: 7
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
hrv: (0 ms)
observation: 6
hrv: (47 ms)
Device 'R09_0803' not found. Retrying in 1500 ms...
observation: 1
observation: 0
Timer deleted
next_step->stop-measure
{name: R09_0803, rssi: -84, mac: 30:38:47:31:08:03, battery: 80, charging: false, measure: hrv, value: 47, units: ms, time: 1970/01/01 00:04:24.002}
stress: (0 )
Device 'R09_0803' not found. Retrying in 1500 ms...
stress: (0 )
stress: (0 )
stress: (0 )
stress: (0 )
stress: (0 )
stress: (0 )
observation: 7
stress: (0 )
stress: (0 )
stress: (0 )
stress: (0 )
stress: (0 )
Device 'R09_0803' not found. Retrying in 1500 ms...
stress: (0 )
observation: 6
stress: (0 )
stress: (0 )
stress: (0 )
stress: (0 )
stress: (0 )
stress: (0 )
observation: 6
stress: (0 )
stress: (0 )
stress: (0 )
stress: (0 )
Device 'R09_0803' not found. Retrying in 1500 ms...
stress: (0 )
stress: (0 )
observation: 6
stress: (0 )
stress: (0 )
stress: (0 )
stress: (0 )
stress: (0 )
stress: (0 )
observation: 6
stress: (0 )
stress: (0 )
stress: (0 )
Device 'R09_0803' not found. Retrying in 1500 ms...
stress: (0 )
stress: (0 )
stress: (0 )
observation: 6
stress: (0 )
stress: (0 )
stress: (0 )
stress: (0 )
stress: (0 )
stress: (0 )
observation: 6
stress: (0 )
stress: (0 )
Device 'R09_0803' not found. Retrying in 1500 ms...
stress: (0 )
stress: (0 )
impNotification 12
Notification->{battery: 79, charging: false}
stress: (0 )
stress: (0 )
observation: 7
stress: (0 )
stress: (0 )
stress: (47 )
stress: (47 )
stress: (46 )
stress: (46 )
observation: 6
stress: (46 )
Device 'R09_0803' not found. Retrying in 1500 ms...
stress: (46 )
stress: (46 )
stress: (46 )
stress: (46 )
stress: (46 )
observation: 6
observation: 0
Timer deleted
next_step->stop-measure
{name: R09_0803, rssi: -84, mac: 30:38:47:31:08:03, battery: 79, charging: false, measure: stress, value: 46, units: , time: 1970/01/01 00:04:58.132}
Device 'R09_0803' not found. Retrying in 1500 ms...
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
observation: 7
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
Device 'R09_0803' not found. Retrying in 1500 ms...
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
observation: 6
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
observation: 6
bp: (0/0 mmHg)
bp: (0/0 mmHg)
Device 'R09_0803' not found. Retrying in 1500 ms...
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
observation: 6
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
observation: 6
bp: (0/0 mmHg)
Device 'R09_0803' not found. Retrying in 1500 ms...
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
observation: 6
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
observation: 6
Device 'R09_0803' not found. Retrying in 1500 ms...
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (0/0 mmHg)
observation: 6
bp: (0/0 mmHg)
bp: (0/0 mmHg)
bp: (126/90 mmHg)
bp: (126/90 mmHg)
bp: (126/90 mmHg)
Device 'R09_0803' not found. Retrying in 1500 ms...
bp: (126/90 mmHg)
observation: 6
bp: (126/90 mmHg)
bp: (126/90 mmHg)
bp: (126/90 mmHg)
bp: (126/90 mmHg)
bp: (126/92 mmHg)
bp: (126/92 mmHg)
observation: 6
Device 'R09_0803' not found. Retrying in 1500 ms...
observation: 0
Timer deleted
next_step->stop-measure
{name: R09_0803, rssi: -84, mac: 30:38:47:31:08:03, battery: 79, charging: false, measure: bp, value: 126/92, units: mmHg, time: 1970/01/01 00:05:32.332}
------- requestToMeasute: NimBLE error, Type: host, error code: 0x07. No open connection -------
******* measure 1->[Write error] *******
unsubscribe->NimBLE error, Type: client, error code: 0x07. See https://gist.github.com/mikkeldamsgaard/0857ce6a8b073a52d6f07973a441ad54
BleHelper is disposed
Device 'R09_0803' not found. Retrying in 1500 ms...
Device 'R09_0803' not found. Retrying in 1500 ms...
Device 'R09_0803' not found. Retrying in 1500 ms...
Device 'R09_0803' not found. Retrying in 1500 ms...
Device 'R09_0803' not found. Retrying in 1500 ms...
Device 'R09_0803' not found. Retrying in 1500 ms...
Found target device: #[0x00, 0x30, 0x38, 0x47, 0x31, 0x08, 0x03], rssi: -89 dBm
Attempting to connect 1/3 to #[0x00, 0x30, 0x38, 0x47, 0x31, 0x08, 0x03] ...
Connection error: waiting 500 ms
Attempting to connect 2/3 to #[0x00, 0x30, 0x38, 0x47, 0x31, 0x08, 0x03] ...
Connection error: waiting 1000 ms
Attempting to connect 3/3 to #[0x00, 0x30, 0x38, 0x47, 0x31, 0x08, 0x03] ...
Connection error: waiting 2000 ms
Failed to connect after 3 attempts
Failed to connect. Trying again via 1.5s...
Found target device: #[0x00, 0x30, 0x38, 0x47, 0x31, 0x08, 0x03], rssi: -89 dBm
Attempting to connect 1/3 to #[0x00, 0x30, 0x38, 0x47, 0x31, 0x08, 0x03] ...
Connection error: waiting 500 ms
Attempting to connect 2/3 to #[0x00, 0x30, 0x38, 0x47, 0x31, 0x08, 0x03] ...
Connected successfully...
battery level: [{battery: 79, charging: false}]
observation: 1
Device 'R09_0803' not found. Retrying in 1500 ms...
observation: 0
Timer deleted
next_step->stop-battery-level
sub-type->1
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
Device 'R09_0803' not found. Retrying in 1500 ms...
observation: 6
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
observation: 7
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
Device 'R09_0803' not found. Retrying in 1500 ms...
hr: (0 bpm)
hr: (0 bpm)
observation: 6
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
observation: 6
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
Device 'R09_0803' not found. Retrying in 1500 ms...
hr: (0 bpm)
hr: (0 bpm)
observation: 6
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
observation: 6
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
Device 'R09_0803' not found. Retrying in 1500 ms...
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
observation: 6
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
hr: (0 bpm)
observation: 6
hr: (0 bpm)
hr: (0 bpm)
Device 'R09_0803' not found. Retrying in 1500 ms...
hr: (84 bpm)
hr: (84 bpm)
hr: (84 bpm)
hr: (84 bpm)
observation: 6
hr: (84 bpm)
hr: (84 bpm)
hr: (85 bpm)
hr: (85 bpm)
hr: (85 bpm)
hr: (85 bpm)
observation: 6
Device 'R09_0803' not found. Retrying in 1500 ms...
^C
Interrupt received, shutting down gracefully...
Error: context canceled
micrcx@micrcx-desktop:~/toit/ble_scanner$ 
```
