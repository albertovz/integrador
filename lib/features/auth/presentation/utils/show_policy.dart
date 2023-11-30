import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

showPrivacy(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: const Text(
                'Lea nuestras políticas de privacidad antes de registrarse'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 450,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: SfPdfViewer.network(
                      'https://firebasestorage.googleapis.com/v0/b/flutter-mvvm-gamer-1c6c9.appspot.com/o/Posts%2FPixelPulse_Software_Aviso_Privacidad_.pdf?alt=media&token=5f24341f-d082-4cb2-914c-6e5653ef09b5'),
                ),
              ),
            ],
          ));
}
