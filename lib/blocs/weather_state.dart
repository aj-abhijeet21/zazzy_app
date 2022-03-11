import 'package:equatable/equatable.dart';
import 'package:zazzy_app/models/weather.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class LoginState extends WeatherState {
  String username;
  String password;
  LoginState({
    required this.password,
    required this.username,
  });
  @override
  List<Object> get props => [username, password];
}

class LogoutState extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoadingState extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoadedState extends WeatherState {
  final List<WeatherModel> weatherList;

  const WeatherLoadedState({
    required this.weatherList,
  });

  @override
  List<Object?> get props => [weatherList];
}

class WeatherNoInternetState extends WeatherState {
  @override
  List<Object?> get props => [];
}
