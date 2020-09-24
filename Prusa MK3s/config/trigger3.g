; Loading Filament Script during Print with less retract 

M300 S800 P200
M581 P1 T2 S-1 R0 ; Filaent Sensor does not listen anymore (S-1). Autoload is disabled. 
M291 P"Please wait while the nozzle is being heated up" R"Loading PLA" T5 ; Display message
T0 ; Activate Hotend
M291 P"Feeding filament Trigger3" R"Loading PLA" T5 ; Display new message
G1 E70 F800 ; Feed 70mm of filament at 800mm/min
G1 E55 F300 ; Feed 50mm of filament at 300mm/min
G4 P1000 ; Wait one second
G1 E-1 F800 ; Retract 1mm of filament at 800mm/min
M400 ; Wait for moves to complete
M292 ; Hide the message

; Filament Sensor Port and Runout Feature ON
M581 P1 T3 S-1 R0 ; Filaent Sensor does not listen anymore (S-1). Autoload is disabled. 
M950 J1 C"nil" ; Input 1 e0 Filament Sensor 
M591 D0 P2 C"e0stop" S1 ; Filament Runout Sensor
