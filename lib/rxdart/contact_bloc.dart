/*
 * author: Created by 李卓原 on 2018/12/8.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter_rxdart_example/bean/contact.dart';
import 'package:flutter_rxdart_example/utils/http_util.dart';
import 'package:rxdart/rxdart.dart';

class ContactBLoC {
  List<Contact> _contacts;

  var _subject = BehaviorSubject<List<Contact>>();

  Stream<List<Contact>> get contacts => _subject.stream;

  Future getContacts() async {
    var response = await HttpUtil().get('get_contacts');
    List data = response['data'];
    print(data);
    _contacts = List<Contact>();
    data.forEach((item) => _contacts.add(Contact.fromJson(item)));
    _subject.add(_contacts);
  }

  void disposed() {
    _subject.close();
  }
}
