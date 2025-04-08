import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Hand? myHand;
  Hand? computerHand;
  Result? result;

  //もういらない
  // List<Hand> jankenList = [Hand.rock, Hand.scissors, Hand.paper];

  // コンピュータの手をランダムで選ぶ関数
  void chooseComputerText() {
    final random = Random();
    final randomNumber = random.nextInt(3); //0~2のどれかを返す
    final hand = Hand.values[randomNumber];
    setState(() {
      computerHand = hand; //Hand型をString型に変換
    });
    // コンピュータの手をランダムで選ばれたら勝敗判定の関数をよびだす
    decideResult();
  }

  // 勝敗判定の関数
  void decideResult(){
    if (myHand == null || computerHand == null) {
      return;
    }
    final Result result;

    if (myHand == computerHand){
      result = Result.draw;
    } else if (myHand == Hand.rock && computerHand == Hand.scissors){
      result = Result.win;
    } else if (myHand == Hand.scissors && computerHand == Hand.paper){
      result = Result.win;
    } else if (myHand == Hand.paper && computerHand == Hand.rock){
      result = Result.win;
    } else {
      result = Result.lose;
    }
    setState(() {
      this.result = result;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'あいて',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              computerHand?.text ?? '?' ,
              style: TextStyle(fontSize: 100),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              result?.text ?? '?',
              style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'じぶん',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              myHand?.text ?? '?',
              style: TextStyle(fontSize: 200),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){
              setState(() {
                myHand = Hand.rock;
              });
              chooseComputerText(); // ボタンを押したらコンピューターの手の関数を呼び出す
            },
            child: const Text(
                '✊️',
              style: TextStyle(fontSize: 30),
            ),
          ),
          const SizedBox(width: 16,),
          FloatingActionButton(
            onPressed: (){
              setState(() {
                myHand = Hand.scissors;
              });
              chooseComputerText(); // ボタンを押したらコンピューターの手の関数を呼び出す
            },
            child: const Text(
              '✌️️',
              style: TextStyle(fontSize: 30),
            ),
          ),
          const SizedBox(width: 16,),
          FloatingActionButton(
            onPressed: (){
              setState(() {
                myHand = Hand.paper;
              });
              chooseComputerText(); // ボタンを押したらコンピューターの手の関数を呼び出す
            },
            child: const Text(
              '🖐️',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}

//enumを使用してリファクタリング



enum Hand {
  rock,
  scissors,
  paper; // 最後の項目だけ「,」じゃなくて「;」なことに注意

  String get text {
    switch (this){
      case Hand.rock:
        return '✊️';
      case Hand.scissors:
        return '✌️';
      case Hand.paper:
        return '🖐️️';
    }
  }
}



enum Result {
  win,
  draw,
  lose;

  String get text {
    switch (this){
      case Result.win:
        return '勝ち️😊';
      case Result.draw:
        return 'あいこ️🤔';
      case Result.lose:
        return '負け😭️';
    }
  }
}