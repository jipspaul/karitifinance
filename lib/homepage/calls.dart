import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/calls_model.dart';

class Calls extends StatelessWidget {
  Calls(this.listType);
  final String listType;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.grey[200],
        body: new ListView.builder(
            itemCount: callMockData.length,
            itemBuilder: (context, position) => new Padding(
                padding: const EdgeInsets.all(0.0),
                child: new Card(
                  elevation: 1.0,
                  color: Colors.white,
                  child: new Column(
                    children: <Widget>[
                      new ListTile(
                        leading: new CircleAvatar(
                          backgroundImage: new CachedNetworkImageProvider(
                              callMockData[position].profileImageUrl),
                          backgroundColor: Colors.grey,
                        ),
                        title: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Text(
                              callMockData[position].name,
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),

                          ],
                        ),
                        subtitle: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Column(
                              children: <Widget>[
                                new Row(
                                 
                                  children: <Widget>[
                                    //day of call
                                    new Text(
                                      callMockData[position].day,
                                      style: new TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey),
                                    ),
                                    new Text(' | ', style: new TextStyle(fontWeight: FontWeight.bold,
                                          color: Colors.grey),),
                                    
                                    //time of call
                                    new Text(
                                      callMockData[position].time,
                                      style: new TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Column(children: <Widget>[ new Text(
                          callMockData[position].callType,
                          style: new TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.black),
                        ),],),
                      ),
                    ],
                  ),
                ))));
  }
}
