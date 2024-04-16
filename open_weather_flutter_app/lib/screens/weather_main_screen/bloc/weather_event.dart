part of 'weather_bloc.dart';

@immutable
class WeatherEvent {}

class LoadWeatherDetails extends WeatherEvent {
  final String cityName ;
  LoadWeatherDetails({required this.cityName});
}
