import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'model/data_api.dart';
import 'model/weather.dart';

abstract class WeatherRepository {

  Future<List<Object>> fetchWeather(String cityName);
}

class FakeWeatherRepository implements WeatherRepository {
  double cachedTempCelsius;
  ///my
  final DataApi dataApi;

 ///my
  FakeWeatherRepository({@required this.dataApi})
      : assert(dataApi != null);


  // @override
  // Future<Weather> fetchWeather(String cityName) {
  //   // Simulate network delay
  //   return Future.delayed(
  //     Duration(seconds: 1),
  //     () {
  //       final random = Random();
  //
  //       // Simulate some network exception
  //       if (random.nextBool()) {
  //         throw NetworkException();
  //       }
  //
  //       // Since we're inside a fake repository, we need to cache the temperature
  //       // in order to have the same one returned in for the detailed weather
  //       cachedTempCelsius = 20 + random.nextInt(15) + random.nextDouble();
  //
  //       // Return "fetched" weather
  //       return Weather(
  //         cityName: cityName,
  //         // Temperature between 20 and 35.99
  //         temperatureCelsius: cachedTempCelsius,
  //       );
  //     },
  //   );
  // }
  //
  ///my
  Future<List<Object>> getData() async {
    return await dataApi.fetchData();
  }

  @override
  Future<List<Object>> fetchWeather(String cityName) {
    // TODO: implement fetchWeather
    return  dataApi.fetchData();
  }
}

class NetworkException implements Exception {}
