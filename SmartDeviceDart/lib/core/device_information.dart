

///  Save data about the device, is it remote or local, what pin/ip does it have
class DeviceInformation {

  DeviceInformation(this._uuid, this._name);

  ///  uuid of the device
  final String _uuid;

  ///  Name of the device
  final String _name;

  //  Getters

  String getUuid() => _uuid;

  String getName() => _name;
}

class RemoteDevice extends DeviceInformation {

  RemoteDevice(String uuid, String name, this.ip)
      : super(uuid, name);

  ///  Ip of the device
  String ip;


  //  Get


  String getIp() => ip;
}

class LocalDevice extends DeviceInformation {

  LocalDevice(String uuid, String name) : super(uuid, name);
}
