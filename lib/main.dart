import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inntech_app/Carousel.dart';
import 'package:inntech_app/Map.dart';
import 'package:inntech_app/models/button.dart';

import 'PageTransition.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return PageTransition(page: HomeScreen());
            break;
          case '/plan':
            return PageTransition(page: HomeScreen());
            break;
          case '/route':
            return PageTransition(page: RouteScreen());
            break;
          default:
            return PageTransition(page: HomeScreen());
            break;
        }
      },
    );
  }

}

class HomeScreen extends StatefulWidget  {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HomeScreen> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f3f3),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Card(
          margin: EdgeInsets.all(10),
          shape: CircleBorder(),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: AssetImage("assets/images/img_avatar.png"),
              ),
            ),
          )
        ),
      ),
      body: Column(
        children: <Widget>[
          Carousel(),
          getButtons(context),
        ],
      )
    );
  }

  Widget getButtons(BuildContext context){
    List<Button> buttons = List<Button>();

    buttons.add(Button("assets/images/booking.png", "Booking", "/none"));
    buttons.add(Button("assets/images/training.png", "Træningsprogrammer", "/none"));
    buttons.add(Button("assets/images/arm.png", "Challenges", "/none"));
    buttons.add(Button("assets/images/weight.png", "Min udvikling", "/none"));
    buttons.add(Button("assets/images/stats.png", "Statistik", "/none"));
    buttons.add(Button("assets/images/buddies.png", "Buddies", "/none"));
    buttons.add(Button("assets/images/centres.png", "Centre", "/none"));
    buttons.add(Button("assets/images/trophy.png", "Trofæer", "/none"));
    buttons.add(Button("assets/images/shopping-list.png", "Planlægning", "/plan"));
    buttons.add(Button("assets/images/map.png", "Rutevejledning", "/route"));

    return Container(
      child: GridView.builder(
        itemCount: buttons.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 4)),
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          Button button = buttons[index];
          return Card(
            shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2))),
            elevation: 4,
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, button.route),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage(button.icon),
                    width: 40,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    button.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}