import 'package:ai_strike/datamodel/Answer.dart';
import 'package:ai_strike/datamodel/GameTheme.dart';
import 'package:ai_strike/model/answer/addAnswer.dart';
import 'package:ai_strike/model/theme/ThemeInterface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Firebase implements AddTheme, FetchThemes, AddAnswer {
  final CollectionReference themeCollection = FirebaseFirestore.instance.collection('themes');
  final CollectionReference answerCollection = FirebaseFirestore.instance.collection('answers');

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
    try {
      answerCollection.add(Answer.toResponse(answer).toJson());
    } catch (e) {
      print(e);
    }
  }
}