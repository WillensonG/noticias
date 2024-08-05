import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.article),
            title: Text('Noticias'),
            onTap: () {
              Navigator.pushNamed(context, '/news');
            },
          ),
          ListTile(
            leading: Icon(Icons.stars),
            title: Text('Horóscopo'),
            onTap: () {
              Navigator.pushNamed(context, '/horoscope');
            },
          ),
          ListTile(
            leading: Icon(Icons.wb_sunny),
            title: Text('Clima'),
            onTap: () {
              Navigator.pushNamed(context, '/clima');
            },
          ),
        ],
      ),
    );
  }
}
