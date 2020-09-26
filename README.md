# CyBear Jinni Smart Device

Welcome

This repository is in charge of controlling smart devices and is part of the [CyBear Jinni Smart Home](https://github.com/CyBear-Jinni/CBJ_Smart-Home.git) system.

These smart devices allow you to control lamps and blinds.
 
You can control these devices using physical buttons and from the [CyBear Jinni App](https://github.com/CyBear-Jinni/CBJ_App.git).

This part is using the snap store in order to have easy way to update all the devices software versions with new features and security updates.

[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/cybear-jinni)


## To get the project running

### Attention

* For now only NanoPi Duo2 is supported as smart device.

* You need to buy and solder the parts into the device yourself.


### Smart device preparations:

Copy [the script](https://github.com/CyBear-Jinni/CBJ_Smart-Device/blob/master/Scripts/Scripts_for_new_device/setup_new_smart_device.sh) to your device,
change the values wifiSsid into the name of your Wi-Fi and wifiPassword into the Wi-Fi password, it is necessary so that your device will be able to connect to the Wi-Fi.

Now run the script and it will configure and install the program to your device.

It is recommended to lock the IP of the smart device in the router settings if you intend to use the local option and not just the remote (that is using google Firebase platform).

The device is now ready.

Explanations on how to connect the device with the app will be given in the [CyBear Jinni App](https://github.com/CyBear-Jinni/CBJ_App.git) Readme file.


## Architecture

The code is based on DDD (Domain-Driven Design) principles, you can learn it from [here](https://www.youtube.com/watch?v=RMiN59x3uH0&list=PLB6lc7nQ1n4iS5p-IezFFgqP6YvAJy84U).

**Architecture diagram:**

<p align="center">
<img src="https://resocoder.com/wp-content/uploads/2020/03/DDD-Flutter-Diagram-v3.svg" width="400">
</p>


## Disclaimers

**Use at Your Own Risk,**
**we do not take responsibility on any outcome using anything in this repo.**

The project is under heavy work and may contain bugs and incorrect instructions.