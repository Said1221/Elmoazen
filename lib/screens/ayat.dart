
import 'package:audioplayers/audioplayers.dart';
import 'package:conditional_builder/conditional_builder.dart';
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
              appBar: AppBar(
                title: ConditionalBuilder(
                    condition: state is AppGetAyatSuccessState,
                    builder: (BuildContext)=>Text(ayaName),
                  fallback: (BuildContext)=>Center(child: CircularProgressIndicator(color: Colors.red,)),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ConditionalBuilder(
                    condition: 1+1==2,
                    builder: (BuildContext)=>buildAyat(context),
                  fallback: (BuildContext)=>Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
          );
          },
      ),
    );
  }


  Widget buildAyat(context)=> ListView.builder(
      itemBuilder: (context,index){
        return ListTile(
          title: Text(
            quran.getVerse(num, index+1,verseEndSymbol: true),
            textAlign: TextAlign.center,
          ),
        );
      },
    itemCount: quran.getVerseCount(num),
  );




}
