import 'package:flutter/material.dart';
import 'package:mini_apps/common/enum_state.dart';

class BaseViewModel extends ChangeNotifier {
  RequestState _state = RequestState.empty;
  RequestState get state => _state;
  set stateChange(RequestState state) {
    _state = state;
    notifyListeners();
  }

  String _errMsg = "";
  String get errMsg => _errMsg;
  set errMsgChange(String errMsg) {
    _errMsg = errMsg;
    notifyListeners();
  }
}
