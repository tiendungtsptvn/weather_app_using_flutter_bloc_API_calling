import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_basic_withweatherapp/events/weather_event.dart';
import 'package:learn_basic_withweatherapp/models/weather.dart';
import 'package:learn_basic_withweatherapp/repositories/weather_repository.dart';
import 'package:learn_basic_withweatherapp/states/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{
  final WeatherRepository weatherRepository;
  WeatherBloc({@required this.weatherRepository}) :
    assert(weatherRepository != null),
    super(WeatherStateInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent weatherEvent) async*{
    if(weatherEvent is WeatherEventRequest){
      yield WeatherStateLoading();
      try{
        final Weather weather = await weatherRepository.
        getWeather(weatherEvent.location);
        yield WeatherStateSuccess(weather: weather);
      }
      catch(exception){
        yield WeatherStateFailure();
      }
    }
    else if(weatherEvent is WeatherEventReset){
      yield WeatherStateInitial();
    }
  }

}