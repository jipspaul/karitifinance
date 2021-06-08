import 'package:flutter/material.dart';

import 'homepage/home_page.dart';
import 'homepage/home_screen.dart';
import 'kariti_color.dart';

void main() {
  runApp(BooksApp());
}

//mode;
class Book {
  final String title;
  final String author;

  Book(this.title, this.author);
}

class BooksApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  bool show404 = false;
  List<Book> books = [
    Book('Left Hand of Darkness', 'Ursula K. Le Guin'),
    Book('Too Like the Lightning', 'Ada Palmer'),
    Book('Kindred', 'Octavia E. Butler'),
  ];

  void initState() {
    super.initState();
  }

  void _handleBookTapped(Book book) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books App',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: KaritiColor().yellow,
        accentColor: KaritiColor().blueGreen,

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 72.0,
              fontWeight: FontWeight.bold,
              color: KaritiColor().blue),
          headline6: TextStyle(
              fontSize: 36.0,
              fontStyle: FontStyle.italic,
              color: KaritiColor().blue),
          bodyText2: TextStyle(
              fontSize: 14.0, fontFamily: 'Hind', color: KaritiColor().blue),
        ),
      ),
      home: Navigator(
        pages: [
          MaterialPage(
              key: ValueKey('homePage'), child: Scaffold(body: HomePage())),
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
    );
  }
}

Widget unknownScreen() {
  return Container();
}

// ...
class BooksListScreen extends StatelessWidget {
  final List<Book> books;
  final ValueChanged<Book> onTapped;

  BooksListScreen({
    required this.books,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          for (var book in books)
            ListTile(
              title: Text(book.title,
                  style: Theme.of(context).textTheme.headline6),
              subtitle: Text(book.author,
                  style: Theme.of(context).textTheme.bodyText1),
              onTap: () => onTapped(book),
            )
        ],
      ),
    );
  }
}
