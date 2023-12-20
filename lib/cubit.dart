
import 'package:elmoazen/dio_helper.dart';
import 'package:elmoazen/screens/home.dart';
import 'package:elmoazen/screens/qibla.dart';
import 'package:elmoazen/screens/quran.dart';
import 'package:elmoazen/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit() : super (AppinitialState());

  static AppCubit get(context)=>BlocProvider.of(context);

  int currentIndex = 1;

  bool permission = false;

  List<Widget>screens = [
    qibla(),
    home(),
    quran(),
  ];

  void onTapItem(int index){
    currentIndex = index;
    emit(AppChangeBottomNav());
  }


  Future getPermission()async{
   if(await Permission.location.serviceStatus.isEnabled){
     var status = await Permission.location.status;
     if(status.isGranted){
       permission = true;
     }
     else{
       Permission.location.request().then((value){
         permission = (value == PermissionStatus.granted);
       });
     }
   }
  }



  getCurentLocation() async {
    LocationPermission permission;

    permission = await Geolocator.requestPermission();
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) async {
          print(value);
    });
  }


  // getCurentAddress() async {
  //   await getCurentLocation();
  //   List<Placemark> placemarks =
  //   await placemarkFromCoordinates(curentPos.latitude, curentPos.longitude);
  //   Placemark place = placemarks[0];
  //   if (mounted) {
  //     setState(() {
  //       curentAddress =
  //       "${place.street!}, ${place.subAdministrativeArea!}, ${place.administrativeArea!}, ${place.country!}";
  //     });
  //   }
  // }


  List<dynamic> allSurah = [];
  void getSurah(){
    dioHelper.getSurah(
      url: 'v1/surah',
    ).then((value){
      emit(AppGetSurahSuccessState());
      allSurah = value.data['data'];
      print(value.data);
    }).catchError((error){
      emit(AppGetSurahErrorState());
      print(error.toString());
    });
  }

}