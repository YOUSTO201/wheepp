import 'package:flutter/material.dart';

void ssb(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.down,
      backgroundColor: Colors.red,
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.5,
          fontWeight: FontWeight.bold,
          fontFamily: 'Rubik',
        ),
      ),
    ),
  );
}

void ssj(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.down,
      backgroundColor: Colors.green,
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.5,
          fontWeight: FontWeight.bold,
          fontFamily: 'Rubik',
        ),
      ),
    ),
  );
}