import 'package:flutter/material.dart';

class Plan extends StatefulWidget {
  @override
  _PlanState createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 75,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
              child: RaisedButton(
                child: Text("Cardio"),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 75,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
              child: RaisedButton(
                child: Text("Styrketræning"),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 75,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
              child: RaisedButton(
                child: Text("Holdtræning"),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 75,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
              child: RaisedButton(
                child: Text("Faciliteter"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
