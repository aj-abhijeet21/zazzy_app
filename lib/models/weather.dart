class WeatherModel {
  DateTime date;
  double temperature;
  WeatherModel({
    required this.date,
    required this.temperature,
  });
  factory WeatherModel.fromJson(Map json) {
    return WeatherModel(
      date: DateTime.parse(json['datetime']),
      temperature: json['tempmax'] as double,
    );
  }
}
