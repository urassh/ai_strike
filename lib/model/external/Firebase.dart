import 'package:ai_strike/datamodel/GameTheme.dart';
import 'package:ai_strike/model/theme/ThemeInterface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Firebase implements AddTheme, FetchThemes {
  final CollectionReference collection = FirebaseFirestore.instance.collection('themes');

  @override
  void addTheme(GameTheme theme) {
    try {
      collection.add(theme.toJson());
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<List<GameTheme>> fetchThemes() async {
    try {
      QuerySnapshot snapshot = await collection.get();
      return snapshot.docs.map((doc) {
        return GameTheme.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print('Error fetching themes: $e');
      return [];
    }
  }
}