

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_basic_withweatherapp/blocs/weather_bloc.dart';
import 'package:learn_basic_withweatherapp/events/weather_event.dart';
import 'package:learn_basic_withweatherapp/states/weather_state.dart';
import 'package:learn_basic_withweatherapp/ui/weather_page.dart';

class LocationSearchPage extends StatelessWidget{
  final locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/home_screen.jpg'),
                fit: BoxFit.cover
            )
        ),
        child: SafeArea(
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, weatherState){
              if(weatherState is WeatherStateInitial){
                return Center(
                  child: Column(

                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 40, left: 20, right: 20,
                        bottom: 20),
                        child: TextField(
                          controller: locationController,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white60),
                            hintText: 'Your city'.toUpperCase(),
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.white70,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white)

                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        child: FlatButton(
                          height: 50,
                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.
                              all(Radius.circular(10)),
                          ),
                          onPressed: (){
                            BlocProvider.of<WeatherBloc>(context).add(
                                WeatherEventRequest(location: locationController
                                .text));
                          },
                          color: Colors.teal,
                          child: Text("Search", style: TextStyle(
                              color: Colors.white, fontSize: 20),),
                        ),
                      )
                    ],
                  ),
                );
              }
              else if(weatherState is WeatherStateLoading){
                return Center(child : CircularProgressIndicator());
              }
              else if(weatherState is WeatherStateSuccess){
                return WeatherPage(weather: weatherState.weather);
              }
              return Center(
                child: Container(
                  padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Column(
                    children: [
                      Text('Error !',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      FlatButton(
                        height: 50,
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                        onPressed: (){
                          BlocProvider.of<WeatherBloc>(context).add(
                              WeatherEventReset());
                        },
                        color: Colors.teal,
                        child: Text("Retry", style: TextStyle(
                          color: Colors.white,
                          fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

}