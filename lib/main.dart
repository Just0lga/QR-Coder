import 'package:easy_eat/generate_qrcode.dart';
import 'package:easy_eat/homepage.dart';
import 'package:easy_eat/scan_qrcode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Easy Eat",
      home: Homepage(),
      debugShowCheckedModeBanner: false,
      routes: {
        "/scan": (context) => ScanQrcode(),
        "/generate": (context) => GenerateQrcode(),
      },
    );
  }
}
