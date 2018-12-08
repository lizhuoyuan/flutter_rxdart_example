import 'package:flutter/material.dart';
import 'package:flutter_rxdart_example/bean/contact.dart';
import 'package:flutter_rxdart_example/page/second_page.dart';
import 'package:flutter_rxdart_example/rxdart/bolc_provider.dart';
import 'package:flutter_rxdart_example/rxdart/contact_bloc.dart';

void main() => runApp(BLoCProvider(child: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Rxdart'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});

  final String title;

  @override
  MyHomePageState createState() {
    return new MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  ContactBLoC contactBLoc;

  List<Contact> contacts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contactBLoc = ContactBLoC();
    contactBLoc.getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
              child: Text('go'))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: contactBLoc.getContacts,
        child: StreamBuilder(
          stream: contactBLoc.contacts,
          builder: _contactBulder,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          contactBLoc.getContacts();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _contactBulder(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasError) {
      return Center(
        child: Text('出错:${snapshot.error}'),
      );
    }
    if (snapshot.hasData) {
      contacts = snapshot.data;
      if (contacts.length == 0) {
        return Center(
          child: Text('没有数据'),
        );
      } else if (contacts.length > 0) {
        return ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text('${contacts[index]?.id}'),
              title: Text('${contacts[index].name}'),
              trailing: Text('${contacts[index].email}'),
            );
          },
          itemCount: contacts.length,
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.green,
              height: 1,
            );
          },
        );
      }
    }
    return Center(
      child: RefreshProgressIndicator(),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    contactBLoc.disposed();
    print('home disposed');
  }
}
