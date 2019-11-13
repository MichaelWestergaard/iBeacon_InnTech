import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image(image: AssetImage("assets/images/background.jpg"),fit: BoxFit.fill,),
          Positioned(
            bottom: 90,
            left: 4,
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () => print("new screen"),
                  child: Card(
                    shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1))),
                    elevation: 6,
                    child: Container(
                      width: MediaQuery.of(context).size.width/2-12,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.clipboardList,
                              size: 42,
                              color: Color(0xff0ab277),
                            ),
                            SizedBox(height: 6,),
                            Text(
                              "Planlægning",
                              style: TextStyle(
                                fontWeight: FontWeight.w900
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => print("new screen"),
                  child: Card(
                    shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1))),
                    elevation: 6,
                    child: Container(
                      width: MediaQuery.of(context).size.width/2-12,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.directions,
                              size: 42,
                              color: Color(0xff0ab277),
                            ),
                            SizedBox(height: 6,),
                            Text(
                              "Rutevejledning",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
