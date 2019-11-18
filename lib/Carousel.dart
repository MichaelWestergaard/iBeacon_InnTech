import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current = 0;
  final imgList = new List(3);

  @override
  Widget build(BuildContext context) {
    imgList[0] = "assets/images/banner1.jpg";
    imgList[1] = "assets/images/banner1.jpg";
    imgList[2] = "assets/images/banner1.jpg";

    return Stack(
        children: [
      CarouselSlider(
        items: imgList
            .asMap()
            .map((i, value) {
              return MapEntry(i, Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Stack(children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image(
                              image: AssetImage(value),
                            ),
                          ),
                          Positioned(
                            right: 20,
                            bottom: 0,
                            child: RaisedButton(
                              onPressed: () {},
                              color: Colors.white,
                              child: Text("LÆS",
                                style: TextStyle(
                                    color: Color(0xff12b679),
                                    fontWeight: FontWeight.w700,
                                  fontSize: 16
                                ),
                              ),
                            ),
                          )
                        ]),
                      ));
                },
              ));
            })
            .values
            .toList(),
        autoPlay: false,
        enableInfiniteScroll: false,
        aspectRatio: 2,
        viewportFraction: 0.9,
        onPageChanged: (index) {
          setState(() {
            _current = index;
          });
        },
      ),
      Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList
                .asMap()
                .map((index, value) {
                  return MapEntry(
                      index,
                      Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                                ? Color(0xff12b679)
                                : Color(0xffb4b5ba)),
                      ));
                })
                .values
                .toList(),
          ))
    ]);
  }
}
