import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:visionaeye/camera.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class HomeScreen extends StatefulWidget {
  final CameraDescription camera;

  const HomeScreen({super.key, required this.camera});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final stt.SpeechToText speech = stt.SpeechToText();
  bool isListening = false;

  @override
  void initState() {
    super.initState();
    initializeSpeechToText(); // Initialize speech recognition
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
          if (result.recognizedWords.toLowerCase() == "start capturing") {
            // Perform the action you want when the voice command is recognized
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CameraScreen(camera: widget.camera),
              ),
            );
          }
        }
      },
    );
  }

  void stopListening() {
    speech.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VisionAEye'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Heading
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Welcome to VisionAEye',
              style: TextStyle(
                fontSize: 24.0, // Adjust the font size as needed
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Card(
            elevation: 4.0,
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.camera), // Icon on the left side
              title: const Text('Start detecting objects'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CameraScreen(camera: widget.camera),
                  ),
                );
              },
            ),
          ),
          // Your content here
        ],
      ),
      floatingActionButton: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Center(
          child: Card(
            elevation: 4.0,
            margin: const EdgeInsets.only(left: 40.0),
            color: Colors.purple,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            child: InkWell(
              onTap: toggleListening,
              child: Center(
                child: Icon(
                  isListening ? Icons.mic : Icons.mic_off,
                  size: 48.0, // Adjust the icon size as needed
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
