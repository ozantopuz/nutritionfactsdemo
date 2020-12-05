import 'package:flutter/material.dart';

Widget loadingWidget(BuildContext context) {
  return Center(
      child: CircularProgressIndicator(
          valueColor:
              AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)));
}
