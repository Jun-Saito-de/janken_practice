import 'package:flutter/material.dart';
import 'dart:math';



class SecondPage extends StatelessWidget {
  const SecondPage({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: const Center(
        child: Text(
          '平易なコードで記述',
        ),
      ),
    );
  }
}

class MySecondPage extends StatefulWidget {
  const MySecondPage({super.key, required this.title});

  final String title;

  @override
  State<MySecondPage> createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
// じゃんけんの手や結果を「文字列」で管理する
  String myHand = '?';
  String computerHand = '?';
  String result = '?';

// コンピュータの手を決めて、勝敗を判断する関数
void playJanken(String selectedHand){
  myHand = selectedHand; // 自分の手をセットする

  // ランダムでコンピューターの手を決める
  List<String> hands = ['✊️','✌️','🖐️'];
  int index = Random().nextInt(3);
  computerHand = hands[index];

// 勝敗判定（グー：✊️、チョキ：✌️、パー：🖐️）
  if (myHand == computerHand) {
    result = 'あいこ🤔';
  }
  else if (
  (myHand == '✊️' && computerHand == '✌️') ||
      (myHand == '✌️' && computerHand == '🖐️') ||
      (myHand == '🖐️' && computerHand == '✊️')
  ) {
    result = '勝ち😊';
  } else {
    result = '負け😭';
  }
  setState(() {}); // 画面を更新
}

@override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
            computerHand,
            style: TextStyle(fontSize: 100),
          ),
          SizedBox(height: 40), // サイズ調整のためのスペーサー
          Text(
            result, // 勝負の結果
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40), // サイズ調整のためのスペーサー
          Text(
            'じぶん',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            myHand,
            style: TextStyle(fontSize: 100),
          ),
          SizedBox(height: 40), // サイズ調整のためのスペーサー
        ],
      ),
    ),
    floatingActionButton: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
            onPressed: (){
            playJanken('✊️');
        },
            child:const Text(
                '✊️', style: TextStyle(fontSize: 30)
            ),
        ),
        FloatingActionButton(
          onPressed: (){
            playJanken('✌️');
          },
          child:const Text(
              '✌️️', style: TextStyle(fontSize: 30)
          ),
        ),
        FloatingActionButton(
          onPressed: (){
            playJanken('🖐️️');
          },
          child:const Text(
              '🖐', style: TextStyle(fontSize: 30)
          ),
        ),
      ],
    )
  );
}

}

