import 'dart:typed_data';
import 'package:easy_eat/styles/colors.dart';
import 'package:easy_eat/styles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrcode extends StatefulWidget {
  const ScanQrcode({super.key});

  @override
  State<ScanQrcode> createState() => _ScanQrcodeState();
}

class _ScanQrcodeState extends State<ScanQrcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyAppColor().blue,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "Scan QR Code",
          style: MyTextstyles().appBarText,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/generate");
              },
              icon: Icon(Icons.qr_code))
        ],
      ),
      body: MobileScanner(
        controller: MobileScannerController(
            returnImage: true, detectionSpeed: DetectionSpeed.noDuplicates),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          final Uint8List? image = capture.image;
          for (final barcode in barcodes) {
            print("Barcode Found ${barcode.rawValue}");
          }
          if (image != null) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(barcodes.first.rawValue ?? ""),
                  content: Image(image: MemoryImage(image)),
                );
              },
            );
          }
        },
      ),
    );
  }
}
