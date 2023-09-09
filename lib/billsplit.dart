
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'results.dart';



class Billsplit extends StatefulWidget {
  const Billsplit({super.key});

  @override
  State<Billsplit> createState() => _BillsplitState();
}

class _BillsplitState extends State<Billsplit> {
  TextStyle infostyle=GoogleFonts.playfairDisplay(
    fontSize: 20.0,fontWeight: FontWeight.w500,color: Colors.black,
  );
double frnds=0;
double tip=0;
double  tax=0;
String price="";
  buildbutton(String tex){
    return Expanded(

        child: OutlinedButton(
            onPressed: (){
                if(tex=='-')
                  setState(() {

                    price="";
                  });
                else
                  setState(() {
                    price+=tex;
                  });
            },
          child: Text(tex,style: infostyle,
        ),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.all(20.0),
          ),
        ),
    );
  }

  key(String t1,String t2,String t3){
    return  Row(
      children: [
        buildbutton(t1),
        buildbutton(t2),
        buildbutton(t3),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFFD5FFFF),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20.0,right: 20.0),
          child: Column(

             children: [
               Container(
                 alignment: Alignment.centerLeft,
                   margin: EdgeInsets.only(top: 35.0),

                   child: Text('Bill Split',style: GoogleFonts.montserratAlternates(fontWeight: FontWeight.w700,fontSize: 25.0),),),
               SizedBox(height: 20.0,),
               Container(
                 width: MediaQuery.of(context).size.width,
                 height: 100.0,
                 decoration: BoxDecoration(
                   color: Colors.indigoAccent.shade100,
                   borderRadius: BorderRadius.circular(10)
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Padding(
                       padding:  EdgeInsets.all(10.0),
                       child: Column(

                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Text('Your Bill',style: GoogleFonts.playfairDisplay(
                             fontSize: 20.0,fontWeight: FontWeight.w500,
                           ),),
                           Padding(
                             padding:  EdgeInsets.all(8.0),
                             child: Text(price,style: GoogleFonts.playfairDisplay(
                               fontSize: 25.0,fontWeight: FontWeight.w500,
                             ),),
                           ),
                         ],

                       ),
                     ),
                      Padding(
                        padding:  EdgeInsets.all(9.0),
                        child: Row(
                         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text('Friends',style: infostyle,),
                                 Text('Tax',style: infostyle,),
                                 Text('Tip',style: infostyle,),
                               ],

                             ),
                             SizedBox(width: 10.0,),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(frnds.round().toString(),style: infostyle,),
                                 Text(tax.round().toString(),style: infostyle,),
                                 Text("\Rs${tip.round().toString()}",style: infostyle,),
                               ],

                             ),
                           ],
                         ),
                      ),

                          
  ]),

               ),
             Text('How many friend s do you have??',style: infostyle,),
               Slider(
                 min: 0,max: 15,divisions: 15,activeColor: Colors.deepPurpleAccent.shade100,inactiveColor: Colors.black,
                   value: frnds, onChanged: (value){
                   setState(() {
                     frnds=value;
                   });
               }
               ),
               SizedBox(height: 10.0,),
               Row(
                 children: [
                   Container(
                     width: MediaQuery.of(context).size.width/2.3,
                     height: 70,
                     decoration: BoxDecoration(
                       color: Colors.indigoAccent.shade100,
                       borderRadius: BorderRadius.circular(20.0),
                     ),
                     child: Column(
                       children: [
                         Text('TIP',style: infostyle,textAlign: TextAlign.center,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             Container(
                               width: 40,height:40,
                               child: FloatingActionButton(
                                 heroTag: null,
                                 onPressed: () {
                                 setState(() {
                                   tip--;
                                 });
                               },
                                 backgroundColor: Colors.grey.shade300,
                                 child: Icon(Icons.remove,color: Colors.black,),

                               ),
                             ),
                             Text("\Rs${tip.round().toString()}",style: GoogleFonts.playfairDisplay(
                               fontSize: 25.0,fontWeight: FontWeight.w500,color: Colors.black,
                             ),),
                             Container(
                               width: 40,height:40,
                               child: FloatingActionButton(
                                   heroTag: null,
                                 onPressed: () { setState(() {
                                 tip++;
                               }); },
                                 backgroundColor: Colors.grey.shade300,
                                 child: Icon(Icons.add,color: Colors.black,),

                               ),
                             ),
                           ],
                         )
                       ],
                     ),
                   ),
                    SizedBox(width: 30,),
                    Container(
                      width: (MediaQuery.of(context).size.width)/3,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent.shade100,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: TextField(
                          onChanged: (value){
                            setState(() {
                              tax=double.parse(value);
                            });
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            labelText: 'Tax in %',
                            labelStyle: GoogleFonts.playfairDisplay(
                              fontSize: 15.0,fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                 ],
               ),
               SizedBox(height: 25.0,),

               key("1","2","3"),
               key("4","5","6"),
               key("7", "8", "9"),
               key(".", "0", "CLR"),
              SizedBox(height: 10.0,),
               ElevatedButton(onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Results(tax:tax,tip: tip ,frnds: frnds ,bill: price,),),);
               }, child: Center(child: Text("LETS SPLIT!",style: infostyle,)),style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all(Colors.indigoAccent.shade100),
               ),),
             ],
          ),
        ),
      ),

    );
  }
}
