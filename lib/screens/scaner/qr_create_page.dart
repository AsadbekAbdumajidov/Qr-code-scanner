import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_code_scanner/screens/scaner/widgets/about_widget.dart';
import 'package:qr_code_scanner/service/service_url.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  String scanBarcode = "Bo'sh";
  @override
  void initState() {
    super.initState();
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
    setState(() {
      scanBarcode = barcodeScanRes;
      ServiceUrl.launchURL(scanBarcode);
      myAvesomeDialog(scanBarcode);
    });
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', "Cancel", true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      scanBarcode = barcodeScanRes;
      ServiceUrl.launchURL(scanBarcode);
      myAvesomeDialog(scanBarcode);
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
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
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
              height: MediaQuery.of(context).size.height * 0.27,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            style: OutlinedButton.styleFrom(
                              fixedSize: const Size(220, 50),
                              backgroundColor: const Color(0xff366451),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            onPressed: () => scanBarcodeNormal(),
                            child: const Text(
                              'Shtrix-kodni skanerlash',
                              style: TextStyle(fontFamily: "balo"),
                            )),
                        ElevatedButton(
                            style: OutlinedButton.styleFrom(
                              fixedSize: const Size(220, 50),
                              backgroundColor: const Color(0xff366451),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            onPressed: () {
                              scanQR();
                            },
                            child: const Text(
                              'QR skanerlash',
                              style: TextStyle(fontFamily: "balo"),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  myAvesomeDialog(text) {
    return AwesomeDialog(
      dismissOnBackKeyPress: true,
      context: context,
      dialogBackgroundColor: Colors.white,
      title: 'Skanerlash natijasi',
      desc: scanBarcode,
      dialogType: text == "-1" ? DialogType.ERROR : DialogType.SUCCES,
      btnOk: OutlinedButton(
        onPressed: () {
          text == "-1"
              ? Navigator.pop(context)
              : ServiceUrl.launchURL(scanBarcode);
        },
        child: text == "-1"
            ? const Text(
                "Platforma topilmadi",
                style: TextStyle(color: Colors.red),
              )
            : Text(
                "Quyidagi linkga kirish",
                style: TextStyle(color: Colors.green.shade800),
              ),
      ),
    )..show();
  }
}
