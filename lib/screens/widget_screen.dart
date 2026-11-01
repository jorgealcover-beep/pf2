import 'package:flutter/material.dart';

class WidgetScreen extends StatelessWidget {
  const WidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Showcase'),
        backgroundColor: Color(0xFF9FCFFA),
      ),
      body: Center(
        child: Text('Welcome to the Widget Showcase!'),
      ),
    );
  }
}