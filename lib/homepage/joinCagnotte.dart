import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../kariti_color.dart';

enum state { selectBudget, selectTime, finish }

class joinCagnotte extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _joinCagnotteState();
}

double percent = 0.1;

class _joinCagnotteState extends State<joinCagnotte> {
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
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                "Entrez l'ID de la cagnotte ",
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
                  style:
                      TextStyle(fontSize: 40, color: KaritiColor().darkGrean),
                ),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                },
                child: Text(
                  "Rejoindre",
                  style:
                      TextStyle(fontSize: 30, color: KaritiColor().darkGrean),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
