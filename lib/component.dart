import 'package:flutter/material.dart';

String message;
int detId;
String title = '';
Map<int , bool>favorite = {};
Map<int , bool>cart = {};
int num = 1;


Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.all(
    10
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

void navigateTo(context , widget) => Navigator.push(
  context,
  MaterialPageRoute(
      builder: (context) => widget
  ),
);

void NavigatAndFinish (context , widget)=> Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget), (Route<dynamic>route) => false);