import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_code_scanner/screens/widgets/about_widget.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  String _scanBarcode = "Bo'sh";

  @override
  void initState() {
    super.initState();
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE)!;
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;
    barcodeScanRes = "Platforma linkini olib bo'lmadi";
    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Platforma versiyasini olib bo‘lmadi.';
    }

    if (!mounted) return;
    barcodeScanRes = "Platforma linkini olib bo'lmadi";
    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.05,
              ),
              child: const AboutWidget(),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/scanner.png"),
                    fit: BoxFit.contain),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.24,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.7,
                    color: Colors.grey.shade300,
                    child: Column(children: [ElevatedButton(
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size(200, 40),
                        backgroundColor: const Color(0xff366451),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      onPressed: () => scanBarcodeNormal(),
                      child: const Text('Shtrix-kodni skanerlash')),
                  ElevatedButton(
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size(200, 40),
                        backgroundColor: const Color(0xff366451),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      onPressed: () => scanQR(),
                      child: const Text('QR skanerlashni')),
                  ElevatedButton(
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size(200, 40),
                        backgroundColor: const Color(0xff366451),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      onPressed: () => startBarcodeScanStream(),
                      child: const Text('Shtrix-kod skanerlash oqimi')),],),
                  ),
                  
                  // Text('Skanerlash natijasi : $_scanBarcode\n',
                  //     style: const TextStyle(fontSize: 20))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
