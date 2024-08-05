import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/horoscope_provider.dart';

class HoroscopeScreen extends StatefulWidget {
  @override
  _HoroscopeScreenState createState() => _HoroscopeScreenState();
}

class _HoroscopeScreenState extends State<HoroscopeScreen> {
  final List<String> _signs = [
    'aries',
    'taurus',
    'gemini',
    'cancer',
    'leo',
    'virgo',
    'libra',
    'scorpio',
    'sagittarius',
    'capricorn',
    'aquarius',
    'pisces'
  ];
  String _selectedSign = 'aries';

  @override
  void initState() {
    super.initState();
    // Usar Future.delayed para evitar el error
    Future.delayed(Duration.zero, () {
      _fetchHoroscope();
    });
  }

  void _fetchHoroscope() {
    Provider.of<HoroscopeProvider>(context, listen: false)
        .fetchHoroscope(_selectedSign);
  }

  @override
  Widget build(BuildContext context) {
    final horoscopeProvider = Provider.of<HoroscopeProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          DropdownButton<String>(
            value: _selectedSign,
            items: _signs.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _selectedSign = newValue!;
              });
              _fetchHoroscope();
            },
          ),
          if (horoscopeProvider.horoscope != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                horoscopeProvider.horoscope!.description,
                style: TextStyle(fontSize: 18),
              ),
            ),
          if (horoscopeProvider.horoscope == null)
            Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
