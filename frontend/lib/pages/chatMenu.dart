import 'package:flutter/material.dart';
import 'chat.dart';
import 'messages.dart';

class chatMenu extends StatefulWidget {
  const chatMenu({Key? key}) : super(key: key);

  @override
  State<chatMenu> createState() => _chatMenuState();
}

class _chatMenuState extends State<chatMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text("Chats",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
      )),
    );
  }
}
