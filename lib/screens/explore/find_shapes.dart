import 'package:flutter/material.dart';
import 'package:tinytots/screens/explore/camera_view.dart';

class FindShapes extends StatelessWidget {
  const FindShapes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CameraView()));
          },
          child: Text("Play Screen"),
        ),
      ),
    );
  }
}
