import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zazzy_app/blocs/weather_bloc.dart';
import 'package:zazzy_app/blocs/weather_event.dart';
import 'package:zazzy_app/blocs/weather_state.dart';
import 'package:zazzy_app/models/weather.dart';
import 'package:zazzy_app/screens/chart.dart';
import 'package:zazzy_app/services/utils.dart';
import 'package:zazzy_app/widgets/gradient_button.dart';
import 'package:zazzy_app/widgets/rooms_card.dart';

class Dashboard extends StatefulWidget {
  List<WeatherModel> list;
  Dashboard({required this.list});
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
// final WeatherBloc _weatherBloc = WeatherBloc(weatherService, connectivityService);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: const [
              CircleAvatar(
                radius: 30,
                foregroundImage: AssetImage('assets/images/avatar.png'),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'Hello John',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu_rounded,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherLoadedState) {
                      return ChartPage(weatherData: state.weatherList);
                    }
                    return const CircularProgressIndicator();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Rooms',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    RoomsCard(
                      roomName: 'Bedroom',
                      icon: Icons.bed,
                      isSwitchedOn: true,
                      description1: 'Consuming 10 kWh which costs \$12',
                      description2: '4 Active Devices',
                    ),
                    RoomsCard(
                      roomName: 'Kitchen',
                      icon: Icons.kitchen,
                      isSwitchedOn: false,
                      description1: 'Not consuming any power',
                    ),
                    RoomsCard(
                      roomName: 'Hallway',
                      icon: Icons.home_work_outlined,
                      isSwitchedOn: true,
                      description1: 'Consuming 10 kWh which costs \$12',
                      description2: '4 Active Devices',
                    ),
                    RoomsCard(
                      roomName: 'Guests',
                      icon: Icons.cottage_outlined,
                      isSwitchedOn: false,
                      description1: 'Not consuming any power',
                    ),
                  ],
                ),
                GradientButton(
                  title: 'Log out',
                  onClick: () async {
                    BlocProvider.of<WeatherBloc>(context).add(LogoutEvent());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
