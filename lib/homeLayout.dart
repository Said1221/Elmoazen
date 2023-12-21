
import 'package:conditional_builder/conditional_builder.dart';
import 'package:elmoazen/component.dart';
import 'package:elmoazen/cubit.dart';
import 'package:elmoazen/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class homeLayout extends StatefulWidget {

  @override
  State<homeLayout> createState() => _homeLayoutState();
}

class _homeLayoutState extends State<homeLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext)=>AppCubit()..getCurrentAddress().then((value){
      }),
      child: BlocConsumer<AppCubit , AppState>(
        listener: (BuildContext context , AppState state){},
          builder: (BuildContext context , AppState state){
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(

            body: ConditionalBuilder(
                condition: longitude != null,
                builder: (BuildContext)=>cubit.screens[cubit.currentIndex],
              fallback: (BuildContext)=>Center(child: CircularProgressIndicator()),
            ),

            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              selectedFontSize: 15,
              onTap: (index){
                cubit.onTapItem(index);
              },
              items: [
                BottomNavigationBarItem(icon: Image.asset('assets/kaaba.png' , scale: 20,),label: 'Qibla'),
                BottomNavigationBarItem(icon: Image.asset('assets/prayer.png' , scale: 20,),label: 'Prayer'),
                BottomNavigationBarItem(icon: Image.asset('assets/quran.png' , scale: 20,),label: 'Quran'),
              ],
            ),
          );
          },
      ),
    );
  }
}
