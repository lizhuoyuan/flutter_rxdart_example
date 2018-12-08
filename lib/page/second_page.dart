/*
 * author: Created by 李卓原 on 2018/12/8.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second'),
      ),
      body: Column(children: <Widget>[
        RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SecondPage()));
            },
            child: Text('go')),
      ]),
    );
  }
}
