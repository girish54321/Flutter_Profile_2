import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';

import 'Animation/FadeAnimation.dart';

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

Widget _diveder() {
  return Container(
    color: Colors.grey,
    width: 1,
    height: 28,
  );
}

Widget profileImage() {
  return Container(
      width: 50.0,
      height: 50.0,
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          image: new DecorationImage(
              fit: BoxFit.fill,
              image: new NetworkImage(
                  'https://coderthemes.com/simple/bs3/dark/assets/images/users/avatar-1.jpg'))));
}

Widget mainProfileImage() {
  return (Align(
    alignment: Alignment.topCenter,
    child: new Container(
        margin: EdgeInsets.only(top: 80),
        width: 130.0,
        height: 130.0,
        decoration: new BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            image: new DecorationImage(
                fit: BoxFit.fill,
                image: new NetworkImage(
                    'https://coderthemes.com/simple/bs3/dark/assets/images/users/avatar-1.jpg')))),
  ));
}

Widget anim() {
  return ControlledAnimation(
    duration: Duration(milliseconds: 600),
//      delay: Duration(milliseconds: (300 * 2).round()),
    curve: Curves.elasticOut,
    tween: Tween<double>(begin: 0, end: 1),
    builder: (context, scaleValue) {
      return Transform.scale(
        scale: scaleValue,
        alignment: Alignment.center,
        child: mainProfileImage(),
      );
    },
  );
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final margin = MediaQuery.of(context).size.height - 450;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      color: Colors.blue,
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppBar(leading: IconButton(icon: Icon(Icons.clear,color: Colors.white,), onPressed: (){}),
                    elevation: 0,
                    actions: <Widget>[IconButton(icon: Icon(Icons.share,color: Colors.white,), onPressed: (){})],),
                    anim(),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Aditi",
                    style: TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                  1,
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.home,
                              size: 20,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "India",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 17),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_city,
                              size: 20,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Mumbai",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 17),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.work,
                              size: 20,
                              color: Colors.pink,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Web Devloper",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 17),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                  1.1,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            size: 28,
                            color: Colors.blue,
                          ),
                          label: Text("Add")),
                      _diveder(),
                      FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.mail, color: Colors.orange),
                          label: Text("Massage")),
                      _diveder(),
                      FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.block, color: Colors.red),
                          label: Text("Block"))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 80.0, // I'm forcing item heights
            delegate: SliverChildBuilderDelegate(
              (context, index) => FadeAnimation(
                1.3,
                ListTile(
                  leading: profileImage(),
                  title: Text("Hello"),
                  subtitle: Text("Hello"),
                  trailing: Text("Today"),
                ),
              ),
              childCount: 6,
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
