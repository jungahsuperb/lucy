import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 1;
  var name = ['joseph', 'shushu', 'kelly'];
  var like = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      content: Text(style: TextStyle(fontSize: 20), 'Contact'),
                      actions: [
                        TextField(),
                        TextButton(style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: null,
                        child: const Text('cancel'),)
                  ]
                  ,
                  );
                });
          },
          child: Text('edd'),
        ),
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (c, i) {
              return ListTile(
                leading: Icon(Icons.headphones),
                title: Text(name[i]),
              );
            }));
  }
}
