import 'dart:async';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart ';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/services/firestore_service_service.dart'
    show FirestoreServiceService;
import 'package:record/record.dart';

import 'package:todo_app/ui/models/notes_model.dart';
import 'package:image_picker/image_picker.dart';

class AddNotesViewModel extends BaseViewModel {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
final AudioRecorder _recorder = AudioRecorder();
  final AudioPlayer _player = AudioPlayer();
  String? audioPath;
  int seconds = 0;
  Timer? _timer;
   File? selectedImage;

  bool isRecording = false;
  bool isPlaying = false;

  final FirestoreServiceService _firestoreService = FirestoreServiceService();

  // AddNotesViewModel() {
  //   _recorder = FlutterSoundRecorder();
  //   _player = FlutterSoundPlayer();
  //   initRecorder();
  // }

  // Future<void> initRecorder() async {
  //   final status = await Permission.microphone.request();
  //   if (status != PermissionStatus.granted) {
  //     print("Microphone permission denied");
  //     return;
  //   }

  //   await _recorder!.openRecorder();
  //   await _player!.openPlayer();
  //   _recorder!.setSubscriptionDuration(
  //       const Duration(milliseconds: 500)); // To track progress
  // }

   Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
      notifyListeners();
    }
  }

Future<void> startRecording() async {
  try {
    if (await Permission.microphone.request().isGranted) {
      final directory = await getApplicationDocumentsDirectory();
      audioPath = '${directory.path}/note_audio.m4a';

      // Configure recording settings
      const config = RecordConfig(
        encoder: AudioEncoder.aacLc,
        bitRate: 128000,
        sampleRate: 44100,
      );

      // Start recording with config and path
      await _recorder.start(config, path: audioPath!);

      isRecording = true;
      seconds = 0;
      notifyListeners();

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        seconds++;
        notifyListeners();
      });

      print("Recording started: $audioPath");
    } else {
      print("Microphone permission denied");
    }
  } catch (e) {
    print("Failed to start recording: $e");
  }
}
  Future<void> stopRecording() async {
    await _recorder.stop();
    isRecording = false;
    _timer?.cancel();
    notifyListeners();
    print("Recording saved: $audioPath");
  }

  // Future<void> stopRecording() async {
  //   final path = await _recorder!.stopRecorder();
  //   audioPath = path;

  //   print("Recording saved: $audioPath");
  //   _timer?.cancel();
  //   isRecording = false;
  //   notifyListeners();
  // }

  Future<void> playAudio() async {
    if (audioPath != null && File(audioPath!).existsSync()) {
      await _player.play(DeviceFileSource(audioPath!));
      isPlaying = true;
      notifyListeners();

      _player.onPlayerComplete.listen((event) {
        isPlaying = false;
        notifyListeners();
      });

      print("Playing audio: $audioPath");
    } else {
      print("No recorded file found!");
    }
  }

  Future<void> stopAudio() async {
    await _player.stop();
    isPlaying = false;
    notifyListeners();
  }

  Future<void> addNote() async {
    final title = titleController.text;
    final description = descriptionController.text;

    if (title.isEmpty && description.isEmpty) {
      // If both fields are empty, do not save the note
      return;
    }

    final data = NotesModel(
      id: '',
      title: title,
      description: description,
     
    );

    await _firestoreService.addNote(data);

    clearFields();
  }

  void clearFields() {
    titleController.clear();
    descriptionController.clear();
    // selectedImage = null;
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    _timer?.cancel();
    super.dispose();
  }
}
