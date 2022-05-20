import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:news_flutter/ui/screens/detail_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key ? key
  }): super(key: key);

  @override
  State < MainScreen > createState() => _MainScreenState();
}

class _MainScreenState extends State < MainScreen > {
  // String code = "";
  // String getcode = "";

  Future scanbarcode() async {
    await FlutterBarcodeScanner.scanBarcode(
        "#009922", "cancel", true, ScanMode.BARCODE)
      .then((String kode) {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => DetailScreen(kode)));
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Komplek App',
          style:
          GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: < Widget > [
            FlatButton(
              child: Text(
                'SCAN QRCODE',
                style: GoogleFonts.montserrat(fontSize: 10),
              ),
              color: Colors.yellow,
              onPressed: () {
                scanbarcode();
              }),
          ],
        ),
      ),
    );
  }
}