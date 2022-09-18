import 'package:flutter/material.dart';
import 'messages.dart';
import 'users.dart';

class chatContact extends StatefulWidget {
  const chatContact({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  State<chatContact> createState() => _chatContactState();
}

class _chatContactState extends State<chatContact> {
  _chatBubble(messageExchange message, bool isMe) {
    if (!isMe) {
      return Scrollbar(
          child: Column(
        children: <Widget>[
          Column(
            children: [
              Row(
                children: <Widget>[
                  Container(
                    child: Container(
                      alignment: Alignment.topLeft,
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.5,
                      ),
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          color: const Color(0xffEFF0F0),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomLeft: Radius.zero,
                            bottomRight: Radius.circular(20.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            )
                          ]),
                      child: Text(
                        message.text,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      message.time,
                      style:
                          const TextStyle(fontSize: 11, color: Colors.black54),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ));
    } else {
      return Scrollbar(
          child: Column(
        children: <Widget>[
          Column(
            children: [
              Row(
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topRight,
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.5,
                    ),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.zero,
                          bottomLeft: Radius.circular(20.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          )
                        ]),
                    child: Text(
                      message.text,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  Text(
                    message.time,
                    style: const TextStyle(fontSize: 11, color: Colors.black54),
                  )
                ],
              ),
            ],
          )
        ],
      ));
    }
  }

  _sendMessageArea() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.attach_file),
            iconSize: 25,
            color: Colors.deepPurple,
          ),
          const Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(hintText: "Send a message"),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send),
            iconSize: 25,
            color: Colors.deepPurple,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(
          widget.user.name,
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(20),
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                final messageExchange message = messages[index];
                final bool isMe = message.sender.id == currentUser.id;
                return _chatBubble(message, isMe);
              },
            ),
          ),
          _sendMessageArea(),
        ],
      ),
    );
  }
}
