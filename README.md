# みてほしいサイト
https://topaz.dev/projects/95ceb408ed42c2b2a5a2

# 概要
選択したお題に対してお絵かきをします。
その絵をGeminiに具体的に説明させて文章を生成します。
元のお題とのGeminiの説明文章の一致度でスコアを図ります。


# 主な機能と画面構成
## お題選択
- 書いてみたいお題を右スワイプすることでお題に挑戦できます。
- 右下の + アイコンを押すことでGeminiが新しいお題を生成してくれます。

<img src="https://ptera-publish.topaz.dev/project/01J8BVPKGC9A8MHP3BQPAAT4KP.png" width="200">

## お絵かき 
Startボタンを押すことで、キャンバスが表示されカウントダウンが始まります。
|Startを押す前|お絵かきタイム|
|---|---|
|![image](https://ptera-publish.topaz.dev/project/01J8BVXP2W1ANQE2HBXN6KMNKN.png) | ![image](https://ptera-publish.topaz.dev/project/01J8BW83YS40X0NH1XBTDFSY8Z.png)|

## 書いた絵を説明してもらおう！
カウントダウン終了後遷移し、Geminiが書いた絵について、どの絵はどのような絵なのが具体的に説明してくれます。

|画面-1|画面-2|
|---|---|
| ![image](https://ptera-publish.topaz.dev/project/01J8BX8X5CRC6SJKH2BM6P7QHS.png)|![image](https://ptera-publish.topaz.dev/project/01J8BX9HRETRPCHCXX82JTSZEX.png)|

## スコア画面

スコアの一致度を測るために文章をベクトル化(文の埋め込み, エンベッティング)して、コサイン類似度を計算しています。また、事前に大規模なテキストデータで事前学習されているTransformerベースのモデルであるSentence-Transformer (paraphrase-MiniLM-L6-v2)を使用することで、文の意味的な特徴を捉えた高次元のベクトルを生成しています。値域が-1\~1であるため、0\~1にスケーリングしています。

![image](https://ptera-publish.topaz.dev/project/01J8C0DFBNB5ZG50HB0ATQP4G3.png)


# 頑張ったところ
- ハッカソンにしては結構クリーンなコードを意識しました。
- FirebaseやGeminiなどの外部APIの実装をうまく抽象化した。
- GCPのCloud Runを使うことで2つの文の類似度を測るAPIを実装しました。
