; Configuration file for Duet WiFi (firmware version 3.3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.3.10 on Sun Mar 20 2022 16:46:49 GMT+0000 (Greenwich Mean Time)

; General preferences
G90                                                ; send absolute coordinates...
M83                                                ; ...but relative extruder moves
M550 P"VIVEDINO"                                   ; set printer name
M669 K1                                            ; select CoreXY mode

; Network
M550 P"VIVEDINO"                         ; Set machine name
M552 S1
;M587 S"your wifi network" P"your wifi password"
M586 P0 S1                               ; Enable HTTP
M586 P1 S0                               ; Disable FTP
M586 P2 S0                               ; Disable Telnet
M575 P1 B115200 S1                          ; enable support for PanelDue

; Drives
M569 P0 S1                                         ; physical drive 0 goes forwards
M569 P1 S1                                         ; physical drive 1 goes forwards
M569 P2 R-1                                         ; physical drive 2 disabled
M569 P3 S1                                         ; physical drive 3 goes forwards
M569 P4 R-1                                         ; physical drive 4 disabled

; -- duex --
M569 P5 S1  ; Z5
M569 P6 S0	; Z6
M569 P7 S1	; Z7
M569 P8 S0	; Z8
M569 P9 R-1                                         ; physical drive 9 disabled

M584 X0 Y1 E3 Z6:5:8:7                                   ; set drive mapping
M350 X16 Y16 Z16 E16 I1                            ; configure microstepping with interpolation
M92  X80 Y80 Z400 E727                 ; set steps per mm
M566 X2000 Y2000 Z602.65 E250                ; set maximum instantaneous speed changes (mm/min)
M203 X20000 Y20000 Z6000 E3200            ; set maximum speeds (mm/min)
M201 X1500 Y1500 Z500 E3200                ; set accelerations (mm/s^2)
M906 X1200 Y1200 Z1200 E300 I60		              	  ; motor currents (mA) and motor idle factor in per cent
M84 S30                                            ; Set idle timeout
M671 X-50:-50:370:370 Y330:-65:-65:330 S20          ; Z belts at 4 corners

M667 S1                                            ; select CoreXY mode

; Axis Limits
M208 X5 Y0 Z0 S1                                   ; set axis minima to end of safe travel.
M208 X310 Y308 Z410 S0                             ; set axis maxima to match endstop location.

; Endstops
M574 X2 S1 P"xstop"                                ; configure switch-type (e.g. microswitch) endstop for low end on X via pin xstop
M574 Y2 S1 P"ystop"                                ; configure switch-type (e.g. microswitch) endstop for low end on Y via pin ystop
M574 Z1 S0                                         ; configure Z-probe endstop

; Z-Probe
S0 C"duex.pwm5" ; create servo pin 0 for BLTouch
M558 P9 C"^zprobe.in" H5 F120 T6000 ; Duet 2 WiFi/Ethernet, DueX2/5
G31 X20 Y0 Z3.3 P25

M557 X10:290 Y21:290 S50                 ; Define mesh grid

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B4138     ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bedheat" T0                              ; create bed heater output on bedheat and map it to sensor 0
M307 H0 B0 S1.00                                   ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                            ; map heated bed to heater 0
M143 H0 S120                                       ; set temperature limit for heater 0 to 120C
M308 S1 P"e0temp" Y"thermistor" T100000 B4138      ; configure sensor 1 as thermistor on pin e0temp
M950 H1 C"e0heat" T1                               ; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 B0 S1.00                                   ; disable bang-bang mode for heater  and set PWM limit
M143 H1 S280                                       ; set temperature limit for heater 1 to 280C

; Fans
M950 F0 C"fan0" Q500                               ; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H-1                                     ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"fan1" Q500                               ; create fan 1 on pin fan1 and set its frequency
M106 P1 S1 H1 T45                                  ; set fan 1 value. Thermostatic control is turned on

; Tools
M563 P0 D0 H1 F0                                   ; define tool 0
G10 P0 X0 Y0 Z0                                    ; set tool 0 axis offsets
G10 P0 R0 S0                                       ; set initial tool 0 active and standby temperatures to 0C

; Custom settings
; --- RGB leds - White ---
;M950 P3 C"duex.fan3" Q250		   					; create pin 3 on pin fan3 and set its frequency
;M106 P3 S255 					   					; not used for the moment
M950 P4 C"duex.fan4"			   					; create pin 24 on pin fan4 and set its frequency
M42 P4 S255 					   					; G-
M950 P5 C"duex.fan5"			   					; create pin 25 on pin fan5 and set its frequency
M42 P5 S255 					   					; R-
M950 P6 C"duex.fan6"			   					; create pin 26 on pin fan6 and set its frequency
M42 P6 S255 					   					; B-

; ---filament sensing---
M591 D0 P1 C3 S1

; Miscellaneous
M501                                               ; load saved parameters from non-volatile memory
M911 S10 R11 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000" ; set voltage thresholds and actions to run on power loss

