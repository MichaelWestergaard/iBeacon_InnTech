import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Navigation extends StatefulWidget {
  @override
  _Navigation createState() => _Navigation();
  List<String> order;
  Navigation(this.order);

  int x = 0;
}

class _Navigation extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    String one = "";
    String two = "";
    List<String> picstack = List<String>();
    if (widget.order != null) {
      for (int step = 0; step < widget.order.length - 1; step++) {
        one = widget.order[step];
        two = widget.order[step + 1];
        picstack.add(getImage(one, two));
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
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
          "Rutevejledning",
          style: TextStyle(
              color: Colors.black,
              fontSize: 16
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
        child: Column(
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/images/gym.png"),
                  ),
                  (widget.order != null)
                      ? Image(
                    image: AssetImage(
                        "assets/images/" + picstack[widget.x] + ".png"),
                  )
                      : Container(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      width: MediaQuery.of(context).size.width,
                      child: FlatButton(
                        child: Stack(
                          children: <Widget>[
                            Text('Næste rute'),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.lightBlue)),
                        color: Colors.lightBlue,
                        textColor: Colors.white,
                        onPressed: () {
                          setState(() {
                            if ((widget.x + 1) < picstack.length) widget.x++;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String getImage(one, two) {
    if (one == "ind" && two == "ben" || one == "ben" && two == "ind") {
      return "ind_ben";
    } else if (one == "ind" && two == "bryst" || one == "bryst" && two == "ind") {
      return "ind_bryst";
    } else if (one == "ind" && two == "bænk" || one == "bænk" && two == "ind") {
      return "ind_bænk";
    } else if (one == "ind" && two == "fælles" || one == "fælles" && two == "ind") {
      return "ind_fælles";
    } else if (one == "ind" && two == "hold" || one == "hold" && two == "ind") {
      return "ind_hold";
    } else if (one == "ind" && two == "løb" || one == "løb" && two == "ind") {
      return "ind_løb";
    } else if (one == "ind" && two == "paddle" || one == "paddle" && two == "ind") {
      return "ind_paddle";
    } else if (one == "ind" && two == "stor" || one == "stor" && two == "ind") {
      return "ind_stor";
    } else if (one == "ind" && two == "træk" || one == "træk" && two == "ind") {
      return "ind_træk";
    } else if (one == "ind" && two == "under løb" || one == "under løb" && two == "ind") {
      return "ind_under løb";
    } else if (one == "hold" && two == "ben" || one == "ben" && two == "hold") {
      return "hold_ben";
    } else if (one == "hold" && two == "bryst" || one == "bryst" && two == "hold") {
      return "hold_bryst";
    } else if (one == "hold" && two == "bænk" || one == "bænk" && two == "hold") {
      return "hold_bænk";
    } else if (one == "hold" && two == "fælles" || one == "fælles" && two == "hold") {
      return "hold_fælles";
    } else if (one == "hold" && two == "løb" || one == "løb" && two == "hold") {
      return "hold_løb";
    } else if (one == "hold" && two == "paddle" || one == "paddle" && two == "hold") {
      return "hold_paddle";
    } else if (one == "hold" && two == "stor" || one == "stor" && two == "hold") {
      return "hold_stor";
    } else if (one == "hold" && two == "træk" || one == "træk" && two == "hold") {
      return "hold_træk";
    } else if (one == "hold" && two == "under løb" || one == "under løb" && two == "hold") {
      return "hold_under løb";
    } else if (one == "stor" && two == "ben" || one == "ben" && two == "stor") {
      return "stor_ben";
    } else if (one == "stor" && two == "bryst" || one == "bryst" && two == "stor") {
      return "stor_bryst";
    } else if (one == "stor" && two == "bænk" || one == "bænk" && two == "stor") {
      return "stor_bænk";
    } else if (one == "stor" && two == "fælles" || one == "fælles" && two == "stor") {
      return "stor_fælles";
    } else if (one == "stor" && two == "løb" || one == "løb" && two == "stor") {
      return "stor_løb";
    } else if (one == "stor" && two == "paddle" || one == "paddle" && two == "stor") {
      return "stor_paddle";
    } else if (one == "stor" && two == "træk" || one == "træk" && two == "stor") {
      return "stor_træk";
    } else if (one == "stor" && two == "under løb" || one == "under løb" && two == "stor") {
      return "stor_under løb";
    } else if (one == "bænk" && two == "ben" || one == "ben" && two == "bænk") {
      return "bænk_ben";
    } else if (one == "bænk" && two == "bryst" || one == "bryst" && two == "bænk") {
      return "bænk_bryst";
    } else if (one == "bænk" && two == "fælles" || one == "fælles" && two == "bænk") {
      return "bænk_fælles";
    } else if (one == "bænk" && two == "løb" || one == "løb" && two == "bænk") {
      return "bænk_løb";
    } else if (one == "bænk" && two == "paddle" || one == "paddle" && two == "bænk") {
      return "bænk_paddle";
    } else if (one == "bænk" && two == "træk" || one == "træk" && two == "bænk") {
      return "bænk_træk";
    } else if (one == "bænk" && two == "under løb" || one == "under løb" && two == "bænk") {
      return "bænk_under løb";
    } else if (one == "bryst" && two == "ben" || one == "ben" && two == "bryst") {
      return "bryst_ben";
    } else if (one == "bryst" && two == "fælles" || one == "fælles" && two == "bryst") {
      return "bryst_fælles";
    } else if (one == "bryst" && two == "løb" || one == "løb" && two == "bryst") {
      return "bryst_løb";
    } else if (one == "bryst" && two == "paddle" || one == "paddle" && two == "bryst") {
      return "bryst_paddle";
    } else if (one == "bryst" && two == "træk" || one == "træk" && two == "bryst") {
      return "bryst_træk";
    } else if (one == "bryst" && two == "under løb" || one == "under løb" && two == "bryst") {
      return "bryst_under løb";
    } else if (one == "ben" && two == "fælles" || one == "fælles" && two == "ben") {
      return "ben_fælles";
    } else if (one == "ben" && two == "løb" || one == "løb" && two == "ben") {
      return "ben_løb";
    } else if (one == "ben" && two == "paddle" || one == "paddle" && two == "ben") {
      return "ben_paddle";
    } else if (one == "ben" && two == "træk" || one == "træk" && two == "ben") {
      return "ben_træk";
    } else if (one == "ben" && two == "under løb" || one == "under løb" && two == "ben") {
      return "ben_under løb";
    } else if (one == "fælles" && two == "løb" || one == "løb" && two == "fælles") {
      return "fælles_løb";
    } else if (one == "fælles" && two == "paddle" || one == "paddle" && two == "fælles") {
      return "fælles_paddle";
    } else if (one == "fælles" && two == "træk" || one == "træk" && two == "fælles") {
      return "fælles_træk";
    } else if (one == "fælles" && two == "under løb" || one == "under løb" && two == "fælles") {
      return "fælles_under løb";
    } else if (one == "træk" && two == "løb" || one == "løb" && two == "træk") {
      return "træk_løb";
    } else if (one == "træk" && two == "paddle" || one == "paddle" && two == "træk") {
      return "træk_paddle";
    } else if (one == "træk" && two == "under løb" || one == "under løb" && two == "træk") {
      return "træk_under løb";
    } else if (one == "under løb" && two == "løb" || one == "løb" && two == "under løb") {
      return "under løb_løb";
    } else if (one == "under løb" && two == "paddle" || one == "paddle" && two == "under løb") {
      return "under løb_paddle";
    } else if (one == "paddle" && two == "løb" || one == "løb" && two == "paddle") {
      return "paddle_løb";
    }
    return "";
  }
}
