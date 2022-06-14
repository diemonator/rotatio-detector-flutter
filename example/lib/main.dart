import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:rotation_detector/rotation_detector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? _rotationStatus = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    bool? roationStatus;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      roationStatus =
          await RotationDetector.rotationStatus;
    } on PlatformException {
      roationStatus = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _rotationStatus = roationStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    String status = 'unknown';
    if (_rotationStatus == null) {
      status = 'unknow';
    } else if (_rotationStatus!) {
      status = 'on';
    } else if (!_rotationStatus!) {
      status = 'off';
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $status'),
        ),
      ),
    );
  }
}
