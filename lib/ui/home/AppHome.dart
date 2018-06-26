import 'package:flutter/material.dart';
import '../bar/MenuBar.dart';
import '../camera/CameraHome.dart';
import './MonoclesActionWidget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class _AppHomeState extends State<AppHome> {
  MenuBar menuBar;
  
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _AppHomeState() {
    menuBar = new MenuBar(
      menuTitle: 'monocles',
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: menuBar.build(context),
      key: _scaffoldKey,
      body: 
          new Stack(
            children: <Widget>[
              new CameraWidget(),
              new MonoclesActionWidget(),
              new SpinKitChasingDots(
                color: Colors.pink[200],
                width: 50.0,
                height: 75.0,
              ),
              new SpinKitChasingDots(
                color: Colors.purple[200],
                width: 35.0,
                height: 50.0,
              ),
              new SpinKitChasingDots(
                color: Colors.teal[200],
                width: 20.0,
                height: 30.0,
              )
            ]
          ),
      resizeToAvoidBottomPadding: true
    );
  }
}
class AppHome extends StatefulWidget {
  @override _AppHomeState createState() => new _AppHomeState();
}