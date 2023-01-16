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
  var total = 3;
  var name = ['joseph', 'shushu', 'kelly'];
  var like = [0, 0, 0];

  addname(a) {
    setState(() {
      if (a != '') {
        name.add(a);
      }
    });
  }

  addOne() {
    setState(() {
      total++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return DialogUI(addOne: addOne, addName: addname);
                });
          },
          child: Text('edd'),
        ),
        appBar: AppBar(
          title: Text(total.toString()),
        ),
        body: ListView.builder(
            itemCount: name.length,
            itemBuilder: (c, i) {
              return ListTile(
                  leading: Icon(Icons.headphones),
                  title: Text(name[i]),
                  trailing: ElevatedButton(onPressed: (){}, child: Text('delete'),)
              );
            }));
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.addOne, this.addName}) : super(key: key);
  final addOne;
  final addName;
  var inputData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(20),
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField(
              controller: inputData,
            ),
            TextButton(
                onPressed: () {
                  addOne();
                  addName(inputData.text);
                  Navigator.pop(context);
                },
                child: Text('완료')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('취소'))
          ],
        ),
      ),
    );
  }
}
