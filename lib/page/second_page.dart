/*
 * author: Created by 李卓原 on 2018/12/8.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_rxdart_example/rxdart/bolc_provider.dart';
import 'package:flutter_rxdart_example/rxdart/contact_bloc.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  ContactBLoC contactBLoc;

  @override
  Widget build(BuildContext context) {
    contactBLoc = BLoCProvider.ofContact(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('second'),
      ),
      body: Column(children: <Widget>[
        StreamBuilder(
          stream: contactBLoc.contacts,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Text('共获取到了${snapshot.data.length}条数据');
            }
            return Text('no data');
          },
        ),
        RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SecondPage()));
            },
            child: Text('go to new second')),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          contactBLoc.getContacts();
        },
        tooltip: 'Increment',
        child: Icon(Icons.refresh),
      ), //
    );
  }
}
