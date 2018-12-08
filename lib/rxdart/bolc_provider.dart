/*
 * author: Created by 李卓原 on 2018/12/8.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_rxdart_example/rxdart/contact_bloc.dart';

class BLoCProvider extends InheritedWidget {
  BLoCProvider({Key key, Widget child}) : super(key: key, child: child);

  final contactProvider = ContactBLoC();

  static ContactBLoC ofContact(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BLoCProvider) as BLoCProvider)
          .contactProvider;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
