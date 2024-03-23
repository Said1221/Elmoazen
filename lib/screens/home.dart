
import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:elmoazen/component.dart';
import 'package:elmoazen/component.dart';
import 'package:elmoazen/component.dart';
import 'package:elmoazen/cubit.dart';
import 'package:elmoazen/notification.dart';
import 'package:elmoazen/shared_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:intl/intl.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:timer_count_down/timer_count_down.dart';


class home extends StatefulWidget {


  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  static var myCoordinates = Coordinates(latitude , longitude);

  static final params = CalculationMethod.egyptian.getParameters();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(child: Text("Prayer" , style: TextStyle(fontSize: 30),)),
                  IconButton(onPressed: (){

                  },
                      icon: Icon(Icons.dark_mode_rounded),
                  ),
                  IconButton(onPressed: (){},
                    icon: Icon(Icons.settings_outlined),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text('Next Prayer ' , style: TextStyle(fontSize: 15),),

              TimerCountdown(
                format: CountDownTimerFormat.hoursMinutesSeconds,
                endTime:
                // DateTime.now().add(
                //   Duration(
                //     days: 0,
                //     hours: 0,
                //     minutes: 0,
                //     seconds: 20,
                //   ),
                // ),


                PrayerTimes.today(myCoordinates, params).maghrib,
                onEnd: (){
                  NotificationService().showNotification(title: 'صلاه الفجر' ,
                      body: 'الصلاه خيرا من النوم');
                },
              ),

              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(PrayerTimes.today(Coordinates(latitude,longitude),CalculationMethod.egyptian.getParameters()).nextPrayer().name.toString() == "fajr")
                    prayNameHead[0],

                  if(PrayerTimes.today(Coordinates(latitude,longitude),CalculationMethod.egyptian.getParameters()).nextPrayer().name.toString() == "dhuhr")
                    prayNameHead[1],

                  if(PrayerTimes.today(Coordinates(latitude,longitude),CalculationMethod.egyptian.getParameters()).nextPrayer().name.toString() == "asr")
                    prayNameHead[2],

                  if(PrayerTimes.today(Coordinates(latitude,longitude),CalculationMethod.egyptian.getParameters()).nextPrayer().name.toString() == "maghrib")
                    prayNameHead[3],

                  if(PrayerTimes.today(Coordinates(latitude,longitude),CalculationMethod.egyptian.getParameters()).nextPrayer().name.toString() == "isha")
                    prayNameHead[4],

                  if(PrayerTimes.today(Coordinates(latitude,longitude),CalculationMethod.egyptian.getParameters()).nextPrayer().name.toString() == "none")
                    Row(
                      children: [
                        Text('Fajr' , style: TextStyle(fontSize: 30),),
                        SizedBox(width: 5,),
                        Text(DateFormat().add_jm().format(PrayerTimes.today(myCoordinates , params).fajr),style: TextStyle(fontSize: 30 , color: Colors.grey),),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),


                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(JHijri.now().year.toString()+' '),
                  Text(JHijri.now().monthName.toString()+' '),
                  Text(JHijri.now().day.toString()),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(city),

              SizedBox(
                height: 10,
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(onPressed: (){
                                    NotificationService().showNotification(title: 'صلاه الفجر' ,
                                        body: 'الصلاه خيرا من النوم');
                                    print(TimeOfDay.now().toString());
                                  },
                                      icon: Icon(Icons.alarm)
                                  ),
                                ],
                              ),
                              prayName[0],
                              Text('ركعتا الفجر خير من الدنيا و ما فيها',style: TextStyle(color: Colors.grey, fontSize: 15),),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(onPressed: (){},
                                      icon: Icon(Icons.alarm)
                                  ),
                                ],
                              ),
                              prayName[1],
                              Text('ركعتا الفجر خير من الدنيا و ما فيها',style: TextStyle(color: Colors.grey, fontSize: 15),),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(onPressed: (){},
                                      icon: Icon(Icons.alarm)
                                  ),
                                ],
                              ),
                              prayName[2],
                              Text('ركعتا الفجر خير من الدنيا و ما فيها',style: TextStyle(color: Colors.grey, fontSize: 15),),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(onPressed: (){},
                                      icon: Icon(Icons.alarm)
                                  ),
                                ],
                              ),
                              prayName[3],
                              Text('ركعتا الفجر خير من الدنيا و ما فيها',style: TextStyle(color: Colors.grey, fontSize: 15),),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(onPressed: (){},
                                      icon: Icon(Icons.alarm)
                                  ),
                                ],
                              ),
                              prayName[4],
                              Text('ركعتا الفجر خير من الدنيا و ما فيها',style: TextStyle(color: Colors.grey, fontSize: 15),),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget>prayName = [
    Row(
    children: [
      Text('Fajr' , style: TextStyle(fontSize: 20),),
      SizedBox(width: 5,),
      Text(DateFormat().add_jm().format(PrayerTimes.today(myCoordinates , params).fajr),style: TextStyle(fontSize: 20),),
      SizedBox(
        height: 5,
      ),
    ],
  ),
    Row(
    children: [
      Text('Dhuhr' , style: TextStyle(fontSize: 20),),
      SizedBox(width: 5,),
      Text(DateFormat().add_jm().format(PrayerTimes.today(myCoordinates , params).dhuhr),style: TextStyle(fontSize: 20),),
      SizedBox(
        height: 5,
      ),
    ],
  ),
    Row(
    children: [
      Text('Asr' , style: TextStyle(fontSize: 20),),
      SizedBox(width: 5,),
      Text(DateFormat().add_jm().format(PrayerTimes.today(myCoordinates , params).asr),style: TextStyle(fontSize: 20),),
      SizedBox(
        height: 5,
      ),
    ],
  ),
    Row(
    children: [
      Text('Maghrib' , style: TextStyle(fontSize: 20),),
      SizedBox(width: 5,),
      Text(DateFormat().add_jm().format(PrayerTimes.today(myCoordinates , params).maghrib),style: TextStyle(fontSize: 20),),
      SizedBox(
        height: 5,
      ),
    ],
  ),
    Row(
    children: [
      Text('Isha' , style: TextStyle(fontSize: 20),),
      SizedBox(width: 5,),
      Text(DateFormat().add_jm().format(PrayerTimes.today(myCoordinates , params).isha),style: TextStyle(fontSize: 20),),
      SizedBox(
        height: 5,
      ),
    ],
  ),
  ];

  List<Widget>prayNameHead = [
    Row(
      children: [
        Text('Fajr' , style: TextStyle(fontSize: 30),),
        SizedBox(width: 5,),
        Text(DateFormat().add_jm().format(PrayerTimes.today(myCoordinates , params).fajr),style: TextStyle(fontSize: 30 , color: Colors.grey),),
        SizedBox(
          height: 5,
        ),
      ],
    ),
    Row(
      children: [
        Text('Dhuhr' , style: TextStyle(fontSize: 30),),
        SizedBox(width: 5,),
        Text(DateFormat().add_jm().format(PrayerTimes.today(myCoordinates , params).dhuhr),style: TextStyle(fontSize: 30 , color: Colors.grey),),
        SizedBox(
          height: 5,
        ),
      ],
    ),
    Row(
      children: [
        Text('Asr' , style: TextStyle(fontSize: 30),),
        SizedBox(width: 5,),
        Text(DateFormat().add_jm().format(PrayerTimes.today(myCoordinates , params).asr),style: TextStyle(fontSize: 30 , color: Colors.grey),),
        SizedBox(
          height: 5,
        ),
      ],
    ),
    Row(
      children: [
        Text('Maghrib' , style: TextStyle(fontSize: 30),),
        SizedBox(width: 5,),
        Text(DateFormat().add_jm().format(PrayerTimes.today(myCoordinates , params).maghrib),style: TextStyle(fontSize: 30 , color: Colors.grey),),
        SizedBox(
          height: 5,
        ),
      ],
    ),
    Row(
      children: [
        Text('Isha' , style: TextStyle(fontSize: 30),),
        SizedBox(width: 5,),
        Text(DateFormat().add_jm().format(PrayerTimes.today(myCoordinates , params).isha),style: TextStyle(fontSize: 30 , color: Colors.grey),),
        SizedBox(
          height: 5,
        ),
      ],
    ),
  ];




}
