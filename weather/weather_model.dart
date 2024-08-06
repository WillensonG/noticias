import 'dart:convert';
import 'package:http/http.dart' as http;

class Weather {
  final String description;
  final double temperature;
  final double precipitation;
  final double humidity;
  final double windSpeed;

  Weather({
    required this.description,
    required this.temperature,
    required this.precipitation,
    required this.humidity,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      description: json['weather'][0]['description'],
      temperature: json['main']['temp'],
      precipitation: json['clouds']['all'].toDouble(),
      humidity: json['main']['humidity'].toDouble(),
      windSpeed: json['wind']['speed'].toDouble(),
    );
  }
}

class WeatherService {
  final String apiKey = 'e2449f57c38051e5d26c2f4934ead412';

  Future<Weather> fetchWeather(double latitude, double longitude) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final weatherData = json.decode(response.body);
      return Weather.fromJson(weatherData);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
