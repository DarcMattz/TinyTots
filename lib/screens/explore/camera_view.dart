import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tinytots/components/utils/circle_button.dart';
import 'package:tinytots/screens/explore/scan_controller.dart';
import 'package:get/get.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  CameraViewState createState() => CameraViewState();
}

class CameraViewState extends State<CameraView> with WidgetsBindingObserver {
  final ScanController controller = Get.put(ScanController());
  bool _speechEnabled = false;
  String voice_inp = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    controller.initCamera();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    controller.disposeCamera();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      controller.pauseCamera();
    } else if (state == AppLifecycleState.resumed) {
      if (controller.isCameraInitialized.value) {
        controller.resumeCamera();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFFFFEFF),
      body: GetBuilder<ScanController>(
        builder: (controller) {
          return controller.isCameraInitialized.value
              ? SafeArea(
                  child: Stack(
                    children: [
                      Container(
                        // decoration: BoxDecoration(
                        //   color: Colors.black,
                        //   // border:
                        //   //     Border.all(color: Color(0xFF95E9FF), width: 4),
                        //   // borderRadius: BorderRadius.circular(12),
                        // ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: CameraPreview(controller.cameraController),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 10,
                          child: CircleButton(
                            color: Colors.purpleAccent,
                            shadowColor: Colors.purple,
                            icon: Icons.volume_up_rounded,
                            method: () {
                              // dispose();
                              Navigator.pop(context);
                            },
                          )),
                      Positioned(
                        top:
                            (controller.y) * MediaQuery.of(context).size.height,
                        right:
                            (controller.x) * MediaQuery.of(context).size.width,
                        child: Container(
                          width:
                              controller.w * MediaQuery.of(context).size.width,
                          height:
                              controller.h * MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.green, width: 4.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                child: Text(controller.show),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(child: Icon(Icons.camera_alt, size: 100));
        },
      ),
    );
  }
}
