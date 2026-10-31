import 'package:flutter/material.dart';
import 'package:pf2/screens/home_screen.dart';

void main(){
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Practica Final 2',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xFF5b8c6e),
            brightness: Brightness.light,
            ),
        ),
        home: HomePage(),
    );
  }
}