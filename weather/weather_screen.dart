import 'package:flutter/material.dart';
import 'weather_model.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();
  final double latitude = 44.34;
  final double longitude = 10.99;

  late Future<Weather> _weatherFuture;

  @override
  void initState() {
    super.initState();
    _weatherFuture = _weatherService.fetchWeather(latitude, longitude);
  }

  String getWeatherGif(String description) {
    if (description.contains('clear') || description.contains('sun')) {
      return 'assets/sun.gif';
    } else if (description.contains('cloud') || description.contains('cold')) {
      return 'assets/cold.gif';
    }
    return 'assets/default.gif'; // Un GIF por defecto para otros casos, si decides agregar uno.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: FutureBuilder<Weather>(
        future: _weatherFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching weather'));
          } else if (snapshot.hasData) {
            final weather = snapshot.data!;
            return Center(
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(getWeatherGif(weather.description)),
                      SizedBox(height: 20),
                      Text(
                        '${weather.temperature} °C',
                        style: TextStyle(fontSize: 48),
                      ),
                      SizedBox(height: 10),
                      Text(
                        weather.description,
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Prob. de precipitaciones: ${weather.precipitation}%',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Humedad: ${weather.humidity}%',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Viento: ${weather.windSpeed} km/h',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
