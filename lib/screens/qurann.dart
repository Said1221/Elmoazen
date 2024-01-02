
import 'package:al_quran/al_quran.dart';
import 'package:elmoazen/component.dart';
import 'package:elmoazen/cubit.dart';
import 'package:elmoazen/screens/ayat.dart';
import 'package:elmoazen/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/quran_text.dart';

class qurann extends StatefulWidget {


  @override
  State<qurann> createState() => _qurannState();
}

class _qurannState extends State<qurann> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext)=>AppCubit()..getSurah(),
      child: BlocConsumer<AppCubit , AppState>(
        listener: (BuildContext context , AppState state){},
          builder: (BuildContext context , AppState state){
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text('ٱلۡقُرۡآنَ ٱلۡكَرِيمَ' , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),),

                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context , index)=> buildList(cubit.allSurah[index]),
                        separatorBuilder: (context , index)=>myDivider(),
                        itemCount: cubit.allSurah.length,
                    ),
                  ),
                 
                
                ],
              ),
            ),
          );
          },
      ),
    );
  }

  Widget buildList(list) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: ()async{
        num = list['number'];
        AppCubit().getAyat();
        print(num.toString());
        navigateTo(context, ayat());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Text(list['numberOfAyahs'].toString())),
          Expanded(
            child: list['revelationType'] == 'Meccan' ? Image(image: AssetImage('assets/kaaba.png'),height: 20,)
                : Image(image: AssetImage('assets/pngegg.png'),height: 20,)
          ),
          SizedBox(
            width: 30,
          ),

          Expanded(
            child: Text(list['englishName']),
          ),

          Expanded(
            child: Text(list['name']),
          ),

          Text(list['number'].toString()),
        ],
      ),
    ),
  );


}
