import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 1;
  var name = ['한상흠', '한지윤', '한재희'];
  var like = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: (){},
          child: Text('edd'),),
            appBar: AppBar(),
            body: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, i) {
                  return ListTile(
                      title: Text(name[i]),
                      leading: Text(like[i].toString()),
                      trailing: ElevatedButton(
                        child: Text('좋아요'),
                        onPressed: () {
                          setState(() {
                            like[i]++;
                          });
                        },
                      ));
                })));
  }
}
