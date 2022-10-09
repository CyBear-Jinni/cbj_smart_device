///
//  Generated code. Do not modify.
//  source: cbj_smart_device_server.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use cbjDeviceTypesDescriptor instead')
const CbjDeviceTypes$json = const {
  '1': 'CbjDeviceTypes',
  '2': const [
    const {'1': 'typeNotSupported', '2': 0},
    const {'1': 'light', '2': 1},
    const {'1': 'blinds', '2': 2},
    const {'1': 'boiler', '2': 3},
    const {'1': 'button', '2': 4},
    const {'1': 'buttonWithLight', '2': 5},
    const {'1': 'hub', '2': 7},
    const {'1': 'phoneApp', '2': 8},
    const {'1': 'computerApp', '2': 9},
    const {'1': 'browserApp', '2': 10},
    const {'1': 'smartComputer', '2': 11},
  ],
};

/// Descriptor for `CbjDeviceTypes`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cbjDeviceTypesDescriptor = $convert.base64Decode('Cg5DYmpEZXZpY2VUeXBlcxIUChB0eXBlTm90U3VwcG9ydGVkEAASCQoFbGlnaHQQARIKCgZibGluZHMQAhIKCgZib2lsZXIQAxIKCgZidXR0b24QBBITCg9idXR0b25XaXRoTGlnaHQQBRIHCgNodWIQBxIMCghwaG9uZUFwcBAIEg8KC2NvbXB1dGVyQXBwEAkSDgoKYnJvd3NlckFwcBAKEhEKDXNtYXJ0Q29tcHV0ZXIQCw==');
@$core.Deprecated('Use cbjDeviceActionsDescriptor instead')
const CbjDeviceActions$json = const {
  '1': 'CbjDeviceActions',
  '2': const [
    const {'1': 'actionNotSupported', '2': 0},
    const {'1': 'on', '2': 1},
    const {'1': 'off', '2': 2},
    const {'1': 'moveUp', '2': 3},
    const {'1': 'stop', '2': 4},
    const {'1': 'moveDown', '2': 5},
    const {'1': 'pressed', '2': 6},
    const {'1': 'longPress', '2': 7},
    const {'1': 'doubleTap', '2': 8},
    const {'1': 'position', '2': 9},
    const {'1': 'suspend', '2': 10},
    const {'1': 'shutdown', '2': 11},
    const {'1': 'itIsFalse', '2': 12},
    const {'1': 'itIsTrue', '2': 13},
  ],
};

/// Descriptor for `CbjDeviceActions`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cbjDeviceActionsDescriptor = $convert.base64Decode('ChBDYmpEZXZpY2VBY3Rpb25zEhYKEmFjdGlvbk5vdFN1cHBvcnRlZBAAEgYKAm9uEAESBwoDb2ZmEAISCgoGbW92ZVVwEAMSCAoEc3RvcBAEEgwKCG1vdmVEb3duEAUSCwoHcHJlc3NlZBAGEg0KCWxvbmdQcmVzcxAHEg0KCWRvdWJsZVRhcBAIEgwKCHBvc2l0aW9uEAkSCwoHc3VzcGVuZBAKEgwKCHNodXRkb3duEAsSDQoJaXRJc0ZhbHNlEAwSDAoIaXRJc1RydWUQDQ==');
@$core.Deprecated('Use cbjWhenToExecuteDescriptor instead')
const CbjWhenToExecute$json = const {
  '1': 'CbjWhenToExecute',
  '2': const [
    const {'1': 'undefined', '2': 0},
    const {'1': 'onOddNumberPress', '2': 1},
    const {'1': 'evenNumberPress', '2': 2},
    const {'1': 'betweenSelectedTime', '2': 3},
    const {'1': 'doNotBetweenSelectedTime', '2': 4},
    const {'1': 'allTheTime', '2': 5},
    const {'1': 'never', '2': 6},
    const {'1': 'onceNow', '2': 7},
    const {'1': 'onceInSelectedTime', '2': 8},
    const {'1': 'onlyIfDeviceListIsAreInActionListState', '2': 9},
    const {'1': 'atHome', '2': 10},
    const {'1': 'outOfHome', '2': 11},
  ],
};

/// Descriptor for `CbjWhenToExecute`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cbjWhenToExecuteDescriptor = $convert.base64Decode('ChBDYmpXaGVuVG9FeGVjdXRlEg0KCXVuZGVmaW5lZBAAEhQKEG9uT2RkTnVtYmVyUHJlc3MQARITCg9ldmVuTnVtYmVyUHJlc3MQAhIXChNiZXR3ZWVuU2VsZWN0ZWRUaW1lEAMSHAoYZG9Ob3RCZXR3ZWVuU2VsZWN0ZWRUaW1lEAQSDgoKYWxsVGhlVGltZRAFEgkKBW5ldmVyEAYSCwoHb25jZU5vdxAHEhYKEm9uY2VJblNlbGVjdGVkVGltZRAIEioKJm9ubHlJZkRldmljZUxpc3RJc0FyZUluQWN0aW9uTGlzdFN0YXRlEAkSCgoGYXRIb21lEAoSDQoJb3V0T2ZIb21lEAs=');
@$core.Deprecated('Use cbjDeviceStateGRPCDescriptor instead')
const CbjDeviceStateGRPC$json = const {
  '1': 'CbjDeviceStateGRPC',
  '2': const [
    const {'1': 'stateNotSupported', '2': 0},
    const {'1': 'cancelStateInProcess', '2': 1},
    const {'1': 'ack', '2': 2},
    const {'1': 'newStateFailed', '2': 3},
    const {'1': 'waitingInComp', '2': 4},
  ],
};

/// Descriptor for `CbjDeviceStateGRPC`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cbjDeviceStateGRPCDescriptor = $convert.base64Decode('ChJDYmpEZXZpY2VTdGF0ZUdSUEMSFQoRc3RhdGVOb3RTdXBwb3J0ZWQQABIYChRjYW5jZWxTdGF0ZUluUHJvY2VzcxABEgcKA2FjaxACEhIKDm5ld1N0YXRlRmFpbGVkEAMSEQoNd2FpdGluZ0luQ29tcBAE');
@$core.Deprecated('Use cbjClientStatusRequestsDescriptor instead')
const CbjClientStatusRequests$json = const {
  '1': 'CbjClientStatusRequests',
  '2': const [
    const {'1': 'allRemoteCommands', '3': 41, '4': 1, '5': 11, '6': '.CbjSmartDeviceConnections.CbjAllRemoteCommands', '10': 'allRemoteCommands'},
  ],
};

/// Descriptor for `CbjClientStatusRequests`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjClientStatusRequestsDescriptor = $convert.base64Decode('ChdDYmpDbGllbnRTdGF0dXNSZXF1ZXN0cxJdChFhbGxSZW1vdGVDb21tYW5kcxgpIAEoCzIvLkNialNtYXJ0RGV2aWNlQ29ubmVjdGlvbnMuQ2JqQWxsUmVtb3RlQ29tbWFuZHNSEWFsbFJlbW90ZUNvbW1hbmRz');
@$core.Deprecated('Use cbjRequestsAndStatusFromHubDescriptor instead')
const CbjRequestsAndStatusFromHub$json = const {
  '1': 'CbjRequestsAndStatusFromHub',
  '2': const [
    const {'1': 'allRemoteCommands', '3': 42, '4': 1, '5': 11, '6': '.CbjSmartDeviceConnections.CbjAllRemoteCommands', '10': 'allRemoteCommands'},
  ],
};

/// Descriptor for `CbjRequestsAndStatusFromHub`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjRequestsAndStatusFromHubDescriptor = $convert.base64Decode('ChtDYmpSZXF1ZXN0c0FuZFN0YXR1c0Zyb21IdWISXQoRYWxsUmVtb3RlQ29tbWFuZHMYKiABKAsyLy5DYmpTbWFydERldmljZUNvbm5lY3Rpb25zLkNiakFsbFJlbW90ZUNvbW1hbmRzUhFhbGxSZW1vdGVDb21tYW5kcw==');
@$core.Deprecated('Use cbjAllRemoteCommandsDescriptor instead')
const CbjAllRemoteCommands$json = const {
  '1': 'CbjAllRemoteCommands',
  '2': const [
    const {'1': 'smartDeviceInfo', '3': 40, '4': 1, '5': 11, '6': '.CbjSmartDeviceConnections.CbjSmartDeviceInfo', '10': 'smartDeviceInfo'},
  ],
};

/// Descriptor for `CbjAllRemoteCommands`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjAllRemoteCommandsDescriptor = $convert.base64Decode('ChRDYmpBbGxSZW1vdGVDb21tYW5kcxJXCg9zbWFydERldmljZUluZm8YKCABKAsyLS5DYmpTbWFydERldmljZUNvbm5lY3Rpb25zLkNialNtYXJ0RGV2aWNlSW5mb1IPc21hcnREZXZpY2VJbmZv');
@$core.Deprecated('Use cbjFirstSetupMessageDescriptor instead')
const CbjFirstSetupMessage$json = const {
  '1': 'CbjFirstSetupMessage',
  '2': const [
    const {'1': 'compInfo', '3': 38, '4': 1, '5': 11, '6': '.CbjSmartDeviceConnections.CbjCompSmartDeviceInfo', '10': 'compInfo'},
    const {'1': 'firebaseAccountInformation', '3': 39, '4': 1, '5': 11, '6': '.CbjSmartDeviceConnections.CbjFirebaseAccountInformation', '10': 'firebaseAccountInformation'},
  ],
};

/// Descriptor for `CbjFirstSetupMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjFirstSetupMessageDescriptor = $convert.base64Decode('ChRDYmpGaXJzdFNldHVwTWVzc2FnZRJNCghjb21wSW5mbxgmIAEoCzIxLkNialNtYXJ0RGV2aWNlQ29ubmVjdGlvbnMuQ2JqQ29tcFNtYXJ0RGV2aWNlSW5mb1IIY29tcEluZm8SeAoaZmlyZWJhc2VBY2NvdW50SW5mb3JtYXRpb24YJyABKAsyOC5DYmpTbWFydERldmljZUNvbm5lY3Rpb25zLkNiakZpcmViYXNlQWNjb3VudEluZm9ybWF0aW9uUhpmaXJlYmFzZUFjY291bnRJbmZvcm1hdGlvbg==');
@$core.Deprecated('Use cbjCompSmartDeviceInfoDescriptor instead')
const CbjCompSmartDeviceInfo$json = const {
  '1': 'CbjCompSmartDeviceInfo',
  '2': const [
    const {'1': 'compSpecs', '3': 21, '4': 1, '5': 11, '6': '.CbjSmartDeviceConnections.CbjCompSpecs', '10': 'compSpecs'},
    const {'1': 'smartDevicesInComp', '3': 28, '4': 3, '5': 11, '6': '.CbjSmartDeviceConnections.CbjSmartDeviceInfo', '10': 'smartDevicesInComp'},
  ],
};

/// Descriptor for `CbjCompSmartDeviceInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjCompSmartDeviceInfoDescriptor = $convert.base64Decode('ChZDYmpDb21wU21hcnREZXZpY2VJbmZvEkUKCWNvbXBTcGVjcxgVIAEoCzInLkNialNtYXJ0RGV2aWNlQ29ubmVjdGlvbnMuQ2JqQ29tcFNwZWNzUgljb21wU3BlY3MSXQoSc21hcnREZXZpY2VzSW5Db21wGBwgAygLMi0uQ2JqU21hcnREZXZpY2VDb25uZWN0aW9ucy5DYmpTbWFydERldmljZUluZm9SEnNtYXJ0RGV2aWNlc0luQ29tcA==');
@$core.Deprecated('Use cbjCompSpecsDescriptor instead')
const CbjCompSpecs$json = const {
  '1': 'CbjCompSpecs',
  '2': const [
    const {'1': 'compId', '3': 22, '4': 1, '5': 9, '10': 'compId'},
    const {'1': 'compUuid', '3': 23, '4': 1, '5': 9, '10': 'compUuid'},
    const {'1': 'compOs', '3': 24, '4': 1, '5': 9, '10': 'compOs'},
    const {'1': 'compModel', '3': 25, '4': 1, '5': 9, '10': 'compModel'},
    const {'1': 'compType', '3': 26, '4': 1, '5': 9, '10': 'compType'},
    const {'1': 'pubspecYamlVersion', '3': 27, '4': 1, '5': 9, '10': 'pubspecYamlVersion'},
  ],
};

/// Descriptor for `CbjCompSpecs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjCompSpecsDescriptor = $convert.base64Decode('CgxDYmpDb21wU3BlY3MSFgoGY29tcElkGBYgASgJUgZjb21wSWQSGgoIY29tcFV1aWQYFyABKAlSCGNvbXBVdWlkEhYKBmNvbXBPcxgYIAEoCVIGY29tcE9zEhwKCWNvbXBNb2RlbBgZIAEoCVIJY29tcE1vZGVsEhoKCGNvbXBUeXBlGBogASgJUghjb21wVHlwZRIuChJwdWJzcGVjWWFtbFZlcnNpb24YGyABKAlSEnB1YnNwZWNZYW1sVmVyc2lvbg==');
@$core.Deprecated('Use cbjMicrocontrollerSpecsDescriptor instead')
const CbjMicrocontrollerSpecs$json = const {
  '1': 'CbjMicrocontrollerSpecs',
  '2': const [
    const {'1': 'microcontrollerModel', '3': 31, '4': 1, '5': 9, '10': 'microcontrollerModel'},
    const {'1': 'microcontrollerType', '3': 32, '4': 1, '5': 9, '10': 'microcontrollerType'},
    const {'1': 'softwareVersion', '3': 33, '4': 1, '5': 9, '10': 'softwareVersion'},
  ],
};

/// Descriptor for `CbjMicrocontrollerSpecs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjMicrocontrollerSpecsDescriptor = $convert.base64Decode('ChdDYmpNaWNyb2NvbnRyb2xsZXJTcGVjcxIyChRtaWNyb2NvbnRyb2xsZXJNb2RlbBgfIAEoCVIUbWljcm9jb250cm9sbGVyTW9kZWwSMAoTbWljcm9jb250cm9sbGVyVHlwZRggIAEoCVITbWljcm9jb250cm9sbGVyVHlwZRIoCg9zb2Z0d2FyZVZlcnNpb24YISABKAlSD3NvZnR3YXJlVmVyc2lvbg==');
@$core.Deprecated('Use cbjSmartDeviceInfoDescriptor instead')
const CbjSmartDeviceInfo$json = const {
  '1': 'CbjSmartDeviceInfo',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'state', '3': 3, '4': 1, '5': 9, '10': 'state'},
    const {'1': 'defaultName', '3': 14, '4': 1, '5': 9, '10': 'defaultName'},
    const {'1': 'roomId', '3': 15, '4': 1, '5': 9, '10': 'roomId'},
    const {'1': 'senderDeviceModel', '3': 16, '4': 1, '5': 9, '10': 'senderDeviceModel'},
    const {'1': 'senderDeviceOs', '3': 17, '4': 1, '5': 9, '10': 'senderDeviceOs'},
    const {'1': 'senderId', '3': 18, '4': 1, '5': 9, '10': 'senderId'},
    const {'1': 'serverTimeStamp', '3': 19, '4': 1, '5': 9, '10': 'serverTimeStamp'},
    const {'1': 'stateMassage', '3': 20, '4': 1, '5': 9, '10': 'stateMassage'},
    const {'1': 'isComputer', '3': 29, '4': 1, '5': 8, '10': 'isComputer'},
    const {'1': 'compSpecs', '3': 30, '4': 1, '5': 11, '6': '.CbjSmartDeviceConnections.CbjCompSpecs', '10': 'compSpecs'},
    const {'1': 'microcontrollerSpecsSpecs', '3': 31, '4': 1, '5': 11, '6': '.CbjSmartDeviceConnections.CbjMicrocontrollerSpecs', '10': 'microcontrollerSpecsSpecs'},
    const {'1': 'deviceTypesActions', '3': 34, '4': 1, '5': 11, '6': '.CbjSmartDeviceConnections.CbjDeviceTypesActions', '10': 'deviceTypesActions'},
  ],
};

/// Descriptor for `CbjSmartDeviceInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjSmartDeviceInfoDescriptor = $convert.base64Decode('ChJDYmpTbWFydERldmljZUluZm8SDgoCaWQYASABKAlSAmlkEhQKBXN0YXRlGAMgASgJUgVzdGF0ZRIgCgtkZWZhdWx0TmFtZRgOIAEoCVILZGVmYXVsdE5hbWUSFgoGcm9vbUlkGA8gASgJUgZyb29tSWQSLAoRc2VuZGVyRGV2aWNlTW9kZWwYECABKAlSEXNlbmRlckRldmljZU1vZGVsEiYKDnNlbmRlckRldmljZU9zGBEgASgJUg5zZW5kZXJEZXZpY2VPcxIaCghzZW5kZXJJZBgSIAEoCVIIc2VuZGVySWQSKAoPc2VydmVyVGltZVN0YW1wGBMgASgJUg9zZXJ2ZXJUaW1lU3RhbXASIgoMc3RhdGVNYXNzYWdlGBQgASgJUgxzdGF0ZU1hc3NhZ2USHgoKaXNDb21wdXRlchgdIAEoCFIKaXNDb21wdXRlchJFCgljb21wU3BlY3MYHiABKAsyJy5DYmpTbWFydERldmljZUNvbm5lY3Rpb25zLkNiakNvbXBTcGVjc1IJY29tcFNwZWNzEnAKGW1pY3JvY29udHJvbGxlclNwZWNzU3BlY3MYHyABKAsyMi5DYmpTbWFydERldmljZUNvbm5lY3Rpb25zLkNiak1pY3JvY29udHJvbGxlclNwZWNzUhltaWNyb2NvbnRyb2xsZXJTcGVjc1NwZWNzEmAKEmRldmljZVR5cGVzQWN0aW9ucxgiIAEoCzIwLkNialNtYXJ0RGV2aWNlQ29ubmVjdGlvbnMuQ2JqRGV2aWNlVHlwZXNBY3Rpb25zUhJkZXZpY2VUeXBlc0FjdGlvbnM=');
@$core.Deprecated('Use cbjSmartDeviceStatusDescriptor instead')
const CbjSmartDeviceStatus$json = const {
  '1': 'CbjSmartDeviceStatus',
  '2': const [
    const {'1': 'onOffState', '3': 4, '4': 1, '5': 8, '10': 'onOffState'},
  ],
};

/// Descriptor for `CbjSmartDeviceStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjSmartDeviceStatusDescriptor = $convert.base64Decode('ChRDYmpTbWFydERldmljZVN0YXR1cxIeCgpvbk9mZlN0YXRlGAQgASgIUgpvbk9mZlN0YXRl');
@$core.Deprecated('Use cbjCommendStatusDescriptor instead')
const CbjCommendStatus$json = const {
  '1': 'CbjCommendStatus',
  '2': const [
    const {'1': 'success', '3': 5, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `CbjCommendStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjCommendStatusDescriptor = $convert.base64Decode('ChBDYmpDb21tZW5kU3RhdHVzEhgKB3N1Y2Nlc3MYBSABKAhSB3N1Y2Nlc3M=');
@$core.Deprecated('Use cbjSmartDeviceUpdateDetailsDescriptor instead')
const CbjSmartDeviceUpdateDetails$json = const {
  '1': 'CbjSmartDeviceUpdateDetails',
  '2': const [
    const {'1': 'smartDevice', '3': 6, '4': 1, '5': 11, '6': '.CbjSmartDeviceConnections.CbjSmartDeviceInfo', '10': 'smartDevice'},
    const {'1': 'newName', '3': 7, '4': 1, '5': 9, '10': 'newName'},
  ],
};

/// Descriptor for `CbjSmartDeviceUpdateDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjSmartDeviceUpdateDetailsDescriptor = $convert.base64Decode('ChtDYmpTbWFydERldmljZVVwZGF0ZURldGFpbHMSTwoLc21hcnREZXZpY2UYBiABKAsyLS5DYmpTbWFydERldmljZUNvbm5lY3Rpb25zLkNialNtYXJ0RGV2aWNlSW5mb1ILc21hcnREZXZpY2USGAoHbmV3TmFtZRgHIAEoCVIHbmV3TmFtZQ==');
@$core.Deprecated('Use cbjFirebaseAccountInformationDescriptor instead')
const CbjFirebaseAccountInformation$json = const {
  '1': 'CbjFirebaseAccountInformation',
  '2': const [
    const {'1': 'fireBaseProjectId', '3': 8, '4': 1, '5': 9, '10': 'fireBaseProjectId'},
    const {'1': 'fireBaseApiKey', '3': 9, '4': 1, '5': 9, '10': 'fireBaseApiKey'},
    const {'1': 'userEmail', '3': 10, '4': 1, '5': 9, '10': 'userEmail'},
    const {'1': 'userPassword', '3': 11, '4': 1, '5': 9, '10': 'userPassword'},
    const {'1': 'homeId', '3': 12, '4': 1, '5': 9, '10': 'homeId'},
  ],
};

/// Descriptor for `CbjFirebaseAccountInformation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjFirebaseAccountInformationDescriptor = $convert.base64Decode('Ch1DYmpGaXJlYmFzZUFjY291bnRJbmZvcm1hdGlvbhIsChFmaXJlQmFzZVByb2plY3RJZBgIIAEoCVIRZmlyZUJhc2VQcm9qZWN0SWQSJgoOZmlyZUJhc2VBcGlLZXkYCSABKAlSDmZpcmVCYXNlQXBpS2V5EhwKCXVzZXJFbWFpbBgKIAEoCVIJdXNlckVtYWlsEiIKDHVzZXJQYXNzd29yZBgLIAEoCVIMdXNlclBhc3N3b3JkEhYKBmhvbWVJZBgMIAEoCVIGaG9tZUlk');
@$core.Deprecated('Use cbjDeviceTypesActionsDescriptor instead')
const CbjDeviceTypesActions$json = const {
  '1': 'CbjDeviceTypesActions',
  '2': const [
    const {'1': 'deviceType', '3': 35, '4': 1, '5': 14, '6': '.CbjSmartDeviceConnections.CbjDeviceTypes', '10': 'deviceType'},
    const {'1': 'deviceAction', '3': 36, '4': 1, '5': 14, '6': '.CbjSmartDeviceConnections.CbjDeviceActions', '10': 'deviceAction'},
    const {'1': 'deviceStateGRPC', '3': 37, '4': 1, '5': 14, '6': '.CbjSmartDeviceConnections.CbjDeviceStateGRPC', '10': 'deviceStateGRPC'},
  ],
};

/// Descriptor for `CbjDeviceTypesActions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjDeviceTypesActionsDescriptor = $convert.base64Decode('ChVDYmpEZXZpY2VUeXBlc0FjdGlvbnMSSQoKZGV2aWNlVHlwZRgjIAEoDjIpLkNialNtYXJ0RGV2aWNlQ29ubmVjdGlvbnMuQ2JqRGV2aWNlVHlwZXNSCmRldmljZVR5cGUSTwoMZGV2aWNlQWN0aW9uGCQgASgOMisuQ2JqU21hcnREZXZpY2VDb25uZWN0aW9ucy5DYmpEZXZpY2VBY3Rpb25zUgxkZXZpY2VBY3Rpb24SVwoPZGV2aWNlU3RhdGVHUlBDGCUgASgOMi0uQ2JqU21hcnREZXZpY2VDb25uZWN0aW9ucy5DYmpEZXZpY2VTdGF0ZUdSUENSD2RldmljZVN0YXRlR1JQQw==');
