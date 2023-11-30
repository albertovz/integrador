import 'package:flutter/material.dart';
import 'package:learnlinked/features/auth/presentation/pages/login/blocs/login_event.dart';
import 'package:learnlinked/features/auth/presentation/pages/login/widgets/login_content.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginEvent vm = Provider.of<LoginEvent>(context);

    return Scaffold(
        backgroundColor: 
        Colors.white,
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50),
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/img/logo.jpg'), // Change this to your image path
                  
                ),
              ),
            ),
            LoginContent(vm)
          ],
        ));
  }
}
