
import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:elmoazen/component.dart';
import 'package:elmoazen/cubit.dart';
import 'package:elmoazen/screens/qurann.dart';
import 'package:elmoazen/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/quran.dart' as quran;


class ayat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext)=>AppCubit()..getAyat(),
      child: BlocConsumer<AppCubit , AppState>(
        listener: (BuildContext context , AppState state){},
          builder: (BuildContext context , AppState state){
          AppCubit cubit = AppCubit.get(context);
          return SafeArea(
            child: Scaffold(










              body: Padding(
                padding: const EdgeInsets.all(5.0),
                child: state is AppGetAyatSuccessState ?
                    buildAyat(context) :
                  Center(child: CircularProgressIndicator()),
              ),
            ),
          );
          },
      ),
    );
  }


  Widget buildAyat(context)=> Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/ramadan.png" , scale: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 5 , right: 5),
            child: Text(ayaName!,style: TextStyle(color: Colors.black),),
          ),
          Image.asset("assets/ramadan.png" , scale: 20,),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Expanded(
        child: ListView.builder(
            itemBuilder: (context,index){
              return
                ListTile(
                title: Text(
                quran.getVerse(num!, index+1,verseEndSymbol: true),
                textAlign: TextAlign.center,
                  ),
                );

            },
          itemCount: quran.getVerseCount(num!),
        ),
      ),
    ],
  );




}
