import 'package:flutter/material.dart';

Widget emptyWidget(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 150.0),
    alignment: Alignment.center,
    child: Text(
      'No results found',
      style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 32.0),
    ),
  );
}
