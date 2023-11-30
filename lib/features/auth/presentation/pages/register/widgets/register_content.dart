import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:learnlinked/features/auth/presentation/pages/register/blocs/register_event.dart';
import 'package:learnlinked/features/auth/presentation/utils/base_color.dart';
import 'package:learnlinked/features/auth/presentation/utils/show_policy.dart';
import 'package:learnlinked/widgets/default_button.dart';
import 'package:learnlinked/widgets/default_textfield.dart';

class RegisterContent extends StatelessWidget {
  RegisterEvent vm;
  List<String> list = <String>[
    'Universidad Politécnica de Chiapas',
    'Universidad Autónoma de Chiapas'
  ];
  List<String> genero = <String>['Masculino', 'Femenino', 'Otro'];
  List<String> careers = <String>[
    'Ingeniería Mecatrónica',
    'Ingeniería Tecnología Ambiental',
    'Ingeniería Biomédica',
    "Ingeniería en Software",
    "Ingenería en Tecnologías de Manufactura",
    "Ingeniería Petrolera",
    "Administración y Gestión Empresarial",
    "Ingeniería en Nanotecnología"
  ];
  List<String> questions = <String>[
    'Nombre de tu primer mascota',
    'Color favorito',
    'Comida favorita'
  ];
  late String dropdownValue = '';
  late String dropdownGenderValue = '';
  late String dropdownCareerValue = '';
  late String dropdownQuestionValue = '';

  RegisterContent(this.vm) {
    dropdownValue = list.first;
    dropdownGenderValue = genero.first;
    dropdownCareerValue = careers.first;
    dropdownQuestionValue = questions.first;
    // print('Instituciones: ${institution.name}');
    // vm.loadInstitutions();
  }

  // Stream<Resource<List<Institution>>> getInstitutions() => _institutionsUseCases.getInstitutions.launch();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.27,
              color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(top: 50, left: 15),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 35,
                          ))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/img/logo.jpg',
                        height: 100,
                        width: 150,
                      ),
                      const Text(
                        'Learn Linked',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, top: 15),
            child: const Text(
              'Continúa con tu',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: const Text(
              'Registro',
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            child: DefaultTextfield(
                label: 'Nombre',
                icon: Icons.person_outline,
                error: vm.state.name.error,
                onChanged: (value) {
                  vm.changeName(value);
                }),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: DefaultTextfield(
                label: 'Apellidos',
                icon: Icons.person_outline,
                error: vm.state.lastname.error,
                onChanged: (value) {
                  vm.changeLastname(value);
                }),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: DefaultTextfield(
                label: 'Número telefónico',
                icon: Icons.phone_callback,
                error: vm.state.phone.error,
                onChanged: (value) {
                  vm.changePhone(value);
                }),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: DefaultTextfield(
                label: 'Correo electrónico',
                icon: Icons.email_outlined,
                error: vm.state.email.error,
                onChanged: (value) {
                  vm.changeEmail(value);
                }),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: DefaultTextfield(
                label: 'Contraseña',
                icon: Icons.lock_outline,
                obscureTexT: true,
                error: vm.state.password.error,
                onChanged: (value) {
                  vm.changePassword(value);
                }),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
            child: const Text(
              'Seleccione una institución: ',
              style: TextStyle(color: LETTER_COLOR, fontSize: 16),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: DropdownButton<String>(
              dropdownColor: Colors.white,
              onChanged: (value) {
                // vm.changeInstitution(value!);
                // dropdownValue = vm.changeInstitution(value!);
                // dropdownValue = vm.state.institutionId.value;
                int selectedIndex = list.indexOf(value!) + 1;
                vm.changeInstitution(selectedIndex.toString());
              },
              value: dropdownValue,
              items: list.map<DropdownMenuItem<String>>((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(color: LETTER_COLOR),
                  ),
                );
              }).toList(),
              underline: Container(
                height: 1, // Altura del recuadro
                color: Colors.red, // Cambia esto al color que desees
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: const Text(
              'Seleccione una carrera: ',
              style: TextStyle(color: LETTER_COLOR, fontSize: 16),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: DropdownButton<String>(
                dropdownColor: Colors.white,
                onChanged: (String? value) {
                  // dropdownValue = vm.changeInstitution(value!);
                  dropdownCareerValue = vm.state.institutionId.value;
                  int selectedIndex = list.indexOf(value!) + 1;
                  vm.changeCareer(selectedIndex.toString());
                },
                value: dropdownCareerValue,
                items: careers.map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(color: LETTER_COLOR),
                    ),
                  );
                }).toList(),
                underline: Container(
                  height: 1, // Altura del recuadro
                  color: Colors.red, // Cambia esto al color que desees
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
            child: const Text(
              'Género: ',
              style: TextStyle(color: LETTER_COLOR, fontSize: 16),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: DropdownButton<String>(
              dropdownColor: Colors.white,
              onChanged: (String? value) {
                vm.changeGender(value!);
                // dropdownValue = vm.changeInstitution(value!);
                dropdownGenderValue = vm.state.gender.value;
              },
              value: dropdownGenderValue,
              items: genero.map<DropdownMenuItem<String>>((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(color: LETTER_COLOR),
                  ),
                );
              }).toList(),
              underline: Container(
                height: 1, // Altura del recuadro
                color: Colors.red, // Cambia esto al color que desees
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
            child: const Text(
              'Seleccione una pregunta de seguridad: ',
              style: TextStyle(color: LETTER_COLOR, fontSize: 16),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: DropdownButton<String>(
              dropdownColor: Colors.white,
              onChanged: (String? value) {
                vm.changeSecurityQuestion(value!);
                // dropdownValue = vm.changeInstitution(value!);
                dropdownQuestionValue = vm.state.securityQuestion.value;
                int selectedIndex = questions.indexOf(value);
                vm.changeSecurityQuestion(selectedIndex.toString());
              },
              value: dropdownQuestionValue,
              items: questions.map<DropdownMenuItem<String>>((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(color: LETTER_COLOR),
                  ),
                );
              }).toList(),
              underline: Container(
                height: 1, // Altura del recuadro
                color: Colors.red, // Cambia esto al color que desees
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: DefaultTextfield(
                label: 'Respuesta',
                icon: Icons.question_answer,
                error: vm.state.securityAnswer.error,
                onChanged: (value) {
                  vm.changeSecurityAnswer(value);
                }),
          ),
          // Container(
          //   height: 450,
          //   margin: const EdgeInsets.symmetric(horizontal: 20),
          //   child: SfPdfViewer.network('https://drive.google.com/file/d/18bfikzaMTnigjYYBwF184HRjFIS-DWV-/view?usp=sharing'),
          // ),
          Container(
            // margin:
            //     const EdgeInsets.only(right: 15, left: 15, bottom: 40, top: 15),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 10, right: 20, left: 20),
                  child: DefaultButton(
                      text: 'Ver políticas de privacidad',
                      color: Colors.red.shade400,
                      onPressed: () {
                        showPrivacy(context);
                        // vm.register();
                        // vm.loadInstitutions();
                      }),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 10, right: 20, left: 20),
                  child: DefaultButton(
                      color: Colors.green.shade600,
                      text: 'Registrarse',
                      onPressed: () {
                        vm.register();
                        // vm.loadInstitutions();
                      }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
