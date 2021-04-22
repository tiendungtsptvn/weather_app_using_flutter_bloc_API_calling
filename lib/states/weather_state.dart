import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:learn_basic_withweatherapp/models/weather.dart';

abstract class WeatherState extends Equatable{
  const WeatherState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class WeatherStateInitial extends WeatherState{}
class WeatherStateLoading extends WeatherState{}
class WeatherStateSuccess extends WeatherState{
  final Weather weather;
  WeatherStateSuccess({@required this.weather}): assert(weather != null);

  @override
  // TODO: implement props
  List<Object> get props => [weather];
}
class WeatherStateFailure extends WeatherState{}