
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {


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
                  IconButton(onPressed: (){},
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Next Prayer in ' , style: TextStyle(fontSize: 15),),
                  Text('7:43:49' , style: TextStyle(color: Colors.grey),),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Fajr ', style: TextStyle(fontSize: 30),),
                  Text('5:20 AM', style: TextStyle(fontSize: 30 , color: Colors.grey),),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text('jumada || 5,1445 AH'),
              SizedBox(
                height: 15,
              ),
              Text('Alexandria'),

              SizedBox(
                height: 10,
              ),

              Expanded(
                child: GridView.count(
                  physics: const BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  children:
                    List.generate(5, (index) => ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Card(
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
                              Text('Fajr' , style: TextStyle(fontSize: 20),),
                              SizedBox(height: 5,),
                              Text('5:20 AM',style: TextStyle(fontSize: 20),),
                              SizedBox(
                                height: 5,
                              ),
                              Text('ركعتا الفجر خير من الدنيا و ما فيها',style: TextStyle(color: Colors.grey, fontSize: 15),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
