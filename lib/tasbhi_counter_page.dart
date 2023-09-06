import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
class TasbhiCounterPage extends StatefulWidget {
  const TasbhiCounterPage({super.key});

  @override
  State<TasbhiCounterPage> createState() => _TasbhiCounterPageState();
}

class _TasbhiCounterPageState extends State<TasbhiCounterPage> {

  int number=0;
  bool lock=false;

  GetStorage box = GetStorage();

  @override
  void initState() {
    box.writeIfNull('tasbhi', 0);
    readData();
    super.initState();
  }

  readData(){
  number= box.read('tasbhi');
  }
  writeData(int value){
    box.write('tasbhi', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        elevation: 0.0,
        title: Center(child: Text('Tasbhi Gonona',style: TextStyle(color: Colors.black),)),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Container(
               height: 200.0,
               width: 200.0,
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage('images/screen.png',),
                 )
               ),
               child: Center(child: Text(number.toString(),style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 25.0,
               ),),),
             ),
            SizedBox(height: 40.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               InkWell(onTap: (){
                 setState(() {
                   lock=!lock;
                 });

               },
               child: Icon(lock? Icons.lock: Icons.lock_open, size: 30.0,),
               ),
                InkWell(
                    onTap: (){
                      if(lock==false){
                        setState(() {
                          number++;
                          writeData(number);
                        });
                      }
                    },
                    child: Image.asset('images/shape.png',height: 80.0,width: 80.0,)),

                InkWell(onTap: (){
                  setState(() {
                    number=0;
                  });
                },
                  child: Icon(Icons.repeat,size: 30.0,),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
