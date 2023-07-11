import 'dart:io';
import 'package:flutter/material.dart';
import 'package:microphone/microphone.dart';

class AudioRecordDialog extends StatefulWidget {
  @override
  _AudioRecordDialogState createState() => _AudioRecordDialogState();
}

class _AudioRecordDialogState extends State<AudioRecordDialog> {
  late MicrophoneRecorder _recorder;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _initRecorder();
  }

  Future<void> _initRecorder() async {
    _recorder = MicrophoneRecorder();
    await _recorder.init();
    _recorder.addListener(_onRecorderStateChanged);
  }

  void _onRecorderStateChanged() {
    setState(() {
      _isRecording = _recorder.hasListeners;
    });
  }

  Future<void> _startRecording() async {
    try {
      await _recorder.start();
    } catch (e) {
      print(e);
    }
  }

  Future<void> _stopRecording() async {
    try {
      await _recorder.stop();
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _recorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Record Audio'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (_isRecording)
            Text(
              'Recording...',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: _isRecording ? Icon(Icons.stop) : Icon(Icons.mic),
                onPressed: () {
                  if (_isRecording) {
                    _stopRecording();
                  } else {
                    _startRecording();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
