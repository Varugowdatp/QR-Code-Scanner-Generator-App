import 'package:flutter/material.dart';
import 'package:qr_code/qr_code_generator.dart';
import 'package:qr_code/scan_qr_code.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Scanner and Generator',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code Scanner and Geneator"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ScanQrCode()));
                  });
                },
                child: Text("Scan QR Code")),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QrCodeScreen()));
                  });
                },
                child: Text("Generate QR Code "))
          ],
        ),
      ),
    );
  }
}
