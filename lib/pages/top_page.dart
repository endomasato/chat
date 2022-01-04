import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:udemy/model/user.dart';
import 'package:udemy/pages/settings_profile.dart';
import 'package:udemy/pages/talk_room.dart';

class TopPage extends StatefulWidget {

  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  List userList = [
    User(
      name: '遠藤',
      uid: 'abc',
      imagePath: 'https://i.ytimg.com/vi/gzkOP1k_R3k/hqdefault.jpg?sqp=-oaymwEjCPYBEIoBSFryq4qpAxUIARUAAAAAGAElAADIQj0AgKJDeAE=&rs=AOn4CLAko8obrI0RNvsZQeGLR5OFeXOBfg',
      lastMessage: 'こんにちは！',
    ),
    User(
      name: '斉藤',
      uid: 'def',
      imagePath: 'https://i.ytimg.com/vi/L8O2aDpYCiY/hqdefault.jpg?sqp=-oaymwEjCPYBEIoBSFryq4qpAxUIARUAAAAAGAElAADIQj0AgKJDeAE=&rs=AOn4CLCZXTex8LsPDBolVVW0LkS0L23ojg',
      lastMessage: 'こんばんわ！',
    ),
    User(
      name: '後藤',
      uid: 'ghi',
      imagePath: 'https://i.ytimg.com/vi/ZoyuOGurRQI/hqdefault.jpg?sqp=-oaymwEjCPYBEIoBSFryq4qpAxUIARUAAAAAGAElAADIQj0AgKJDeAE=&rs=AOn4CLBbWhRbk2AGDud_NbpCMUDAoD5cFg',
      lastMessage: 'おはよう！',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('チャットアプリサンプル'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsProfilePage()));
              }, icon: Icon(Icons.settings))
        ],
      ),
      body: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index){
        return InkWell(
          onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => TalkRoom(userList[index].name.toString())));
          },
          child: Container(
            height: 70,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0 ),
                  child: CircleAvatar(
                    radius: 30, backgroundImage: NetworkImage(userList[index].imagePath.toString())
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(userList[index].name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
                    Text(userList[index].lastMessage, style: TextStyle(color: Colors.grey),)
                  ],
                )
              ],
            ),
          ),
        );
      })
    );
  }
}
