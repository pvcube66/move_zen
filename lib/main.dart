import 'package:flutter/material.dart';
import './animation.dart';

void main() {
  runApp(const MovezenApp());
}

class MovezenApp extends StatelessWidget {
  const MovezenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
