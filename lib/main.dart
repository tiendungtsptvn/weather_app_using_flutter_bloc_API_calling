import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_basic_withweatherapp/blocs/weather_bloc.dart';
import 'package:learn_basic_withweatherapp/blocs/weather_bloc_observer.dart';
import 'package:learn_basic_withweatherapp/repositories/weather_repository.dart';
import 'package:learn_basic_withweatherapp/ui/location_search_page.dart';

void main() {
  Bloc.observer = WeatherBlocObserver();
  final WeatherRepository weatherRepository = WeatherRepository();

  runApp(MyApp(weatherRepository: weatherRepository));
}

class MyApp extends StatelessWidget {
  final WeatherRepository weatherRepository;
  MyApp({Key key, @required this.weatherRepository}):
      assert(weatherRepository != null), super(key: key);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: BlocProvider(
          create: (context) => WeatherBloc(
              weatherRepository: weatherRepository),
          child: LocationSearchPage(),
        ),
      ),
    );
  }
}

