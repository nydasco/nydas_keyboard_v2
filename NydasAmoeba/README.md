# Nydas Amoeba PCB

This 'per switch' PCB was designed from scratch however takes inspiration from the Amoeba King PCB. The goal was to deliver a PCB that was as small as possible that would accommodate per-key RGB, hotswap, and fit choc switches.

> Why not simply use the Amoeba King?

Simply put, I wanted the challenge of building something myself from scratch. 

> Do you have a 'how to'?

It is not my intent for others to use this PCB, however I have made it freely available on the off chance that anyone does want to. Hopefully it is fairly logical, however I've provided the below for anyone looking for extra information.

## Front
![Front of the PCB](https://github.com/nydasco/nydas_keyboard_v2/raw/main/NydasAmoeba/Images/front.png)

The front of the board contains all of the 'text'. Nothing should be soldered to this side. It's the side that the switch will sit on. 

Each of the pins have been labelled, and I've tried to provide a number of options. For example, you can connect to Ground on all for sides (for clarity, you don't need to connect to all of the Ground points - just make sure that one of the points is connected on each board). Row connectors are on the left and right and column connectors are top and bottom. The VCC should basically be daisy chained between switches.

The complexity comes with the Data In/Out points. This can be seen on the rear of the PCB.
## Rear
![Rear of the PCB](https://github.com/nydasco/nydas_keyboard_v2/raw/main/NydasAmoeba/Images/back.png)

The Data In/Out points link to the three pad solder points to the left and right of the SK6812-MINI-E space. You can choose which side is In and which side is Out by bridging the connection on the appropriate pads. Looking from the rear (using the above image) if you solder the middle and bottom pads on both the left and right blocks, your Data In is on the right (left if looking from the front) and Data Out is on the right (left if looking from the front). Alternatively you can bridge the top and middle pads and the in/out will be reversed. This allows you to daisy chain along a row, and then down to the next row and daisy chain back the other way (as opposed to having to run a full length of wire across your board at the ends of each row.

The 0603 0.1uF capacitor point is likely optional. It just helps maintain power for the RGB.

## Some More Pics
![Printed Front](https://github.com/nydasco/nydas_keyboard_v2/raw/main/NydasAmoeba/Images/printed_front.heic)
![Printed Rear](https://github.com/nydasco/nydas_keyboard_v2/raw/main/NydasAmoeba/Images/printed_rear.heic)
![Soldered Front](https://github.com/nydasco/nydas_keyboard_v2/raw/main/NydasAmoeba/Images/soldered_front.heic)
![Soldered Rear](https://github.com/nydasco/nydas_keyboard_v2/raw/main/NydasAmoeba/Images/soldered_rear.heic)
![With Switches](https://github.com/nydasco/nydas_keyboard_v2/raw/main/NydasAmoeba/Images/with_switches.heic)
![With Keys](https://github.com/nydasco/nydas_keyboard_v2/raw/main/NydasAmoeba/Images/with_keys.heic)

> What if I don't want RGB?

Simple. If you don't want RGB, save yourself the money and effort. You can go without the capacitor and the LED. You don't need to connect the VCC or Data In/Out on any of the switches.

That's probably about all there is to it. Feel free to have a tinker in KiCad and see if you can improve on the design.