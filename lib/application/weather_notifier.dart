import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:riverpod_statenotifier_tutorial/infrastructure/model/weather.dart';
import 'package:riverpod_statenotifier_tutorial/infrastructure/weather_repository.dart';

abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherLoaded extends WeatherState {
  //final Weather weather;
  final List<Object> responseData;
 // const WeatherLoaded(this.weather);

  const WeatherLoaded(this.responseData,);
  // @override
  // bool operator ==(Object o) {
  //   if (identical(this, o)) return true;
  //
  //   return o is WeatherLoaded && o.weather == weather;
  // }
  //
  // @override
  // int get hashCode => weather.hashCode;
}

class WeatherError extends WeatherState {
  final String message;
  const WeatherError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WeatherError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class WeatherNotifier extends StateNotifier<WeatherState> {
  //final WeatherRepository _weatherRepository;
  ///my
  final FakeWeatherRepository dataRepository;
///my
  WeatherNotifier(WeatherRepository watch, {@required this.dataRepository}) :super(WeatherInitial());

  Future<void> getWeather(String cityName) async {
    try {
      state = WeatherLoading();
      print('loadeded $dataRepository');
      List<Object> responseData = await dataRepository.getData();
      state = WeatherLoaded(responseData);
    } on NetworkException {
      state = WeatherError("Couldn't fetch weather. Is the device online?");
    }
  }
}
