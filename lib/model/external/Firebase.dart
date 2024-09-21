import 'dart:typed_data';

import 'package:ai_strike/datamodel/Answer.dart';
import 'package:ai_strike/datamodel/GameTheme.dart';
import 'package:ai_strike/model/answer/addAnswer.dart';
import 'package:ai_strike/model/answer/uploadAnswerImage.dart';
import 'package:ai_strike/model/theme/ThemeInterface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../datamodel/Description.dart';
import '../../datamodel/response/AnswerResponse.dart';
import '../answer/fetchAnswers.dart';

class Firebase implements AddTheme, FetchThemes, AddAnswer, UploadAnswerImage, FetchAnswers {
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
    addDescription(answer.description);

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

  @override
  Future<List<Answer>> fetchAnswers(GameTheme theme) async {
    try {
      QuerySnapshot answerSnapshot = await answerCollection
          .where('themeId', isEqualTo: theme.id)
          .get();

      return await Future.wait(answerSnapshot.docs.map((doc) async {
        AnswerResponse response = AnswerResponse.fromJson(doc.data() as Map<String, dynamic>);

        GameTheme theme = await fetchTheme(response.themeId);
        Description description = await fetchDescription(response.descriptionId);

        Uint8List? image = await fetchAnswerImage(response.id);

        return Answer.fromResponse(response, theme, description, image ?? Uint8List(0));
      }).toList());

    } catch (e) {
      print('Error fetching answers: $e');
      return [];
    }
  }

  Future<GameTheme> fetchTheme(String themeId) async {
    try {
      final doc = await themeCollection.doc(themeId).get();
      if (doc.exists) {
        return GameTheme.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        return GameTheme.createEmpty();
      }
    } catch (e) {
      print('Error fetching theme: $e');
      return GameTheme.createEmpty();
    }
  }

  Future<void> addDescription(Description description) async {
    try {
      await FirebaseFirestore.instance.collection('descriptions').add(description.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<Description> fetchDescription(String descriptionId) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('descriptions')
          .where('id', isEqualTo: descriptionId)
          .get();


      if (querySnapshot.docs.isNotEmpty) {
        final doc = querySnapshot.docs.first;
        return Description.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        return Description.createEmpty();
      }
    } catch (e) {
      print('Error fetching description: $e');
      return Description.createEmpty();
    }
  }

  Future<Uint8List?> fetchAnswerImage(String answerId) async {
    try {
      final ref = storage.ref().child('answers/$answerId');
      return await ref.getData();  // Returns the image data
    } catch (e) {
      print('Error fetching image: $e');
      return Uint8List(0);
    }
  }
}