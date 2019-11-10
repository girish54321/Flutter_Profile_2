import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Widget _diveder(){
  return Container(
    color: Colors.grey,
    width: 1,
    height: 28,
  );
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final margin = MediaQuery.of(context).size.height - 450;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.blue,
            width: MediaQuery.of(context).size.width,
            height: 150,
          ),
          Column(children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: new Container(
                margin: EdgeInsets.only(top: 80),
                  width: 130.0,
                  height: 130.0,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(
                              'https://coderthemes.com/simple/bs3/dark/assets/images/users/avatar-1.jpg')))),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton.icon(
                    onPressed: (){}, icon: Icon(Icons.add,size: 28,color: Colors.blue,), label: Text("Add")),
                _diveder(),
                FlatButton.icon(
                    onPressed: (){}, icon: Icon(Icons.mail,color: Colors.orange), label: Text("Massage")),
                _diveder(),
                FlatButton.icon(
                    onPressed: (){}, icon: Icon(Icons.block,color: Colors.red), label: Text("Block"))
              ],
            ),

          ],),

        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
