import 'package:flutter/material.dart';
import 'package:learnlinked/features/auth/presentation/pages/login/blocs/login_event.dart';
import 'package:learnlinked/features/auth/presentation/pages/login/blocs/login_page.dart';
import 'package:learnlinked/features/auth/presentation/pages/register/blocs/register_event.dart';
import 'package:learnlinked/features/auth/presentation/pages/register/blocs/register_page.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginEvent()),
        ChangeNotifierProvider(create: (context) => RegisterEvent())
      ],
      child: MaterialApp(
        title: 'Learn Linked',
        theme: ThemeData(primarySwatch: Colors.red),
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'register': (BuildContext context) => RegisterPage()
        },
      ),
    );
  }
}
