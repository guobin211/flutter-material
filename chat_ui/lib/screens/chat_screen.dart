import 'package:chat_ui/models/message_model.dart';
import 'package:chat_ui/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.user.name,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          )
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                child: ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.only(top: 15.0),
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Message message = messages[index];
                    bool isMe = message.sender.id == currentUser.id;
                    return _buildMessage(message, isMe);
                  },
                ),
              ),
            ),
          ),
          _buildInput()
        ]),
      ),
    );
  }

  Widget _buildMessage(Message message, bool isMe) {
    return Container(
      margin: isMe
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
          : EdgeInsets.only(top: 8.0, bottom: 8.0, right: 80.0),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      decoration: BoxDecoration(
          color: isMe ? Color(0xFFFFEFEE) : Theme.of(context).accentColor,
          borderRadius: isMe
              ? BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0))
              : BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(message.time),
          SizedBox(
            height: 8.0,
          ),
          Text(message.text)
        ],
      ),
    );
  }

  Widget _buildInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
