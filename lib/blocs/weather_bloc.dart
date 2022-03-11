import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:zazzy_app/blocs/weather_event.dart';
import 'package:zazzy_app/blocs/weather_state.dart';
import 'package:zazzy_app/services/api_service.dart';
import 'package:zazzy_app/services/connectivity_service.dart';
import 'package:zazzy_app/services/location_service.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherService weatherService;
  final ConnectivityService connectivityService;
  final LocationService locationService;

  WeatherBloc(
    this.weatherService,
    this.connectivityService,
    this.locationService,
  ) : super(LogoutState()) {
    connectivityService.connectivityStream.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        print('No Internet');
        add(NoInternetEvent());
      }
      // else {
      //   add(LoadApiEvent());
      // }
    });

    on<LoginEvent>(
      (event, emit) =>
          emit(LoginState(username: event.username, password: event.password)),
    );

    on<LogoutEvent>(
      (event, emit) => emit(LogoutState()),
    );

    on<LoginSuccessEvent>(
      ((event, emit) {
        add(LoadApiEvent());
      }),
    );

    on<LoadApiEvent>(
      (event, emit) async {
        emit(WeatherLoadingState());
        Position position = await locationService.getPosition();
        final weatherList = await weatherService.getTemperature(position);
        emit(WeatherLoadedState(weatherList: weatherList));
      },
    );

    on<NoInternetEvent>(((event, emit) {
      emit(WeatherNoInternetState());
    }));
  }
}
