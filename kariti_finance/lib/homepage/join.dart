import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../kariti_color.dart';

enum state { selectBudget, selectTime, finish }

class Join extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _JoinState();
}

double percent = 0.1;

class _JoinState extends State<Join> {
  void initState() {
    super.initState();
  }

  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: KaritiColor().blueGreen),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  state _state = state.selectBudget;

  @override
  Widget build(BuildContext context) {
    if (percent == 0)
      Timer.periodic(Duration(seconds: 1), (timer) {
        if (percent < 0.9)
          percent = percent + 0.1;
        else
          percent = 1;
        setState(() {});
      });

    switch (_state) {
      case state.finish:
        {
          return Scaffold(
              body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (percent != 1)
                    ? CircularPercentIndicator(
                        radius: 120.0,
                        lineWidth: 5.0,
                        percent: percent,
                        center: new Text(
                          "${(percent * 100).toInt()}%",
                          style: TextStyle(fontSize: 30),
                        ),
                        progressColor: KaritiColor().darkGrean,
                      )
                    : Column(
                        children: [
                          Icon(
                            Icons.check,
                            color: KaritiColor().lightGrean,
                            size: 200,
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.pop(context, true);
                            },
                            child: Text(
                              "Cliquez ici pour continuer !",
                              style: TextStyle(
                                  fontSize: 30, color: KaritiColor().darkGrean),
                            ),
                          ),
                        ],
                      )
              ],
            ),
          ));
        }
        break;

      case state.selectBudget:
        {
          return Scaffold(
              body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Entrez le budget rechercher",
                      style: TextStyle(
                          fontSize: 30,
                          color: KaritiColor().yellow,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40, color: KaritiColor().darkGrean),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        percent = 0;
                        _state = state.finish;
                      },
                      child: Text(
                        "Suivant",
                        style: TextStyle(
                            fontSize: 30, color: KaritiColor().darkGrean),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ));
        }
        break;

      case state.selectBudget:
        {
          return Container();
        }
        break;

      default:
        {
          return Container();
        }
        break;
    }
  }
}
