import 'package:fl_chart/fl_chart.dart';

/// Flutter code sample for BottomNavigationBar
import 'package:flutter/material.dart';
import 'package:kariti_finance/homepage/home.dart';
import 'package:kariti_finance/homepage/karitiJoin.dart';
import 'package:kariti_finance/homepage/profile.dart';
import 'package:kariti_finance/kariti_color.dart';

import 'calls.dart';
import 'join.dart';

bool isCreate = false;

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MyStatefulWidget();
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      isCreate
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: getCagnote(context),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: TextButton(
                        onPressed: () async {
                          isCreate = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KaritiJoin()));

                          setState(() {});
                        },
                        child: Text(
                          "Etre intégré au programme Kariti Finance",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30, color: KaritiColor().darkGrean),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: KaritiColor().lightGrean)))),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: TextButton(
                        onPressed: () async {
                          isCreate = await Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Join()));

                          setState(() {});
                        },
                        child: Text(
                          "Rejoindre une cagnotte",
                          style: TextStyle(
                              fontSize: 30, color: KaritiColor().darkGrean),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: KaritiColor().lightGrean)))),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: TextButton(
                        onPressed: () async {
                          isCreate = await Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Join()));

                          setState(() {});
                        },
                        child: Text(
                          "Creer une cagnotte",
                          style: TextStyle(
                              fontSize: 30, color: KaritiColor().darkGrean),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: KaritiColor().lightGrean)))),
                      ),
                    ),
                  ),
                ),
              ],
            ),
      isCreate
          ? Center(
              child: Calls("Notifications"),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                "Aucunes notification",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              )),
            ),
      isCreate
          ? Center(
              child: Home("Contacts screen"),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                "Vous n'avez pas reçus  de messages",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              )),
            ),
      ProfilePage(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: Container(),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_outlined),
            label: 'Suivi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none_sharp),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: 'Messagerie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: KaritiColor().blueGreen,
        unselectedItemColor: KaritiColor().blue,
        onTap: _onItemTapped,
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  List<Color> gradientColors = [
    KaritiColor().darkGrean,
    KaritiColor().lightGrean,
  ];
}

getCagnote(BuildContext context) {
  return SingleChildScrollView(
    child: Column(children: [
      item(context,"Cagnotte 1",0.75,"10.000€"),
      item(context,"Cagnotte 2",0.4,"5.000€"),
      item(context,"Cagnotte 3",0.90,"8.000€"),
      item(context,"Cagnotte 4",0.1,"7.000€"),
      item(context,"Cagnotte 5",0,"15.000€"),
    ]),
  );
}

item(BuildContext context, String title, double value, String obj) {
  return SizedBox(
    height: 150,
    child: Card(
      shadowColor: KaritiColor().yellow,
      child: Column(
        children: [
          Flexible(child: Text(title,textAlign: TextAlign.center,style: TextStyle(fontSize: 30),)),
          Flexible(child: Text("Objectif : $obj")),
          Flexible(
            child: Row(
              children: [
                Flexible(
                    flex: 4,
                    child: LinearProgressIndicator(
                      value: value,
                    )),
                Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${value*100}%"),
                    ))
              ],
            ),
          )
        ],
      ),
    ),
  );
}
