import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:visionaeye/homscreen.dart';

class SplashScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const SplashScreen({super.key, required this.cameras});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait for 2 seconds and then navigate to the HomeScreen
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(camera: widget.cameras.first), // Provide a non-null value for camera
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF070945), // Set the background color to hex #070945
      body: Center(
        child: TweenAnimationBuilder(
          duration: const Duration(seconds: 2),
          tween: Tween<Offset>(
            begin: const Offset(-1, 0), // Start from the left
            end: Offset.zero, // End at the center
          ),
          builder: (context, offset, child) {
            return Transform.translate(
              offset: offset,
              child: child,
            );
          },
          child: SizedBox(
            width: double.infinity,
            height: double.infinity, // Make the image full-screen
            child: Image.asset(
              'assets/visionaeye_logo.png', // Replace with your image
              fit: BoxFit.cover, // Use BoxFit.cover to make it full-screen
            ),
          ),
        ),
      ),
    );
  }
}
