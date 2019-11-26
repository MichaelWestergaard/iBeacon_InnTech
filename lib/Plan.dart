import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inntech_app/Navigation.dart';
import 'package:inntech_app/models/button.dart';

import 'PageTransition.dart';

class Plan extends StatefulWidget {
  @override
  _PlanState createState() => _PlanState();

  List<Place> plannedRoute = List<Place>();

  List<String> navigation = List<String>();

}

class _PlanState extends State<Plan> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff3f3f3),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Card(
                margin: EdgeInsets.all(10),
                shape: CircleBorder(),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Icon(
                      FontAwesomeIcons.arrowLeft,
                      color: Colors.black,
                    ),
                  ),
                )
            ),
          ),
          centerTitle: true,
          title: Text(
            "Planlægning",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            getButtons(context),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(4),
                itemCount: widget.plannedRoute.length,
                itemBuilder: (context, index) =>
                    buildRoute(context, widget.plannedRoute[index], index),
              ),
            ),
            widget.plannedRoute.length > 0 ? RaisedButton(
              onPressed: () {
                widget.navigation.insert(0, "ind");
                widget.navigation.add("ind");

                print(widget.navigation);

                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Navigation(widget.navigation))
                );
              },
              color: Colors.blue,
              child: Text("Få rutevejledning", style: TextStyle(color: Colors.white),),
            )
                : Container()
          ],
        )
    );
  }

  Widget buildRoute(BuildContext context, Place place, int index){
    return Card(
      child: ListTile(
        title: Text(place.name),
        trailing: Card(
          shape: CircleBorder(),
          child: InkWell(
            onTap: () {
              print("clicked");
              setState(() {
                widget.plannedRoute.removeAt(index);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                FontAwesomeIcons.minus,
                size: 20,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildItem(BuildContext context, Place place){
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          setState(() {
            widget.plannedRoute.add(place);
            widget.navigation.add(place.navigation);

          });
        },
        child: ListTile(
          title: Text(place.name),

        ),
      ),
    );
  }

  Widget getButtons(BuildContext context){
    List<Button> buttons = List<Button>();

    buttons.add(Button("assets/images/running.png", "Cardio", "/none"));
    buttons.add(Button("assets/images/training.png", "Styrketræning", "/none"));
    buttons.add(Button("assets/images/buddies.png", "Holdtræning", "/none"));
    buttons.add(Button("assets/images/wc.png", "Faciliteter", "/none"));

    List<Place> cardioButtons = List<Place>();

    cardioButtons.add(Place("Løbebånd", "løb"));
    cardioButtons.add(Place("Motionscykel", "under løb"));
    cardioButtons.add(Place("Crosstrainer", "paddle"));
    cardioButtons.add(Place("Romaskine", "træk"));

    List<Place> strengthButtons = List<Place>();

    strengthButtons.add(Place("Bænkpres", "bænk"));
    strengthButtons.add(Place("Squat", "stor"));
    strengthButtons.add(Place("Leg extensions", "ben"));
    strengthButtons.add(Place("Preacher Curl (maskine)", "bryst"));

    List<Place> teamButtons = List<Place>();

    teamButtons.add(Place("Spinning", "hold"));

    List<Place> facilityButtons = List<Place>();

    facilityButtons.add(Place("Omklædning (mand)", "fælles"));
    facilityButtons.add(Place("Omklædning (kvinde)", "fælles"));

    return Container(
      child: GridView.builder(
        itemCount: buttons.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          Button button = buttons[index];
          return Card(
            shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2))),
            elevation: 4,
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {

                    List<Place> dialogList;

                    switch(button.title) {
                      case "Cardio": dialogList = cardioButtons; break;
                      case "Styrketræning": dialogList = strengthButtons; break;
                      case "Holdtræning": dialogList = teamButtons; break;
                      case "Faciliteter": dialogList = facilityButtons; break;
                      default: dialogList = new List<Place>(); break;
                    }

                    return AlertDialog(
                      title: Text(button.title),
                        actions: <Widget>[
                        FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Luk')),
                      ],
                      content: Container(
                        width: double.maxFinite,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.all(4),
                          itemCount: dialogList.length,
                          itemBuilder: (context, index) =>
                              buildItem(context, dialogList[index]),
                        ),
                      ),
                    );
                  }
                );
              },
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

  Widget getList(BuildContext context){

  }
}

class Place {
  String name;
  String navigation;

  Place(this.name, this.navigation);



}
