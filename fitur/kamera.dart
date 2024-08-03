import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;
import 'dart:io';
import 'package:nutritrack/attribute/detailcamera1.dart';  // Pastikan jalur impor ini benar


class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  CameraController? cameraController;
  String? imagePath;

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      cameraController = CameraController(cameras[0], ResolutionPreset.max);
      await cameraController!.initialize();
      setState(() {});
    } on CameraException catch (e) {
      print('Error saat menginisialisasi kamera: $e');
    }
  }

  Future<void> _takePicture() async {
    if (!cameraController!.value.isInitialized) {
      return;
    }
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, '${DateTime.now()}.png');
    try {
      final XFile picture = await cameraController!.takePicture();
      setState(() {
        imagePath = picture.path;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailCamera1(imagePath: picture.path),
        ),
      );
    } on CameraException catch (e) {
      print('Error saat mengambil gambar: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    super.dispose();
    cameraController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CameraPreview(cameraController!),
          ),
          if (imagePath != null)
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.file(File(imagePath!)),
              ),
            ),
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                  width: 3,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: _takePicture,
                child: Icon(Icons.camera_alt),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
