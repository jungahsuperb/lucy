import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();
    return MaterialApp(
      title: 'real last!!!',
      home: Scaffold(
        appBar: AppBar(title: const Text('bye to Flutter')),
        //body: const Center(child: Text('branch test1')),//
        //body: Center(
        //child: Text(wordPair.asPascalCase),
        body: const Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}
