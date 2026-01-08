import 'package:flutter/material.dart';
import 'HomePage.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'عقارات اليمن',
      home:HomePage(),
      debugShowCheckedModeBanner: false,
      // لجعل التطبيق يدعم العربية بشكل أفضل
      locale: const Locale('ar', 'YE'),
    );
  }
}