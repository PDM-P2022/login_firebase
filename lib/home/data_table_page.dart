import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';

class DataTablePage extends StatelessWidget {
  const DataTablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data table firebase"),
      ),
      body: FirestoreDataTable(
        rowsPerPage: 4,
        query: FirebaseFirestore.instance.collection("tweet"),
        columnLabels: {
          "title": Text("Titulo"),
          "description": Text("Detalles"),
          "picture": Text("Imagen link"),
          "osystem": Text("Plataforma"),
        },
      ),
    );
  }
}
