import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CameraWidget extends StatefulWidget {
  @override
  _CameraWidgetState createState() => new _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  CameraController controller;
  List<CameraDescription> cameras;
  bool _isReady = false;

  Future<Null> _setupCameras() async {
    try {
      // initialize cameras.
      cameras = await availableCameras();
      // initialize camera controllers.
      controller = new CameraController(cameras[0], ResolutionPreset.high);
      await controller.initialize();
    } on CameraException catch (_) {
      // do something on error.
    }
    // if (!isMounted) return;
    setState(() {
      _isReady = true;
    });
  }

  @override
  void initState() {
    super.initState();
    this._setupCameras();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReady) return new Container(
      child: SpinKitThreeBounce(
        color: Colors.teal,
        width: 50.0,
        height: 50.0,
      )
    );
    return new Container(
      child: new CameraPreview(controller)
    );
  }
}