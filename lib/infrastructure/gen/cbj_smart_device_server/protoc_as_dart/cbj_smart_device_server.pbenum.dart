///
//  Generated code. Do not modify.
//  source: cbj_smart_device_server.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class CbjDeviceTypes extends $pb.ProtobufEnum {
  static const CbjDeviceTypes typeNotSupported = CbjDeviceTypes._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'typeNotSupported');
  static const CbjDeviceTypes light = CbjDeviceTypes._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'light');
  static const CbjDeviceTypes blinds = CbjDeviceTypes._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'blinds');
  static const CbjDeviceTypes boiler = CbjDeviceTypes._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'boiler');
  static const CbjDeviceTypes button = CbjDeviceTypes._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'button');
  static const CbjDeviceTypes buttonWithLight = CbjDeviceTypes._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'buttonWithLight');
  static const CbjDeviceTypes hub = CbjDeviceTypes._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'hub');
  static const CbjDeviceTypes phoneApp = CbjDeviceTypes._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'phoneApp');
  static const CbjDeviceTypes computerApp = CbjDeviceTypes._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'computerApp');
  static const CbjDeviceTypes browserApp = CbjDeviceTypes._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'browserApp');
  static const CbjDeviceTypes smartComputer = CbjDeviceTypes._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'smartComputer');

  static const $core.List<CbjDeviceTypes> values = <CbjDeviceTypes> [
    typeNotSupported,
    light,
    blinds,
    boiler,
    button,
    buttonWithLight,
    hub,
    phoneApp,
    computerApp,
    browserApp,
    smartComputer,
  ];

  static final $core.Map<$core.int, CbjDeviceTypes> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CbjDeviceTypes? valueOf($core.int value) => _byValue[value];

  const CbjDeviceTypes._($core.int v, $core.String n) : super(v, n);
}

class CbjDeviceActions extends $pb.ProtobufEnum {
  static const CbjDeviceActions actionNotSupported = CbjDeviceActions._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'actionNotSupported');
  static const CbjDeviceActions on = CbjDeviceActions._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'on');
  static const CbjDeviceActions off = CbjDeviceActions._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'off');
  static const CbjDeviceActions moveUp = CbjDeviceActions._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'moveUp');
  static const CbjDeviceActions stop = CbjDeviceActions._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'stop');
  static const CbjDeviceActions moveDown = CbjDeviceActions._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'moveDown');
  static const CbjDeviceActions pressed = CbjDeviceActions._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'pressed');
  static const CbjDeviceActions longPress = CbjDeviceActions._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'longPress');
  static const CbjDeviceActions doubleTap = CbjDeviceActions._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'doubleTap');
  static const CbjDeviceActions position = CbjDeviceActions._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'position');
  static const CbjDeviceActions suspend = CbjDeviceActions._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'suspend');
  static const CbjDeviceActions shutdown = CbjDeviceActions._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'shutdown');
  static const CbjDeviceActions itIsFalse = CbjDeviceActions._(12, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'itIsFalse');
  static const CbjDeviceActions itIsTrue = CbjDeviceActions._(13, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'itIsTrue');

  static const $core.List<CbjDeviceActions> values = <CbjDeviceActions> [
    actionNotSupported,
    on,
    off,
    moveUp,
    stop,
    moveDown,
    pressed,
    longPress,
    doubleTap,
    position,
    suspend,
    shutdown,
    itIsFalse,
    itIsTrue,
  ];

  static final $core.Map<$core.int, CbjDeviceActions> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CbjDeviceActions? valueOf($core.int value) => _byValue[value];

  const CbjDeviceActions._($core.int v, $core.String n) : super(v, n);
}

class CbjWhenToExecute extends $pb.ProtobufEnum {
  static const CbjWhenToExecute undefined = CbjWhenToExecute._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'undefined');
  static const CbjWhenToExecute onOddNumberPress = CbjWhenToExecute._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'onOddNumberPress');
  static const CbjWhenToExecute evenNumberPress = CbjWhenToExecute._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'evenNumberPress');
  static const CbjWhenToExecute betweenSelectedTime = CbjWhenToExecute._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'betweenSelectedTime');
  static const CbjWhenToExecute doNotBetweenSelectedTime = CbjWhenToExecute._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'doNotBetweenSelectedTime');
  static const CbjWhenToExecute allTheTime = CbjWhenToExecute._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'allTheTime');
  static const CbjWhenToExecute never = CbjWhenToExecute._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'never');
  static const CbjWhenToExecute onceNow = CbjWhenToExecute._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'onceNow');
  static const CbjWhenToExecute onceInSelectedTime = CbjWhenToExecute._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'onceInSelectedTime');
  static const CbjWhenToExecute onlyIfDeviceListIsAreInActionListState = CbjWhenToExecute._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'onlyIfDeviceListIsAreInActionListState');
  static const CbjWhenToExecute atHome = CbjWhenToExecute._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'atHome');
  static const CbjWhenToExecute outOfHome = CbjWhenToExecute._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'outOfHome');

  static const $core.List<CbjWhenToExecute> values = <CbjWhenToExecute> [
    undefined,
    onOddNumberPress,
    evenNumberPress,
    betweenSelectedTime,
    doNotBetweenSelectedTime,
    allTheTime,
    never,
    onceNow,
    onceInSelectedTime,
    onlyIfDeviceListIsAreInActionListState,
    atHome,
    outOfHome,
  ];

  static final $core.Map<$core.int, CbjWhenToExecute> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CbjWhenToExecute? valueOf($core.int value) => _byValue[value];

  const CbjWhenToExecute._($core.int v, $core.String n) : super(v, n);
}

class CbjDeviceStateGRPC extends $pb.ProtobufEnum {
  static const CbjDeviceStateGRPC stateNotSupported = CbjDeviceStateGRPC._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'stateNotSupported');
  static const CbjDeviceStateGRPC cancelStateInProcess = CbjDeviceStateGRPC._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'cancelStateInProcess');
  static const CbjDeviceStateGRPC ack = CbjDeviceStateGRPC._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ack');
  static const CbjDeviceStateGRPC newStateFailed = CbjDeviceStateGRPC._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'newStateFailed');
  static const CbjDeviceStateGRPC waitingInComp = CbjDeviceStateGRPC._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'waitingInComp');

  static const $core.List<CbjDeviceStateGRPC> values = <CbjDeviceStateGRPC> [
    stateNotSupported,
    cancelStateInProcess,
    ack,
    newStateFailed,
    waitingInComp,
  ];

  static final $core.Map<$core.int, CbjDeviceStateGRPC> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CbjDeviceStateGRPC? valueOf($core.int value) => _byValue[value];

  const CbjDeviceStateGRPC._($core.int v, $core.String n) : super(v, n);
}

