import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
        position: ToastPosition.bottom,
        child: MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en'), // English
            const Locale('pt', 'BR'), // brasil
          ],
          navigatorKey: Get.key,
          title: 'Controle Ja',
          theme: ThemeData(
            primaryColor: Color(0xFF4B5FCE),
          ),
          initialRoute: '/',
          onGenerateRoute: Modular.generateRoute,
        ));
  }
}
