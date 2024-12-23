import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QrCodeScreen(),
    );
  }
}

class QrCodeScreen extends StatefulWidget {
  @override
  _QrCodeScreenState createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Generator'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (urlController.text.isNotEmpty)
                QrImageView(
                  data: urlController.text,
                  size: 200,
                ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: urlController,
                  decoration: InputDecoration(
                      hintText: 'Enter your data',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(155),
                      ),
                      labelText: 'Enter your data'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text("Generate QR Code")),
            ],
          ),
        ),
      ),
    );
  }
}
