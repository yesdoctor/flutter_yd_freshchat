import 'package:flutter/material.dart';
import 'dart:async';
import 'update_userinfo_screen.dart';
import 'package:localstorage/localstorage.dart';
import 'package:flutter_yd_freshchat/flutter_yd_freshchat.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Item> items = [
    Item(
        text: 'Update User Info',
        onTap: (context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => UpdateUserInfoScreen()));
        }),
    Item(
        text: 'Identify User',
        onTap: (context) async {
          LocalStorage storage = LocalStorage('example_storage');
          //Navigate to update email ID and name screen
          String uid = await storage.getItem('uid');
          String restoreId = await storage.getItem('restoreId');
          if (uid == null) {
            Scaffold.of(context).showSnackBar(
                SnackBar(content: Text("Please update the user info")));
          } else if (restoreId == null) {
            String newRestoreId =
            await FlutterYdFreshchat.identifyUser(externalID: uid);
            await storage.setItem('restoreId', newRestoreId);
          } else {
            await FlutterYdFreshchat.identifyUser(
                externalID: uid, restoreID: restoreId);
          }
        }),
    Item(
        text: 'Show Conversation',
        onTap: (context) async {
          await FlutterYdFreshchat.showConversations();
        }),
    Item(
        text: 'Show FAQs',
        onTap: (context) async {
          await FlutterYdFreshchat.showFAQs();
        }),
    Item(
        text: 'Get Unread Message Count',
        onTap: (context) async {
          dynamic val = await FlutterYdFreshchat.getUnreadMsgCount();
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text("Message count $val")));
        }),
    Item(
        text: 'Setup Notifications',
        onTap: () {
          //Navigate to update email ID and name screen
        }),
    Item(
        text: 'Reset User',
        onTap: (context) async {
          await FlutterYdFreshchat.resetUser();
        }),
  ];

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    await FlutterYdFreshchat.init(
        appID: "APP_ID", appKey: "APP_KEY");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('Freshchat'),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemBuilder: (context, i) {
            return ListItem(
              item: items[i].text,
              onTap: () => items[i].onTap(context),
            );
          },
          itemCount: items.length,
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String item;
  final Function onTap;

  ListItem({@required this.item, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              new CircleAvatar(
                child: Text('A'),
              ),
              Padding(padding: EdgeInsets.only(right: 10.0)),
              Text(item)
            ],
          ),
        ),
      ),
    );
  }
}

class Item {
  String text;
  Function onTap;

  Item({@required String text, @required Function onTap}) {
    this.text = text;
    this.onTap = onTap;
  }
}
