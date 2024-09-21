import 'dart:io';
import 'dart:typed_data';

import 'package:ai_strike/datamodel/Answer.dart';
import 'package:ai_strike/datamodel/GameTheme.dart';
import 'package:ai_strike/model/answer/addAnswer.dart';
import 'package:ai_strike/model/answer/uploadAnswerImage.dart';
import 'package:ai_strike/model/theme/ThemeInterface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Firebase implements AddTheme, FetchThemes, AddAnswer, UploadAnswerImage {
  final CollectionReference themeCollection = FirebaseFirestore.instance.collection('themes');
  final CollectionReference answerCollection = FirebaseFirestore.instance.collection('answers');
  final FirebaseStorage storage = FirebaseStorage.instance;

  @override
  void addTheme(GameTheme theme) {
    try {
      themeCollection.add(theme.toJson());
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<List<GameTheme>> fetchThemes() async {
    try {
      QuerySnapshot snapshot = await themeCollection.get();
      return snapshot.docs.map((doc) {
        return GameTheme.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print('Error fetching themes: $e');
      return [];
    }
  }

  @override
  void addAnswer(Answer answer) {
    uploadAnswerImage(answer.image, answer.id!);

    try {
      answerCollection.add(Answer.toResponse(answer).toJson());
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> uploadAnswerImage(Uint8List image, String filename) async {
    try {
      final ref = storage.ref().child('answers/$filename');

      ref.putData(image);
    } catch (e) {
      print(e);
    }
  }
}