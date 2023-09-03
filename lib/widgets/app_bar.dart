import 'package:flutter/material.dart';

//custom app Bar
appBarItems({BuildContext? context, bool showBackButton = false}) {
  return AppBar(
    backgroundColor: Colors.black87,
    leadingWidth: showBackButton ? 45 : 0,
    title: const Center(
        child: Text(
      'My Movie App',
      style: TextStyle(color: Colors.white),
    )),
  );
}
