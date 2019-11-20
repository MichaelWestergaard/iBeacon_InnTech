import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_beacon/flutter_beacon.dart';

class RouteScreen extends StatefulWidget {
  @override
  _RouteScreenState createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  StreamSubscription<RangingResult> _streamRanging;
  StreamSubscription<MonitoringResult> _streamMonitoring;
  final _regionBeacons = <Region, List<Beacon>>{};
  final _beacons = <Beacon>[];

  @override
  void initState() {
    super.initState();

    initBeacon();
  }

  initBeacon() async {
    try {
      await flutterBeacon.initializeScanning;
      print('Beacon scanner initialized');
    } on PlatformException catch (e) {
      print(e);
    }

    final regions = <Region>[];

    if (Platform.isIOS) {
      regions.add(Region(
          identifier: 'Apple Airlocate',
          proximityUUID: 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0'));
    } else {
      // android platform, it can ranging out of beacon that filter all of Proximity UUID
      regions.add(Region(identifier: 'com.beacon'));
    }

    _streamMonitoring = flutterBeacon.monitoring(regions).listen((MonitoringResult result) {
      // result contains a region, event type and event state
      print("dissemand" + result.toString());
    });


  }

  int _compareParameters(Beacon a, Beacon b) {
    int compare = a.proximityUUID.compareTo(b.proximityUUID);

    if (compare == 0) {
      compare = a.major.compareTo(b.major);
    }
    return compare;
  }

  @override
  void dispose() {
    if (_streamRanging != null) {
      _streamRanging.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test détection balises'),
        ),
        body: _beacons == null
            ? Center(child: CircularProgressIndicator())
            : ListView(
          children: ListTile.divideTiles(
              context: context,
              tiles: _beacons.map((beacon) {
                return ListTile(
                  title: Text(beacon.proximityUUID),
                  subtitle: new Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Flexible(
                          child: Text(
                              'Major: ${beacon.major}\n',
                              style: TextStyle(fontSize: 13.0)),
                          flex: 1,
                          fit: FlexFit.tight),
                      Flexible(
                          child: Text(
                              'Accuracy: ${beacon.accuracy}m\nRSSI: ${beacon.rssi}',
                              style: TextStyle(fontSize: 13.0)),
                          flex: 2,
                          fit: FlexFit.tight)
                    ],
                  ),
                );
              })).toList(),
        ),
      ),
    );
  }
}