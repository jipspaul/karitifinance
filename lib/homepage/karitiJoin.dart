import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../kariti_color.dart';

enum state { selectBudget, selectTime, finish }

class KaritiJoin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _KaritiJoinState();
}

class _KaritiJoinState extends State<KaritiJoin> {
  void initState() {
    super.initState();
  }

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: KaritiColor().blueGreen),
      borderRadius: BorderRadius.circular(15.0),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Le programme Kariti finance vous aide  attrouver les partenaire ideal...blablabal .. suite a un entretiens pour qualifier votre projet blablabal",style: TextStyle(fontSize: 30),),
            OutlinedButton(
              child: Text("Etre Contacter par Telephone",style: TextStyle(fontSize: 20),),
              onPressed: (){
                Navigator.of(context).pop(true);
              },
            ),
            OutlinedButton(
              child: Text("Etre Contacter par la messagerie",style: TextStyle(fontSize: 20),),
              onPressed: (){
                Navigator.of(context).pop(true);
              },
            ),
            OutlinedButton(
              child: Text("Etre Contacter par mail",style: TextStyle(fontSize: 20),),
              onPressed: (){
                Navigator.of(context).pop(true);
              },
            ),
          ],
        ),
      ),
    );
  }
}
