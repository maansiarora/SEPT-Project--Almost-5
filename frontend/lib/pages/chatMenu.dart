// importing required packages and pages
import 'package:flutter/material.dart';
import 'doctorDashboard.dart';
import 'chat.dart';
import 'messages.dart';

// this page is to display the chat menu where the user will be able to see the preview of all the chats they have had with different people
class chatMenu extends StatefulWidget {
  const chatMenu({Key? key}) : super(key: key);

  @override
  State<chatMenu> createState() => _chatMenuState();
}

class _chatMenuState extends State<chatMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // adding app bar with the back icon to go back to the dashboard
      appBar: AppBar(
        // heading "chat" being displayed on the app bar
        title: const Text("Chats",
            style: TextStyle(
                color: Colors.deepPurple, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => doctorDashboard()),
            );
          },
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      // adding scrollbar to the page
      body: Scrollbar(
          child: SingleChildScrollView(
              child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[],
            ),
          ),
          // adding the search bar to search through the name
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Material(
              elevation: 10.0,
              shadowColor: Colors.black45,
              borderRadius: const BorderRadius.all(Radius.circular(40)),
              child: TextField(
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Search',
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 15),
                    prefixIcon: const Icon(Icons.search)),
              ),
            ),
          ),
          // getting the name of the sender, their message and the time the message was sent from the user and model classes
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: chats.length,
              itemBuilder: (BuildContext context, int index) {
                final messageExchange chat = chats[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => chatContact(
                                user: chat.sender,
                              ))),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 13, 20, 0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            chat.sender.name,
                                            style: const TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            chat.time,
                                            style: const TextStyle(
                                                fontSize: 11,
                                                color: Colors.black54),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          chat.text,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.black87),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                      const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 10, 0, 0),
                                          child: Divider(
                                            color: Colors.black26,
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ],
      ))),
    );
  }
}
