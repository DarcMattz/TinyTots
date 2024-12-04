import 'package:flutter/material.dart';
import 'package:flutter_application_1/globals.dart';
import 'package:flutter_application_1/helper/prefs_helper.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data"),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: Storage.allKeys.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(Storage.allKeys[index]),
                trailing: Text(prefs.get(Storage.allKeys[index]).toString()),
              ),
            );
          },
        ),
      ),
    );
  }
}
