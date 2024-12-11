import 'package:flutter/material.dart';
import 'package:tinytots/globals.dart';
import 'package:tinytots/helper/prefs_helper.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: Storage.allKeys.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    prefs.remove(Storage.allKeys[index]);
                  });
                },
                child: ListTile(
                  title: Text(Storage.allKeys[index]),
                  trailing: Text(prefs.get(Storage.allKeys[index]).toString()),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
