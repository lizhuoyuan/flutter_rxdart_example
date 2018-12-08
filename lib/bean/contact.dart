/*
 * author: Created by 李卓原 on 2018/12/8.
 * email: zhuoyuan93@gmail.com
 *
 */

class Contact {
  String name;
  String email;
  int id;

  Contact({this.name, this.email, this.id});

  Contact.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['id'] = this.id;
    return data;
  }
}
