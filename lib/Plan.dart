import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inntech_app/models/button.dart';

class Plan extends StatefulWidget {
  @override
  _PlanState createState() => _PlanState();

  List<Place> plannedRoute = [Place("1"),Place("1"),Place("1"),Place("1"),Place("1"),Place("1"),Place("1"),Place("1"),];

}

class _PlanState extends State<Plan> {

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
            RaisedButton(
              onPressed: () {},
              color: Colors.blue,
              child: Text("Få rutevejledning", style: TextStyle(color: Colors.white),),
            )
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

  Widget getButtons(BuildContext context){
    List<Button> buttons = List<Button>();

    buttons.add(Button("assets/images/running.png", "Cardio", "/none"));
    buttons.add(Button("assets/images/training.png", "Styrketræning", "/none"));
    buttons.add(Button("assets/images/buddies.png", "Holdtræning", "/none"));
    buttons.add(Button("assets/images/wc.png", "Faciliteter", "/none"));

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

  Widget getList(BuildContext context){

  }
}

class Place {
  String name;

  Place(this.name);


}
