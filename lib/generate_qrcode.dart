import 'package:easy_eat/styles/colors.dart';
import 'package:easy_eat/styles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class GenerateQrcode extends StatefulWidget {
  const GenerateQrcode({super.key});

  @override
  State<GenerateQrcode> createState() => _GenerateQrcodeState();
}

class _GenerateQrcodeState extends State<GenerateQrcode> {
  String? qrCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: MyAppColor().blue,
        centerTitle: true,
        title: Text(
          "Generate QR Code",
          style: MyTextstyles().appBarText,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/scan");
              },
              icon: Icon(Icons.qr_code_scanner_sharp))
        ],
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  style: MyTextstyles().searchBarText,
                  cursorColor: MyAppColor().blue,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.qr_code, color: Colors.black),
                    filled: true,
                    fillColor: MyAppColor().blue2,
                    focusColor: MyAppColor().blue,
                    hoverColor: MyAppColor().blue,
                    labelText: 'Enter text to generate QR Code',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyAppColor().blue)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: MyAppColor().blue)),
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      qrCode = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 60),
              if (qrCode != null && qrCode!.isNotEmpty)
                PrettyQr(
                  data: qrCode!,
                  size: 240,
                  roundEdges: true,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
