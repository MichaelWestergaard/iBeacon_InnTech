import 'package:flutter/material.dart';

class Plan extends StatefulWidget {
  @override
  _PlanState createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text("Cardio"),
        ),
        RaisedButton(
          child: Text("Styrketræning"),
        ),
        RaisedButton(
          child: Text("Holdtræning"),
        ),
        RaisedButton(
          child: Text("Faciliteter"),
        ),
      ],
    );
  }
}
