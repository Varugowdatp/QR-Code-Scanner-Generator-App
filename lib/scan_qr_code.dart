import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/services.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  String onResult = 'Scanned data will appear here';

  Future<void> scanQR() async {
    try {
      var result = await BarcodeScanner.scan();
      if (!mounted) return;
      setState(() {
        onResult = result.rawContent;
      });
    } on PlatformException {
      setState(() {
        onResult = 'Failed to read QR Code';
      });
    } catch (e) {
      setState(() {
        onResult = 'An error occurred: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code Scanner"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              onResult,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: scanQR,
              child: Text("Scan Code"),
            ),
          ],
        ),
      ),
    );
  }
}
