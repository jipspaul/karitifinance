import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kariti_finance/kariti_color.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  _body(BuildContext context) =>
      ListView(physics: BouncingScrollPhysics(), children: <Widget>[
        Container(
            padding: EdgeInsets.all(15),
            child: Column(children: <Widget>[_headerSignUp(), _formUI()]))
      ]);

  _headerSignUp() => Column(children: <Widget>[
        Container(
            height: 80, child: Icon(Icons.supervised_user_circle, size: 90,color: KaritiColor().yellow,)),
        SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Kemodjan Koita',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.verified,color: KaritiColor().darkGrean,),
            )
          ],
        ),
      ]);

  _formUI() {
    return new Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 40.0),
          _email(),
          SizedBox(height: 12.0),
          _mobile(),
          SizedBox(height: 12.0),
          _birthDate(),
          SizedBox(height: 12.0),
          _gender(),
          SizedBox(height: 12.0),
        ],
      ),
    );
  }

  _email() {
    return Row(children: <Widget>[
      _prefixIcon(Icons.email),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Email',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.0,
                  color: Colors.grey)),
          SizedBox(height: 1),
          Text('-')
        ],
      )
    ]);
  }

  _mobile() {
    return Row(children: <Widget>[
      _prefixIcon(Icons.phone),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Tel',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.0,
                  color: Colors.grey)),
          SizedBox(height: 1),
          Text('+33 650003783')
        ],
      )
    ]);
  }

  _birthDate() {
    return Row(children: <Widget>[
      _prefixIcon(Icons.date_range),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Birth date',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.0,
                  color: Colors.grey)),
          SizedBox(height: 1),
          Text('00-00-0000')
        ],
      )
    ]);
  }

  _gender() {
    return Row(children: <Widget>[
      _prefixIcon(Icons.person),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Gender',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.0,
                  color: Colors.grey)),
          SizedBox(height: 1),
          Text('Male')
        ],
      )
    ]);
  }

  _prefixIcon(IconData iconData) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 48.0, minHeight: 48.0),
      child: Container(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
          margin: const EdgeInsets.only(right: 8.0),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(10.0))),
          child: Icon(
            iconData,
            size: 20,
            color: Colors.grey,
          )),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
