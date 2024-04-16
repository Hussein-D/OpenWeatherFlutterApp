part of 'weather_bloc.dart';

@immutable
class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherError extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final CountryWeatherDetails? countryWeatherDetails;
  WeatherLoaded({required this.countryWeatherDetails});
}
