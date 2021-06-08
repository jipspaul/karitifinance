import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

import '../kariti_color.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                  child: Image.asset("assets/logo.png",
                height: 150,
              )),
            ),
            Text(
              "Bienvenue Kemodjan",
              style: Theme.of(context).textTheme.headline5,
            ),
            Container(
              color: Colors.transparent,
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(20.0),
              child: PinPut(
                fieldsCount: 5,
                onSubmit: (String pin) => _showSnackBar(pin, context),
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                submittedFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                selectedFieldDecoration: _pinPutDecoration,
                followingFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: KaritiColor().blue,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}

void _showSnackBar(String pin, BuildContext context) {
  final snackBar = SnackBar(
    duration: const Duration(seconds: 3),
    content: Container(
      height: 80.0,
      child: Center(
        child: Text(
          'Pin Submitted. Value: $pin',
          style: const TextStyle(fontSize: 25.0),
        ),
      ),
    ),
    backgroundColor: Colors.transparent,
  );
  Scaffold.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}