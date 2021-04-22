import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class WeatherEvent extends Equatable{
  WeatherEvent();
}
class WeatherEventRequest extends WeatherEvent{
  final String location;
  WeatherEventRequest({@required this.location}): assert(location != null);
  @override
  // TODO: implement props
  List<Object> get props => [location];

}
class WeatherEventReset extends WeatherEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];
}