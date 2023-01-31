import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

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
  getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('허락됨');
      var contacts = await ContactsService.getContacts();
      //print(contacts[0].phones);
      setState(() {
        name = contacts;
      });

    } else if (status.isDenied) {
      print('거절됨');
      Permission.contacts.request();
    }
  }

  var total = 3;
  var name = [];
  List<String> phone = ['123', '345', '456'];
  var like = [0, 0, 0];
  var newContact = new Contact();
  //var contacts = await ContactsService.getContacts();

  addname(a) {
    setState(() {
      if (a != '') {
        name.add(a);
        name.sort();
      }
    });
  }

  addphone(p) {
    setState(() {
      if (p != '') {
        phone.add(p);
      }
    });
  }

  addOne() {
    setState(() {
      total++;
    });
  }

  addnewContact(c) async{
    setState(() {
      if (c != ''){
        newContact.givenName = c;
        ContactsService.addContact(newContact);
      }
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
                return DialogUI(
                  addOne: addOne,
                  addName: addname,
                  addPhone: addphone,
                  addnewContact: addnewContact,

                );
              });
        },
        child: Text('add'),
      ),
      appBar: AppBar(
        title: Text(total.toString()),
        actions: [
          IconButton(
              onPressed: () {
                getPermission();
              },
              icon: Icon(Icons.contacts))
        ],
      ),
      body: ListView.builder(
          itemCount: name.length,
          itemBuilder: (c, i) {
            return ListTile(
                leading: Icon(Icons.heart_broken),
                title: Row(
                  children: [Text(name[i].givenName)],
                ),
                //Text(name[i]),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      name.removeAt(i);
                      phone.removeAt(i);
                    });
                  },
                  icon: Icon(Icons.delete),
                ));
          }),
    );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.addOne, this.addName, this.addPhone, this.addnewContact,})
      : super(key: key);
  final addOne;
  final addName;
  final addPhone;
  final addnewContact;
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
              decoration: InputDecoration(hintText: 'name'),
            ),
            /*TextField(
                controller: phoneData,
                decoration: InputDecoration(hintText: 'phone')),*/
            TextButton(
                onPressed: () {
                  addOne();
                  /*addName(inputData.text);
                  addPhone(phoneData.text);*/
                  addnewContact(inputData.text);
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
