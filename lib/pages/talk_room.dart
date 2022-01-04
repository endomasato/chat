import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:udemy/model/message.dart';

class TalkRoom extends StatefulWidget {

  final String name;
  TalkRoom(this.name);


  @override
  _TalkRoomState createState() => _TalkRoomState();
}

class _TalkRoomState extends State<TalkRoom> {

  List messageList = [
    Message(
      message: '愛上のカキくけこしさしおうすっここkkkkkkkkkkkkkkこここここk',
      isMe: true,
      sendTime: DateTime(2021,12,30,20,45)
    ),
    Message(
        message: 'かきくけこ',
        isMe: true,
        sendTime: DateTime(2021,12,30,20,45)
    ),
    Message(
        message: 'サシスセソ',
        isMe: false,
        sendTime: DateTime(2021,12,30,20,45)
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: ListView.builder(
                physics: const RangeMaintainingScrollPhysics(),
                reverse: true,
                shrinkWrap: true,
                itemCount: messageList.length,
                itemBuilder: (context, index){
              return Padding(
                padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: index == 0 ? 10 : 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  textDirection: messageList[index].isMe ? TextDirection.rtl : TextDirection.ltr,
                  children: [
                    Container(
                        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: messageList[index].isMe ? Colors.green : Colors.white,
                        ),
                        child: Text(messageList[index].message)),
                    Text(intl.DateFormat(' HH:mm').format(messageList[index].sendTime),
                    style: const TextStyle(fontSize: 12),),
                  ],
                ),
              );
            }),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60, color: Colors.white,
              child: Row(
                 children: const [
                  Expanded(child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder()
                      ),
                    ),
                  )),
                  IconButton(onPressed: null, icon: Icon(Icons.send),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
