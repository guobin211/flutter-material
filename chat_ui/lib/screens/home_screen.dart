import 'package:chat_ui/components/category_selector.dart';
import 'package:chat_ui/components/favorite_contacts.dart';
import 'package:chat_ui/components/recent_chat.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {},
        ),
        title: Text('Chats', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
              child: Column(
                children: <Widget>[FavouriteContacts(), RecentChat()],
              ),
            ),
          )
        ],
      ),
    );
  }
}
