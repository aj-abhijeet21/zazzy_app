import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  // @override
  // List<Object?> get props => [];
}

class LoadApiEvent extends WeatherEvent {
  @override
  List<Object?> get props => [];
}

class LoginSuccessEvent extends WeatherEvent {
  @override
  List<Object?> get props => [];
}

class LoginEvent extends WeatherEvent {
  String username;
  String password;
  LoginEvent({
    required this.password,
    required this.username,
  });
  @override
  List<Object> get props => [username, password];
}

class LogoutEvent extends WeatherEvent {
  @override
  List<Object?> get props => [];
}

class NoInternetEvent extends WeatherEvent {
  @override
  List<Object?> get props => [];
}
