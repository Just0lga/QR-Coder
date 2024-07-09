import 'package:easy_eat/styles/colors.dart';
import 'package:easy_eat/styles/textStyles.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Welcome to QR Coder",
          style: MyTextstyles().appBarText,
        ),
        backgroundColor: MyAppColor().blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/scan");
              },
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 2,
                          offset: Offset(0, 2))
                    ],
                    color: MyAppColor().blue,
                    borderRadius: BorderRadius.circular(20)),
                alignment: Alignment.center,
                height: 100,
                width: 320,
                child: Text(
                  "SCAN QR CODE",
                  style: MyTextstyles().appBarText,
                ),
              ),
            ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/generate");
              },
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 2,
                          offset: Offset(0, 2))
                    ],
                    color: MyAppColor().blue,
                    borderRadius: BorderRadius.circular(20)),
                alignment: Alignment.center,
                height: 100,
                width: 320,
                child: Text(
                  "GENERATE QR CODE",
                  style: MyTextstyles().appBarText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
