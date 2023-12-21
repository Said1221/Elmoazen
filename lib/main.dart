import 'package:conditional_builder/conditional_builder.dart';
import 'package:elmoazen/component.dart';
import 'package:elmoazen/cubit.dart';
import 'package:elmoazen/dio_helper.dart';
import 'package:elmoazen/homeLayout.dart';
import 'package:elmoazen/notification.dart';
import 'package:elmoazen/shared_pref.dart';
import 'package:elmoazen/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();
  await dioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext)=>AppCubit(),
      child: BlocConsumer<AppCubit , AppState>(
        listener: (BuildContext context , AppState state){},
          builder: (BuildContext context , AppState state){
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: ConditionalBuilder(
                condition: 1+1==2,
                builder: (BuildContext)=>homeLayout(),
              fallback: (BuildContext)=>Center(child: CircularProgressIndicator()),
            ),
            debugShowCheckedModeBanner: false,
          );
          },
      ),
    );
  }
}

