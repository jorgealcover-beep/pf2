import 'package:flutter/material.dart';
import 'package:pf2/screens/home_screen.dart';
import 'package:pf2/screens/personal_screen.dart';
import 'package:pf2/screens/widget_screen.dart';

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
          seedColor: Color(0xFF9FCFFA),
          brightness: Brightness.light,
          ),
      ),
      routes:{
        '/': (context) => const HomePage(),
        '/personal': (context) => const PersonalScreen(),
        '/widget': (context) => const WidgetScreen(),
      },
      initialRoute: '/',
    );
  }
}