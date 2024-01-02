

import 'package:al_quran/al_quran.dart';
import 'package:elmoazen/dio_helper.dart';
import 'package:elmoazen/screens/ayat.dart';
import 'package:elmoazen/screens/home.dart';
import 'package:elmoazen/screens/qibla.dart';
import 'package:elmoazen/screens/qurann.dart';
import 'package:elmoazen/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import 'component.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit() : super (AppinitialState());

  static AppCubit get(context)=>BlocProvider.of(context);

  int currentIndex = 1;

  bool permission = false;

  List<Widget>screens = [
    qibla(),
    home(),
    qurann(),
  ];

  void onTapItem(int index){
    currentIndex = index;
    emit(AppChangeBottomNav());
  }


  Future<Position>getCurrentAddress()async{
    bool serviceEnable = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnable){
      return Future.error('location error');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error('location permission are dened');
      }
    }

    if(permission == LocationPermission.deniedForever){
      return Future.error('location permission forever');
    }


    return await Geolocator.getCurrentPosition().then((value)async{
      latitude = value.latitude;
      longitude = value.longitude;

      List<Placemark> placemarks = await placemarkFromCoordinates(latitude , longitude);
      city = placemarks[0].administrativeArea;

      emit(AppGetLocationSuccessState());
    });

  }





  // void liveLocation(){
  //   LocationSettings locationSettings = const LocationSettings(
  //     accuracy: LocationAccuracy.high,
  //     distanceFilter: 100,
  //   );
  //   Geolocator.getPositionStream(locationSettings: locationSettings).listen((Position position) {
  //     latitude = position.latitude.toString();
  //     longitude = position.longitude.toString();
  //   });
  // }



  List<dynamic> allSurah = [];
  void getSurah(){
    dioHelper.getSurah(
      url: 'v1/surah',
    ).then((value){
      emit(AppGetSurahSuccessState());
      allSurah = value.data['data'];
      // print(value.data);
    }).catchError((error){
      emit(AppGetSurahErrorState());
      print(error.toString());
    });
  }



  void getAyat(){
    dioHelper.getAyat(
      url: 'v1/surah/${num}/ar.alafasy',
    ).then((value){
      ayaName = value.data['data']['name'];
      emit(AppGetAyatSuccessState());
        print(ayaName);
    }).catchError((error){
      emit(AppGetAyatErrorState());
      print(error.toString());
    });
  }

}