import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  VoidCallback soundPlayer(int soundNumber) {
    return () {
      final player = AudioCache();
      player.play('note$soundNumber.wav');
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SoundBoard(
                soundNumber: 1,
                backgroundColor: Colors.red.shade400,
                fontColor: Colors.red.shade800,
              ),
              SoundBoard(
                soundNumber: 2,
                backgroundColor: Colors.orange.shade400,
                fontColor: Colors.orange.shade800,
              ),
              SoundBoard(
                soundNumber: 3,
                backgroundColor: Colors.yellow.shade400,
                fontColor: Colors.yellow.shade800,
              ),
              SoundBoard(
                soundNumber: 4,
                backgroundColor: Colors.green.shade400,
                fontColor: Colors.green.shade800,
              ),
              SoundBoard(
                soundNumber: 5,
                backgroundColor: Colors.teal.shade400,
                fontColor: Colors.teal.shade800,
              ),
              SoundBoard(
                soundNumber: 6,
                backgroundColor: Colors.blue.shade400,
                fontColor: Colors.blue.shade800,
              ),
              SoundBoard(
                soundNumber: 7,
                backgroundColor: Colors.purple.shade400,
                fontColor: Colors.purple.shade800,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SoundBoard extends StatelessWidget {
  final int soundNumber;
  final Color backgroundColor;
  final Color fontColor;
  static const List<String> chordNames = [
    'C',
    'D',
    'E',
    'F',
    'G',
    'A',
    'B',
  ];

  const SoundBoard({
    required this.soundNumber,
    required this.backgroundColor,
    required this.fontColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          final player = AudioCache();
          player.play('note$soundNumber.wav');
        },
        child: Container(
          child: Center(
            child: Text(
              chordNames[soundNumber - 1],
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                color: fontColor,
              ),
            ),
          ),
          color: backgroundColor,
        ),
      ),
    );
  }
}
