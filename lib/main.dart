import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'providers/weather_provider.dart';
import 'providers/horoscope_provider.dart';
import 'news_provider.dart';
import 'news_list.dart';
import 'screens/horoscope_screen.dart';
//import 'screens/clima_screen.dart';
import 'widgets/drawer_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //ChangeNotifierProvider(create: (_) => WeatherProvider()),
        ChangeNotifierProvider(create: (_) => HoroscopeProvider()),
        ChangeNotifierProvider(create: (_) => NewsProvider()),
      ],
      child: MaterialApp(
        title: 'Multi-section App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        routes: {
          '/news': (context) => NewsListScreen(),
          '/horoscope': (context) => HoroscopeScreen(),
          //'/clima': (context) => ClimaScreen(),
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    NewsListScreen(),
    HoroscopeScreen(),
    //   ClimaScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      drawer: DrawerMenu(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Noticias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: 'Horóscopo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny),
            label: 'Clima',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
