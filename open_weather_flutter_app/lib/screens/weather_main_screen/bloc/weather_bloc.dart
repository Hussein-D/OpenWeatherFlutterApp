import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:open_weather_flutter_app/ApiManager/api_manager.dart';
import 'package:open_weather_flutter_app/responses/country_details_model.dart';
import 'package:open_weather_flutter_app/responses/country_weather_details_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  CountryDetailsModel? countryDetails;
  CountryWeatherDetails? countryWeatherDetails;
  WeatherBloc() : super(WeatherInitial()) {
    final ApiManager apiManager = GetIt.I<ApiManager>();

    on<LoadWeatherDetails>((event, emit) async {
      emit(WeatherLoading());
      countryDetails =
          await apiManager.getLocationCoordinates(cityName: event.cityName);
      if (countryDetails != null) {
        countryWeatherDetails = await apiManager.getWeather(
            lat: countryDetails?.lat ?? 0.0, lon: countryDetails?.lon ?? 0.0);
        if (countryWeatherDetails != null) {
          emit(WeatherLoaded(countryWeatherDetails: countryWeatherDetails));
        }
      }
      if (countryDetails == null && countryWeatherDetails == null) {
        emit(WeatherError());
      }
    });
  }
}
