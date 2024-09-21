import 'dart:io';

import 'explainFromImage.dart';

class ExplainFromImageDummy implements ExplainFromImage {
  @override
  Future<String> explainFromImage(File imageFile) async {
    await Future.delayed(const Duration(seconds: 3));
    return '確かに、私が説明を求めた際、言葉が返ってきたものの、それはただの情報の羅列に過ぎなかった。要点は曖昧で、結論もどこか浮かんでこない。内容を理解しようと努力しても、核心に触れることができないまま終わってしまう。結局のところ、「つまりは、説明なし」という一言に尽きるのだろうか。まるで説明をすること自体が避けられているかのように、真実は煙に巻かれ、答えはどこか遠くに行ってしまったような気分になる。';
  }
}