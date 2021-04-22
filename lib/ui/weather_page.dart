import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_basic_withweatherapp/blocs/weather_bloc.dart';
import 'package:learn_basic_withweatherapp/events/weather_event.dart';
import 'package:learn_basic_withweatherapp/models/weather.dart';
import 'package:learn_basic_withweatherapp/ui/location_search_page.dart';

class WeatherPage extends StatelessWidget{
  final Weather weather;
  WeatherPage({@required this.weather}) : assert(weather != null);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/home_screen.jpg'),
                  fit: BoxFit.cover
              )
          ),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'UPDATE AT ${TimeOfDay.fromDateTime
                    (weather.lastUpdated).format(context)}' ,
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${weather.location.toUpperCase()}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30
                        ),
                      ),
                      Text(
                        '${weather.weatherStatus}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        '${weather.temp.round()}' + '°C',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 80
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text(
                            'Min: ' + '${weather.minTemp.round()}' + '°C',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                          ),
                          Text(
                            'Max: ' + '${weather.maxTemp.round()}' + '°C',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white38,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Container(
                                child: Column(
                                  children: [
                                    Image(
                                      image: AssetImage('assets/images/sunrise.png'),
                                      color: Colors.white,
                                      height: 70,
                                      width: 70,
                                    ),
                                    Text(
                                      'Sunrise',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12
                                      ),
                                    ),
                                    Text(
                                      '${TimeOfDay.fromDateTime
                                      (DateTime.parse(weather.sunrise)).
                                      format(context)}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white38,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Container(
                                child: Column(
                                  children: [
                                    Image(
                                      image: AssetImage('assets/images/sunset.png'),
                                      color: Colors.white,
                                      height: 70,
                                      width: 70,
                                    ),
                                    Text(
                                      'Sunset',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12
                                      ),
                                    ),
                                    Text(
                                      '${TimeOfDay.fromDateTime
                                      (DateTime.parse(weather.sunset)).
                                      format(context)}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white38,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Container(
                                child: Column(
                                  children: [
                                    Image(
                                      image: AssetImage('assets/images/wind.png'),
                                      color: Colors.white,
                                      height: 70,
                                      width: 70,
                                    ),
                                    Text(
                                      'Wind',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12
                                      ),
                                    ),
                                    Text(
                                      '${weather.windSpeed.round()}' + ' Km/h',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white38,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Container(
                                child: Column(
                                  children: [
                                    Image(
                                      image: AssetImage('assets/images/pressure.png'),
                                      color: Colors.white,
                                      height: 70,
                                      width: 70,
                                    ),
                                    Text(
                                      'Pressure',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12
                                      ),
                                    ),
                                    Text(
                                      '${weather.pressure.round()}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white38,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Container(
                                child: Column(
                                  children: [
                                    Image(
                                      image: AssetImage('assets/images/sunrise.png'),
                                      color: Colors.white,
                                      height: 70,
                                      width: 70,
                                    ),
                                    Text(
                                      'Humidity',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12
                                      ),
                                    ),
                                    Text(
                                      '${weather.humidity}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white38,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Container(
                                child: Column(
                                  children: [
                                    Image(
                                      image: AssetImage('assets/images/eyes.png'),
                                      color: Colors.white,
                                      height: 70,
                                      width: 70,
                                    ),
                                    Text(
                                      'Visibility',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12
                                      ),
                                    ),
                                    Text(
                                      '${weather.visibility.round()}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        backgroundColor: Colors.white38,
        onPressed:() {
          BlocProvider.of<WeatherBloc>(context).add(WeatherEventReset());
        },

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
  
}