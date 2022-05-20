import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../models/komplek_model.dart';

class DetailScreen extends StatefulWidget {
  final String code;
  DetailScreen(this.code);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Komplek? komplek;

  Future<Komplek?> getKomplek() async {
    await http
        .get(Uri.parse(
            "http://192.168.0.106/komplekAPI/getKomplek.php?kode=${widget.code}"))
        .then((response) {
      if (jsonDecode(response.body) != null) {
        setState(() {
          komplek = Komplek.fromJson(jsonDecode(response.body));
        });
      }
    });
    return komplek;
  }

  @override
  void initState() {
    getKomplek();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Kode : ${komplek?.kode}", style: TextStyle(fontSize: 20)),
              Text("Nama Komplek : ${komplek?.namaKomplek}",
                  style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
