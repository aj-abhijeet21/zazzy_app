import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zazzy_app/screens/home.dart';
import 'package:zazzy_app/services/api_service.dart';
import 'package:zazzy_app/services/connectivity_service.dart';
import 'package:zazzy_app/services/location_service.dart';
import 'package:zazzy_app/services/utils.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zazzy App',
      scaffoldMessengerKey: Utils.messengerKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => WeatherService(),
          ),
          RepositoryProvider(
            create: (context) => ConnectivityService(),
          ),
          RepositoryProvider(
            create: (context) => LocationService(),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
