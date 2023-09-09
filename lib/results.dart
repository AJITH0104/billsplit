import 'dart:ffi';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  final String bill;
  final double tax;
  final double frnds;
  final double tip;

  Results({required this.bill,required this.tax,required this.frnds,required this.tip});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
String finalamt='';
 void divideamt(){

    double taxa=(double.parse(widget.bill)*widget.tax)/100;
    double res=(double.parse(widget.bill)+widget.tip +taxa)/widget.frnds;
setState(() {
  finalamt=res.toStringAsFixed(2);
});

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    divideamt();
  }
TextStyle infostyle=GoogleFonts.playfairDisplay(
  fontSize: 20.0,fontWeight: FontWeight.w500,color: Colors.black,
);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Color(0xFFD5FFFF),
        body: Container(
          margin: EdgeInsets.only(left: 20.0,right: 20.0),
      child: Column(
mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 35.0),
      child: Text('Your bill is ',style: GoogleFonts.playfairDisplay(
        fontSize: 35.0,fontWeight: FontWeight.w500,color: Colors.black,
      ),),

        ),
            SizedBox(height: 20.0,),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 150.0,
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
                      Text('Equally divided',style: GoogleFonts.playfairDisplay(
                        fontSize: 30.0,fontWeight: FontWeight.w500,
                      ),),
                      Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Text(finalamt,style: GoogleFonts.playfairDisplay(
                          fontSize: 35.0,fontWeight: FontWeight.w500,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Friends',style: infostyle,),
                          Text('Tax',style: infostyle,),
                          Text('Tip',style: infostyle,),
                        ],

                      ),
                      SizedBox(width: 10.0,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.frnds.round().toString(),style: infostyle,),
                          Text(widget.tax.round().toString(),style: infostyle,),
                          Text("\Rs${widget.tip.round().toString()}",style: infostyle,),
                        ],

                      ),
                    ],
                  ),
                ),


              ]),

        ),

        SizedBox(height: 20.0,),

        SizedBox(
          height: 45.0,
          child: ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Center(child: Text("Back to main page",style: infostyle,)),style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.indigoAccent.shade100),


          ),

          ),
        ),
  ],
      )
      )
      ),
    );
  }
}
