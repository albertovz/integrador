import 'package:flutter/material.dart';
import 'package:learnlinked/features/auth/presentation/pages/login/blocs/login_state.dart';
import 'package:learnlinked/features/auth/presentation/utils/validation_item.dart';

class LoginEvent extends ChangeNotifier {
  LoginState _state = LoginState();
  LoginState get state => _state;

  void login() async {
    print('imprimiendo login correctamente');
    print('Email: ${_state.email.value}');
    print('Contraseña: ${_state.password.value}');
    // if (state.isValid()) {
    //   _responseController.add(Loading());
    //   final data = await _authUseCases.login
    //       .launch(email: _state.email.value, password: _state.password.value);
    //   _responseController.add(data);
    // }
  }

  void changeEmail(String value) {
    // _responseController.add(Init());
    final bool emailFormatValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    if (!emailFormatValid) {
      _state = _state.copyWith(
          email: const ValidationItem(error: 'No es un email válido'));
    } else if (value.length >= 6) {
      _state = _state.copyWith(email: ValidationItem(value: value, error: ''));
    } else {
      _state = _state.copyWith(
          email: const ValidationItem(error: 'Al menos 6 carácteres'));
    }

    notifyListeners();
  }

  void changePassword(String value) {
    // _responseController.add(Init());
    if (value.length >= 6) {
      _state =
          _state.copyWith(password: ValidationItem(value: value, error: ''));
    } else {
      _state = _state.copyWith(
          password: const ValidationItem(error: 'Al menos 6 carácteres'));
    }

    notifyListeners();
  }
}
