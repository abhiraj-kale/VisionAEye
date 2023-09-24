import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:visionaeye/objectdetection.dart';
import 'package:visionaeye/od2.dart';
import 'package:visionaeye/od3.dart';

class CameraScreen extends StatefulWidget {
  final CameraDescription camera;

  const CameraScreen({required this.camera});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  final stt.SpeechToText speech = stt.SpeechToText();
  bool isListening = false;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });

    initializeSpeechToText();
  }

  void initializeSpeechToText() async {
    bool available = await speech.initialize(
      onStatus: (status) {
        if (status == stt.SpeechToText.listeningStatus) {
          setState(() {
            isListening = true;
          });
        } else if (status == stt.SpeechToText.notListeningStatus) {
          setState(() {
            isListening = false;
          });
        }
      },
    );
    if (available) {
      startListening();
    }
  }

  void toggleListening() {
    if (isListening) {
      stopListening();
    } else {
      startListening();
    }
  }

  void startListening() {
    speech.listen(
      onResult: (result) {
        if (result.finalResult) {
          if (result.recognizedWords.toLowerCase() == "go back") {
            Navigator.pop(context); // Go back when the user says "go back"
          }
        }
      },
    );
  }

  void stopListening() {
    speech.stop();
  }

  @override
  void dispose() {
    _controller.dispose();
    stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Screen'),
      ),
      body: Center(
        child: OD3(widget.camera,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleListening,
        child: Center(
                child: Icon(
                  isListening ? Icons.mic_off : Icons.mic,
                  size: 48.0, // Adjust the icon size as needed
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
