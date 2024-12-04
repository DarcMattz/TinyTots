import 'dart:developer';
import 'package:camera/camera.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class ScanController extends GetxController {
  late CameraController cameraController;
  late List<CameraDescription> cameras;

  var isCameraInitialized = false.obs;
  var cameraCount = 0;

  var x = 0.0;
  var y = 0.0;
  var w = 0.0;
  var h = 0.0;

  var label = "";
  var newlabel = "";
  var show = "hi";

  @override
  void onInit() {
    super.onInit();
    initTFlite();
  }

  void disposeCamera() {
    stopImageStream();
    if (cameraController.value.isInitialized) {
      cameraController.dispose();
    }
    Tflite.close();
    isCameraInitialized(false);
    update();
  }

  Future<void> initCamera() async {
    if (await Permission.camera.request().isGranted) {
      cameras = await availableCameras();
      cameraController = CameraController(cameras[0], ResolutionPreset.max);
      await cameraController.initialize();
      await initTFlite();
      startImageStream();
      isCameraInitialized(true);
      update();
    } else {
      print("Camera permission denied");
    }
  }

  void startImageStream() {
    cameraController.startImageStream((image) {
      cameraCount++;
      if (cameraCount % 10 == 0) {
        cameraCount = 0;
        objectDetector(image);
      }
      update();
    });
  }

  void stopImageStream() {
    if (cameraController.value.isStreamingImages) {
      cameraController.stopImageStream();
    }
  }

  void pauseCamera() {
    if (cameraController.value.isStreamingImages) {
      cameraController.stopImageStream();
    }
    print("Camera paused.");
  }

  void resumeCamera() async {
    if (!cameraController.value.isInitialized) {
      await initCamera();
    } else {
      await initTFlite();
      startImageStream();
    }
    print("Camera and TFLite resumed.");
  }

  Future<void> initTFlite() async {
    await Tflite.loadModel(
      model: "assets/models/model_unquant.tflite",
      labels: "assets/models/labels.txt",
      isAsset: true,
      numThreads: 1,
      useGpuDelegate: false,
    );
  }

  objectDetector(CameraImage image) async {
    var results = await Tflite.runModelOnFrame(
      bytesList: image.planes.map((e) => e.bytes).toList(),
      imageHeight: image.height,
      imageWidth: image.width,
      imageMean: 127.5,
      imageStd: 127.5,
      rotation: 90,
      numResults: 2,
      threshold: 0.5,
    );

    if (results != null && results.isNotEmpty) {
      log("Results: $results");

      var detectedObject = results.first;
      if (detectedObject['confidence'] != null &&
          detectedObject['confidence'] > 0.95) {
        var confidence = detectedObject['confidence'];
        if (confidence != 0 && confidence > 0.95) {
          label = detectedObject['label'].toString();

          label = label.split(" ").last;

          if (newlabel != label) {
            newlabel = label;
            show = label;
          }
        }
        update();
      }
    }
  }

  @override
  void dispose() {
    stopImageStream();
    cameraController.dispose();
    Tflite.close();
    super.dispose();
  }
}
