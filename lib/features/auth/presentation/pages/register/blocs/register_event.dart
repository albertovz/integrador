import 'dart:async';
import 'package:flutter/material.dart';
import 'package:learnlinked/features/auth/presentation/pages/register/blocs/register_state.dart';
import 'package:learnlinked/features/auth/presentation/utils/validation_item.dart';

class RegisterEvent extends ChangeNotifier {
  // ESATADO
  RegisterState _state = RegisterState();
  RegisterState get state => _state;

  // StreamController<Resource> _responseController = StreamController<Resource>();
  // Stream<Resource> get response => _responseController.stream;

  // USE CASE
  // AuthUseCases _authUseCases;
  // InstitutionsUseCases _institutionsUseCases;

  RegisterEvent();

  // Stream<Resource<List<Institution>>> getInstitutions() => _institutionsUseCases.getInstitutions.launch();

  register() async {
    final data = _state.toUser();

    print('Nombre: ${_state.name.value}');
    print('Apellidos ${_state.lastname.value}');
    print('Número telefónico: ${_state.phone.value}');
    print('Email: ${_state.email.value}');
    print('Contraseña: ${_state.password.value}');
    print('Institución: ${_state.institutionId.value}');
    print('Carreraa: ${_state.careerId.value}');
    print('Género: ${_state.gender.value}');
    print('Pregunta de seguridad: ${_state.securityQuestion.value}');
    print('Respuesta de seguridad: ${_state.securityAnswer.value}');

    if (_state.isValid()) {
      print('Formulario válido');

      // await _authUseCases.register.launch(data);
    } else {
      print('Formulario inválido');
    }
  }

  // loadInstitutions() async {
  //   await _institutionsUseCases.getInstitutions.launch();
  // }

  changeInstitution(String value) {
    print('Valor de institution: ${value}');
    _state =
        _state.copyWith(institutionId: ValidationItem(value: value, error: ''));
    notifyListeners();
  }

  changeCareer(String value) {
    print('Valor de la carrera: ${value}');
    _state = _state.copyWith(careerId: ValidationItem(value: value, error: ''));
    notifyListeners();
  }

  changeEmail(String value) {
    // _responseController.add(Init());
    final bool emailFormatValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    if (!emailFormatValid) {
      _state = _state.copyWith(
          email: const ValidationItem(error: 'No es un email válido'));
    } else if (value.length >= 6) {
      _state = state.copyWith(email: ValidationItem(value: value, error: ''));
    } else {
      _state = state.copyWith(
          email: const ValidationItem(error: 'Al menos 6 carácteres'));
    }
    notifyListeners();
  }

  changeName(String value) {
    _state = _state.copyWith(name: ValidationItem(value: value, error: ''));
    notifyListeners();
  }

  changePassword(String value) {
    // _responseController.add(Init());
    if (value.length >= 4) {
      _state =
          state.copyWith(password: ValidationItem(value: value, error: ''));
    } else {
      _state = state.copyWith(
          password: const ValidationItem(error: 'Al menos 4 carácteres'));
    }
    notifyListeners();
  }

  changeLastname(String value) {
    _state = _state.copyWith(lastname: ValidationItem(value: value, error: ''));
    notifyListeners();
  }

  changePhone(String value) {
    // _responseController.add(Init());

    // Utiliza una expresión regular para verificar que solo hay dígitos
    final RegExp regex = RegExp(r'^\d+$');

    if (regex.hasMatch(value)) {
      if (value.length >= 10) {
        _state = state.copyWith(phone: ValidationItem(value: value, error: ''));
      } else {
        _state = state.copyWith(
            phone: const ValidationItem(error: 'Al menos 10 caracteres'));
      }
    } else {
      // Si hay caracteres no numéricos, muestra un mensaje de error
      _state = state.copyWith(
          phone: const ValidationItem(error: 'Ingrese solo dígitos'));
    }

    notifyListeners();
  }

  changeGender(String value) {
    print('Género: ${value}');
    _state = _state.copyWith(gender: ValidationItem(value: value, error: ''));
    notifyListeners();
  }

  changeSecurityQuestion(String value) {
    _state = _state.copyWith(
        securityQuestion: ValidationItem(value: value, error: ''));
    notifyListeners();
  }

  changeSecurityAnswer(String value) {
    _state = _state.copyWith(
        securityAnswer: ValidationItem(value: value, error: ''));
    notifyListeners();
  }

  changeUrlImg() {
    _state = _state.copyWith(urlImg: ValidationItem(value: '', error: ''));
    notifyListeners();
  }
}
