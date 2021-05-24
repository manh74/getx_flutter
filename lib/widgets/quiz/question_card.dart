import 'package:flutter/material.dart';

Widget questionSection(String _question) {
  return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Text(
        _question,
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ));
}
