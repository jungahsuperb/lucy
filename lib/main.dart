import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
          body: ListView.builder(
            itemCount: 300,
            itemBuilder: (c,i){
              return ListTile(
                leading: Icon(Icons.pages),
                title: Text('홍길동'),
              );
            },

            ),
          bottomNavigationBar: Homework()

          ),
        );

  }
}

class Homework extends StatelessWidget {
  const Homework({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BottomAppBar(
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.phone),
            Icon(Icons.message),
            Icon(Icons.pages)
          ],
        ),
      ),
    );
  }
}
