import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      body: getButtons(context),
    );
  }

  Widget getButtons(BuildContext context){
    List<Button> buttons = List<Button>();

    buttons.add(Button(Image.asset("assets/images/icons/booking.jpg"), "Booking", "/none"));
    buttons.add(Button(Image.asset("assets/images/icons/programmer.jpg"), "Træningsprogrammer", "/none"));
    buttons.add(Button(Image.asset("assets/images/icons/challenges.jpg"), "Challenges", "/none"));
    buttons.add(Button(Image.asset("assets/images/icons/udvikling.jpg"), "Min udvikling", "/none"));
    buttons.add(Button(Image.asset("assets/images/icons/statistik.jpg"), "Statistik", "/none"));
    buttons.add(Button(Image.asset("assets/images/icons/buddies.jpg"), "Buddies", "/none"));
    buttons.add(Button(Image.asset("assets/images/icons/centre.jpg"), "Centre", "/none"));
    buttons.add(Button(Image.asset("assets/images/icons/trofæer.jpg"), "Trofæer", "/none"));
    buttons.add(Button(Image.asset("assets/images/icons/planlægning.jpg"), "Planlægning", "/none"));
    buttons.add(Button(Image.asset("assets/images/icons/rutevejledning.jpg"), "Rutevejledning", "/none"));

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
          itemCount: buttons.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 4)),

          itemBuilder: (context, index) {
            Button button = buttons[index];

            return InkWell(
              onTap: () => print("new screen"),
              child: Card(
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1))),
                elevation: 6,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.clipboardList,
                      size: 42,
                      color: Color(0xff0ab277),
                    ),
                    SizedBox(height: 10),
                    Text(
                      button.title,
                      style: TextStyle(
                          fontWeight: FontWeight.w900
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}