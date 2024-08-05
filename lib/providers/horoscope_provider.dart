import 'package:flutter/material.dart';

class Horoscope {
  final String sign;
  final String description;

  Horoscope({required this.sign, required this.description});
}

class HoroscopeProvider with ChangeNotifier {
  Horoscope? _horoscope;

  Horoscope? get horoscope => _horoscope;

  static const Map<String, String> _horoscopeMessages = {
    'aries':
        'Hoy es un buen día para tomar decisiones importantes. Confía en tu intuición.',
    'taurus':
        'Es posible que encuentres un desafío en tu camino, pero tienes la fuerza para superarlo.',
    'gemini':
        'Tu creatividad está en su punto máximo. Aprovecha este tiempo para explorar nuevas ideas.',
    'cancer':
        'Hoy es un buen día para conectarte con tus seres queridos. La familia es importante.',
    'leo':
        'Tendrás la oportunidad de mostrar tu liderazgo. No tengas miedo de tomar la iniciativa.',
    'virgo':
        'El detalle y la precisión serán claves en tus actividades diarias. Mantén el enfoque.',
    'libra':
        'La armonía y el equilibrio serán tus aliados hoy. Busca la paz en tus relaciones.',
    'scorpio':
        'La pasión y la intensidad marcarán tu día. Canaliza estas energías positivamente.',
    'sagittarius':
        'Hoy es un día perfecto para la aventura y la exploración. No te limites.',
    'capricorn':
        'La disciplina y la responsabilidad te llevarán lejos. Sigue trabajando duro.',
    'aquarius':
        'La innovación y el pensamiento fuera de la caja serán recompensados. Sé creativo.',
    'pisces':
        'La empatía y la compasión serán tus mejores virtudes hoy. Ayuda a quienes te rodean.'
  };

  void fetchHoroscope(String sign) {
    final message = _horoscopeMessages[sign];
    if (message != null) {
      _horoscope = Horoscope(sign: sign, description: message);
      notifyListeners();
    } else {
      throw Exception('Sign not found');
    }
  }
}
