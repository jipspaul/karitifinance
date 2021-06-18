import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text("Kariti Finance"),
        leading: new Container(),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  flex: 3,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Le programme Kariti finance vous aide  attrouver les partenaire ideal...blablabal .. suite a un entretiens pour qualifier votre projet blablabal",
                       textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30, color: KaritiColor().darkGrean),
                      ),
                    ),
                  )),
              Expanded(
                flex: 1,
                child: TextFormField(
                  cursorColor: Theme.of(context).cursorColor,
                  maxLength: 20,
                  decoration: InputDecoration(
                    labelText: 'Raison Social',
                    labelStyle: TextStyle(
                      color: KaritiColor().blue,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: KaritiColor().darkGrean),
                    ),
                  ),
                ),
              ),
              Expanded(flex: 1, child: TextFormField(
                cursorColor: Theme.of(context).cursorColor,
                maxLength: 20,
                decoration: InputDecoration(
                  labelText: 'Nom Prenom',
                  labelStyle: TextStyle(
                    color: KaritiColor().blue,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: KaritiColor().darkGrean),
                  ),
                ),
              ),),

              Expanded(flex: 1, child: TextFormField(
                cursorColor: Theme.of(context).cursorColor,
                maxLength: 6,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Somme recherchée',
                  labelStyle: TextStyle(
                    color: KaritiColor().blue,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: KaritiColor().darkGrean),
                  ),
                ),
              )),
              //Montant recherché
              Expanded(flex: 2, child: TextFormField(
                cursorColor: Theme.of(context).cursorColor,
                maxLength: 300,
                decoration: InputDecoration(
                  labelText: 'Description du projet (optionnel)',
                  labelStyle: TextStyle(
                    color: KaritiColor().blue,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: KaritiColor().darkGrean),
                  ),
                ),
              )),
              // optional desccription projet
              Expanded(
                flex: 1,
                child: OutlinedButton(
                  child: Text(
                    "Etre Contacté par Telephone",
                    style:
                        TextStyle(fontSize: 20, color: KaritiColor().darkGrean),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: OutlinedButton(
                  child: Text(
                    "Etre Contacté par la messagerie",
                    style:
                        TextStyle(fontSize: 20, color: KaritiColor().darkGrean),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: OutlinedButton(
                  child: Text(
                    "Etre Contacté par mail",
                    style:
                        TextStyle(fontSize: 20, color: KaritiColor().darkGrean),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
