import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';


int num;
String ayaName;
var latitude;
var longitude;
var city;
List<String>desc = [];


List<dynamic>prayers = [
  PrayerTimes.today(Coordinates(31.0839595 , 29.7438707),CalculationMethod.egyptian.getParameters()).fajr,
  PrayerTimes.today(Coordinates(31.0839595 , 29.7438707),CalculationMethod.egyptian.getParameters()).dhuhr,
  PrayerTimes.today(Coordinates(31.0839595 , 29.7438707),CalculationMethod.egyptian.getParameters()).asr,
  PrayerTimes.today(Coordinates(31.0839595 , 29.7438707),CalculationMethod.egyptian.getParameters()).maghrib,
  PrayerTimes.today(Coordinates(31.0839595 , 29.7438707),CalculationMethod.egyptian.getParameters()).isha,
];



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