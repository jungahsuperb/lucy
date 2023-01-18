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
  var phone = ['123', '345', '456'];
  var like = [0, 0, 0];

  addname(a) {
    setState(() {
      if (a != '') {
        name.add(a);
      }
    });
  }

  addphone(p){
    setState(() {
      if(p != ''){
        phone.add(p);
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
                  return DialogUI(addOne: addOne, addName: addname, addPhone: addphone,);
                });
          },
          child: Text('add'),
        ),
        appBar: AppBar(
          title: Text(total.toString()),
        ),
        body: ListView.builder(
            itemCount: name.length,
            itemBuilder: (c, i) {
              return ListTile(
                  leading: Icon(Icons.headphones),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(name[i]), Text(phone[i])]),
                  //Text(name[i]),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: Text('delete'),
                  ));
            }));
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.addOne, this.addName, this.addPhone}) : super(key: key);
  final addOne;
  final addName;
  final addPhone;
  var inputData = TextEditingController();
  var phoneData = TextEditingController();

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
            TextField(
              controller: phoneData,
            ),
            TextButton(
                onPressed: () {
                  addOne();
                  addName(inputData.text);
                  addPhone(phoneData.text);
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
