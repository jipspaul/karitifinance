import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../kariti_color.dart';

class ConfirmationJoin extends StatefulWidget {
  String string;

  ConfirmationJoin(this.string) {}

  @override
  State<StatefulWidget> createState() => _ConfirmationJoinState();
}

class _ConfirmationJoinState extends State<ConfirmationJoin> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: widget.string.isEmpty
                    ? Text("Félicitation! ",
                        style: TextStyle(
                            color: KaritiColor().darkGrean, fontSize: 30))
                    : Text(widget.string,
                        style: TextStyle(
                            color: KaritiColor().darkGrean, fontSize: 30)),
              ),
            ),
            Flexible(
              flex: 1,
              child: SizedBox(
                height: 100,
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.check,
                          color: KaritiColor().darkGrean,
                          size: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Retour à la page d'accueil",
                            style: TextStyle(color: KaritiColor().darkGrean),
                          ),
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
