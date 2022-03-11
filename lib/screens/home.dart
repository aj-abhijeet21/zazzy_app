import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zazzy_app/blocs/weather_bloc.dart';
import 'package:zazzy_app/blocs/weather_event.dart';
import 'package:zazzy_app/blocs/weather_state.dart';
import 'package:zazzy_app/screens/dashboard.dart';
import 'package:zazzy_app/screens/login.dart';
import 'package:zazzy_app/services/api_service.dart';
import 'package:zazzy_app/services/connectivity_service.dart';
import 'package:zazzy_app/services/location_service.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // lazy: false,
      create: (context) => WeatherBloc(
        RepositoryProvider.of<WeatherService>(context),
        RepositoryProvider.of<ConnectivityService>(context),
        RepositoryProvider.of<LocationService>(context),
      )..add(
          LogoutEvent(),
        ),
      child: Scaffold(
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is LogoutState) {
              return Login();
            }
            if (state is WeatherLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is WeatherLoadedState) {
              return Dashboard(list: state.weatherList);
            }
            if (state is WeatherNoInternetState) {
              return const Center(
                child: Text('No Internet'),
              );
            }
            return const Center(
              child: Text('Weather service'),
            );
          },
        ),
      ),
    );
  }
}
