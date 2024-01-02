
import 'package:elmoazen/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:smooth_compass/utils/src/compass_ui.dart';

class qibla extends StatefulWidget {

  @override
  State<qibla> createState() => _qiblaState();
}

class _qiblaState extends State<qibla> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('qibla'),
      ),
      body: Center(
        child: SmoothCompass(
          compassBuilder: (context , snapshot , child){
            return AnimatedRotation(
              turns: snapshot?.data?.turns??0/360,
              duration: Duration(milliseconds: 400),
              child: SizedBox(
                height: 200,
                width: 200,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Image.asset('assets/qibla-compass.png' ,fit: BoxFit.fill,),
                    ),

                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: AnimatedRotation(
                          turns: snapshot?.data?.qiblahOffset??0/360,
                          duration: Duration(milliseconds: 400),
                          child: Image.asset('assets/pointer.png',fit: BoxFit.fill,)),
                    ),


                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
