import 'package:flutter/material.dart';

class MenuBar extends AppBar {
  final String menuTitle;
  final double barHeight = 66.0;

   /// The controller to be used in the textField.
  TextEditingController controller;
  
  AppBar buildAppBar(BuildContext context) {
    final double statusBarHeight = MediaQuery
      .of(context)
      .padding
      .top;
    return AppBar(
      title: new Text(
        this.menuTitle,
        style: const TextStyle(
        color: Colors.white,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: 30.0,
        ) 
      ),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Color.fromRGBO(205, 235, 225, 1.0),
      leading: getSearchAction(context),
    );
  } 

  MenuBar({
    this.menuTitle,
    this.controller,
  }) {
    if (this.controller == null) {
      this.controller = new TextEditingController();
    }

    this.controller.addListener(() {
      if (this.controller.text.isEmpty) {

        return;
      }
    });
}

  IconButton getSearchAction(BuildContext context) {
    return new IconButton(
      icon: new Icon(Icons.menu),
      onPressed: () {
        beginSearch(context);
      }
    );
  } 

  void beginSearch(BuildContext context) {

  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
      .of(context)
      .padding
      .top;

    return buildAppBar(context);
  }
}