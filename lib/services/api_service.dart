import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:zazzy_app/models/weather.dart';
import 'package:zazzy_app/services/utils.dart';

class WeatherService {
  Future<List<WeatherModel>> getTemperature(Position position) async {
    String uri =
        'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/${position.latitude}%2C%20${position.longitude}/last7days?unitGroup=metric&include=days&key=$apiKey&contentType=json';
    var url = Uri.parse(uri);

    List<WeatherModel> weatherModels = [];

    try {
      var response = await http.get(url);

      var jsonData = jsonDecode(response.body);

      List days = jsonData['days'] as List;

      days.forEach((model) {
        weatherModels.add(
          WeatherModel.fromJson(model),
        );
      });
    } on Exception catch (e) {
      print(e.toString());
    }

    print('Fetched total records ${weatherModels.length}');

    return weatherModels;
    // print(weatherModels.length);
    // print('${weatherModels[1].date}  ${weatherModels[1].temperature}');
  }
}
