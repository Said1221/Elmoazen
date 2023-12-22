
import 'package:conditional_builder/conditional_builder.dart';
import 'package:elmoazen/component.dart';
import 'package:elmoazen/cubit.dart';
import 'package:elmoazen/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ayat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext)=>AppCubit()..getAyat(num),
      child: BlocConsumer<AppCubit , AppState>(
        listener: (BuildContext context , AppState state){},
          builder: (BuildContext context , AppState state){
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            body: ConditionalBuilder(
                condition: state is AppGetAyatSuccessState,
                builder: (BuildContext)=>buildAyat(context),
              fallback: (BuildContext)=>Center(child: CircularProgressIndicator()),
            ),
          );
          },
      ),
    );
  }



  Widget buildAyat(context)=> SafeArea(
    child: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text(desc.toString()),
          ]
        ),
      )
    ),
  );



}
