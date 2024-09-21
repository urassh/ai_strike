import '../../datamodel/Answer.dart';

abstract class FetchAnswers {
  Future<List<Answer>> fetchAnswers();
}