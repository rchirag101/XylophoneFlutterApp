import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  //Xylophone notes
  final Map xm = {'c': 1, 'd': 2, 'e': 3, 'f': 4, 'g': 5, 'a': 6, 'b': 7};
  final Map revXm = {1: 'c', 2: 'd', 3: 'e', 4: 'f', 5: 'g', 6: 'a', 7: 'b'};
  void playSound(int noteNumber) {
    final player = AudioCache();
    player.play('note$noteNumber.wav');
    print(revXm[noteNumber]);
  }

  Expanded createButton({Color color, int noteNumber, String noteText}) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(noteNumber);
        },
        child: Text(
          noteText,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      title: 'Xylophone',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            'Xylophone',
          ),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              createButton(color: Colors.red, noteNumber: 1, noteText: 'C'),
              createButton(color: Colors.orange, noteNumber: 2, noteText: 'D'),
              createButton(color: Colors.yellow, noteNumber: 3, noteText: 'E'),
              createButton(color: Colors.green, noteNumber: 4, noteText: 'F'),
              createButton(color: Colors.blue, noteNumber: 5, noteText: 'G'),
              createButton(color: Colors.indigo, noteNumber: 6, noteText: 'A'),
              createButton(color: Colors.purple, noteNumber: 7, noteText: 'B'),
            ],
          ),
        ),
      ),
    );
  }
}
