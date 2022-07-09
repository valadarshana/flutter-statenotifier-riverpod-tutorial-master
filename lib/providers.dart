import 'package:flutter_riverpod/all.dart';
import 'package:riverpod_statenotifier_tutorial/application/weather_notifier.dart';
import 'package:riverpod_statenotifier_tutorial/infrastructure/model/data_api.dart';
import 'package:riverpod_statenotifier_tutorial/infrastructure/weather_repository.dart';

final weatherRepositoryProvider = Provider<FakeWeatherRepository>(
  (ref) => FakeWeatherRepository(dataApi: DataApi(
    url: "https://jsonplaceholder.typicode.com/photos",
    data: {},
    method: "get",
  )),
);

final weatherNotifierProvider = StateNotifierProvider(
  (ref) => WeatherNotifier(ref.watch(weatherRepositoryProvider)),
);
