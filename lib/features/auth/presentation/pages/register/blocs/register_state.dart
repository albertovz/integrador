

import 'package:learnlinked/features/auth/domain/models/student.dart';
import 'package:learnlinked/features/auth/presentation/utils/validation_item.dart';

class RegisterState {
  ValidationItem name;
  ValidationItem lastname;
  ValidationItem phone;
  ValidationItem gender;
  ValidationItem email;
  ValidationItem password;
  ValidationItem institutionId;
  ValidationItem careerId;
  ValidationItem securityQuestion;
  ValidationItem securityAnswer;
  ValidationItem urlImg;

  RegisterState(
      {this.name = const ValidationItem(),
      this.lastname = const ValidationItem(),
      this.phone = const ValidationItem(),
      this.gender = const ValidationItem(),
      this.email = const ValidationItem(),
      this.password= const ValidationItem(),
      this.institutionId = const ValidationItem(),
      this.careerId = const ValidationItem(),
      this.securityQuestion = const ValidationItem(),
      this.securityAnswer = const ValidationItem(),
      this.urlImg = const ValidationItem()});

  toUser() => Student(
      name: name.value,
      lastname: lastname.value,
      phone: phone.value,
      gender: gender.value,
      email: email.value,
      password: password.value,
      institutionId: institutionId.value,
      careerId: careerId.value,
      securityQuestion: securityQuestion.value,
      securityAnswer: securityAnswer.value,
      urlImg: urlImg.value);

  bool isValid() {
    if (name.value.isEmpty ||
        lastname.error.isNotEmpty ||
        phone.value.isEmpty ||
        gender.error.isNotEmpty ||
        email.value.isEmpty ||
        password.error.isNotEmpty ||
        institutionId.value.isEmpty ||
        careerId.error.isNotEmpty ||
        securityQuestion.error.isNotEmpty ||
        securityAnswer.error.isNotEmpty) {
      return false;
    }
    return true;
  }

  RegisterState copyWith(
          {ValidationItem? name,
          ValidationItem? lastname,
          ValidationItem? phone,
          ValidationItem? gender,
          ValidationItem? email,
          ValidationItem? password,
          ValidationItem? institutionId,
          ValidationItem? careerId,
          ValidationItem? securityQuestion,
          ValidationItem? securityAnswer,
          ValidationItem? urlImg}) =>
      RegisterState(
          name: name ?? this.name,
          lastname: lastname ?? this.lastname,
          phone: phone ?? this.phone,
          gender: gender ?? this.gender,
          email: email ?? this.email,
          password: password ?? this.password,
          institutionId: institutionId ?? this.institutionId,
          careerId: careerId ?? this.careerId,
          securityQuestion: securityQuestion ?? this.securityQuestion,
          securityAnswer: securityAnswer ?? this.securityAnswer,
          urlImg: urlImg ?? this.urlImg,);
}
