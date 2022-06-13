import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class PokazMeropriat extends StatefulWidget {
  PokazMeropriat({Key? key}) : super(key: key);

  @override
  State<PokazMeropriat> createState() => _PokazMeropriatState();
}

class _PokazMeropriatState extends State<PokazMeropriat> {
  
  final databaseref = FirebaseDatabase.instance.ref().child("data");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(
          child: FirebaseAnimatedList(
            query: databaseref,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              String x = (snapshot.value as Map)['vrema'];
              print(x);
              return ListTile(
                title: Text(x),
              );
            },
          ),
        ),
      ),
    );
  }
}
