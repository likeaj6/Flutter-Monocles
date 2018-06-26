import 'package:flutter/material.dart';

var actions = ['Back', 'Find Text', 'Find Object'];

class _MonoclesState extends State<MonoclesActionWidget> {
  List _actionItems;
  List<Widget> _actionCards;
  AnimatedContainer _defaultActionCard;
  bool _searchClicked = false;
  int numActionItems = 1;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _MonoclesState() {
    
  }

  actionCardClicked() {
    this.setState(() { 
      _searchClicked = !_searchClicked;
    });
    print(this._actionCards);
  }

  @override
  void initState() {
      super.initState();
      _actionItems = new List.from(actions);
  }

  List<Widget> populateActionCards() {
    return new List.generate(_actionItems.length, (int index) {
      var icon, action;
      switch (_actionItems[index]) {
        case 'Back':
          icon = new Icon(Icons.backspace);
          break;
        case 'Find Text':
          icon = new Icon(Icons.text_fields);
          action = {};
          break;
        default:
          icon = new Icon(Icons.bubble_chart);
          action = {};
          break;
      }
      IconButton button = new IconButton(
            // label: _actionItems[index],
            icon: icon,
            color: Colors.blue,
            onPressed: () => this.setState(() => _searchClicked = false)
      );
      return new AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: 200.0,
        width: MediaQuery.of(context).size.width*0.5,
        child: new Card(
          color: Colors.white.withAlpha(220),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
          elevation: 7.0,
          child: button
          ),
        );
      });
    }

  @override
  Widget build(BuildContext context) {
    _defaultActionCard = new AnimatedContainer(
                duration: Duration(milliseconds: 200),
                height: 200.0,
                width: MediaQuery.of(context).size.width*0.8,
                child: new Card(
                  color: Colors.white.withAlpha(220),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  elevation: 7.0,
                  child: new IconButton(
                    icon: new Icon(Icons.search),
                    color: Colors.blue,
                    iconSize: 75.0,
                    onPressed: () => actionCardClicked()
                  ),
                )
              );
    _actionCards = _searchClicked ? populateActionCards(): new List.from([_defaultActionCard]);
    return new Container(
      alignment: Alignment.topCenter,
      padding: new EdgeInsets.only(
          top: MediaQuery.of(context).size.height*0.25,
          left: MediaQuery.of(context).size.width*0.1,
          // right: MediaQuery.of(context).size.width*0.1
      ),
      child: new ListView(
          children: <Widget>[
            new Container(
              height: 250.0,
              child: new ListView(
                scrollDirection: Axis.horizontal,
                children: _actionCards,
              ),
            ),
          ],
        ),
    );
  }
}
class MonoclesActionWidget extends StatefulWidget {
  @override _MonoclesState createState() => new _MonoclesState();
}