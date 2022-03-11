import 'package:app_firebase/create/create_page.dart';
import 'package:app_firebase/home/data_table_page.dart';
import 'package:app_firebase/profile/profile_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data list firebase"),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.table_rows),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DataTablePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: FirestoreListView(
        padding: EdgeInsets.symmetric(horizontal: 18),
        pageSize: 15,
        query: FirebaseFirestore.instance.collection("tweet"),
        itemBuilder: (context, document) {
          // document = tweets collection
          return Card(
            child: Column(
              children: [
                Image.network(
                  "${document["picture"]}",
                  height: 120,
                ),
                Text("${document["title"]}"),
                Text("${document["description"]}"),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CreatePage(),
            ),
          );
        },
      ),
    );
  }
}
