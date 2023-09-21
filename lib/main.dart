import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:visionaeye/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;

  const MyApp({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VisionAEye',
      theme: ThemeData.dark(),
      home: SplashScreen(cameras: cameras), // Provide the cameras parameter
    );
  }
}
