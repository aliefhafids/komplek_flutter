import 'dart:convert';
import 'dart:async';

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
  late Future<Komplek> futureKomplek;

  Future<Komplek> getKomplek() async {
    final response = await http.get(Uri.parse(
        "http://192.168.0.106/komplekAPI/getKomplek.php?kode=${widget.code}"));

    if (response.statusCode == 200) {
      return Komplek.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load komplek');
    }
  }

  @override
  void initState() {
    futureKomplek = getKomplek();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: FutureBuilder<Komplek>(
            future: futureKomplek,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.namaKomplek);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
