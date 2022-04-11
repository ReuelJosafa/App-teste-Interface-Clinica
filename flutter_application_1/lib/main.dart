import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'modules/home/home_page.dart';

void main() {
  initializeDateFormatting().then((_) =>
      runApp(const MyApp())); //inicializa a formatação da data para PT-br
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF0199A4)),
        primaryColor: const Color(0xFF0199A4),
        // drawerTheme: const DrawerThemeData(backgroundColor: Colors.pink),
        // primarySwatch:  Color.fromARGB(255, 1, 153, 164),
      ),
      home: const MyHomePage(),
    );
  }
}
