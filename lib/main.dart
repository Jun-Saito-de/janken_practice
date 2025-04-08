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
  String myJankenText = '✊️';
  String comJankenText = '✊️';

  List<String> jankenList = ['✊️', '✌️', '🖐️'];

  // コンピュータの手をランダムで選ぶ関数
  void chooseComputerText() {
    final random = Random();
    final randomNumber = random.nextInt(3); //0~2のどれかを返す
    final hand = jankenList[randomNumber];
    setState(() {
      comJankenText = hand;
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
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              comJankenText,
              style: TextStyle(fontSize: 100),
            ),
            SizedBox(
              height: 80,
            ),
            Text(
              'じぶん',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              myJankenText,
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
                myJankenText ='✊️';
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
                myJankenText ='✌️️️';
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
                myJankenText ='🖐️';
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
