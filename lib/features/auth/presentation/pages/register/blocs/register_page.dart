import 'package:flutter/material.dart';
import 'package:learnlinked/features/auth/presentation/pages/register/blocs/register_event.dart';
import 'package:learnlinked/features/auth/presentation/pages/register/widgets/register_content.dart';
import 'package:learnlinked/features/auth/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage(){}

  @override
  Widget build(BuildContext context) {
    RegisterEvent vm = Provider.of<RegisterEvent>(context);
    return Scaffold(
        backgroundColor: BASE_COLOR,
        body: Stack(
          children: [
            // StreamBuilder(
            //     stream: vm.response,
            //     builder: (context, snapshot) {
            //       final response = snapshot.data;
            //       if (response is Loading) {
            //         return const Center(child: CircularProgressIndicator());
            //       }
            //       if (response is Error) {
            //         final data = response as Error;
            //         Fluttertoast.showToast(
            //             msg: 'Error: ${data.error}',
            //             toastLength: Toast.LENGTH_LONG);
            //       } else if (response is Success) {
            //         WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            //           Navigator.pushAndRemoveUntil(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => MyApp(locator<AuthUseCases>())),
            //               (route) => false);
            //         });
            //       }
            //       return Container();
            //     }),
            RegisterContent(vm)
          ],
        ));
  }
}
