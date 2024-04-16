import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather_flutter_app/common_views/weather_main_image_widget.dart';
import 'package:open_weather_flutter_app/enums/weather_conditions_enums.dart';
import 'package:open_weather_flutter_app/responses/country_weather_details_model.dart';
import 'package:open_weather_flutter_app/screens/weather_main_screen/bloc/weather_bloc.dart';
import 'package:open_weather_flutter_app/screens/weather_main_screen/views/single_day_weather_loaded_widget.dart';

class WeatherLoadedWidget extends StatelessWidget {
  const WeatherLoadedWidget({
    super.key,
    this.countryWeatherDetails,
  });
  final CountryWeatherDetails? countryWeatherDetails;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    DateTime sunrise = DateTime.fromMillisecondsSinceEpoch(
        (countryWeatherDetails?.city?.sunrise ?? 0) * 1000);
    DateTime sunset = DateTime.fromMillisecondsSinceEpoch(
        (countryWeatherDetails?.city?.sunset ?? 0) * 1000);
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        context.read<WeatherBloc>().add(LoadWeatherDetails(
            cityName: context.read<WeatherBloc>().countryDetails?.name ?? ""));
      },
      color: Colors.blue,
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.height
              : MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                height: 50,
                child: Center(
                  child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      controller: controller,
                      style: Theme.of(context).textTheme.bodyLarge,
                      onEditingComplete: () {
                        context
                            .read<WeatherBloc>()
                            .add(LoadWeatherDetails(cityName: controller.text));
                      },
                      decoration: InputDecoration(
                          hintText: "Search for a country",
                          hintStyle: Theme.of(context).textTheme.bodyMedium,
                          prefixIcon: const Icon(Icons.search),
                          prefixIconColor: Colors.grey,
                          suffixIcon: GestureDetector(
                              onTap: () {
                                controller.clear();
                              },
                              child: const Icon(Icons.cancel_outlined)),
                          suffixIconColor: Colors.grey,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                countryWeatherDetails?.city?.name ?? "",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WeatherMainImageWidget(
                    weatherCondition: WeatherCondition.fromStringtoEnum(
                        countryWeatherDetails
                                ?.list?.first.weather?.first.description ??
                            ""),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                ("${countryWeatherDetails?.list?.first.main?.temp ?? ""} °C")
                    .toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                (countryWeatherDetails
                            ?.list?.first.weather?.first.description ??
                        "")
                    .toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.wrap_text_outlined),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        (countryWeatherDetails?.list?.first.wind?.speed ?? 0)
                            .toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.water_drop_outlined),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        ("${countryWeatherDetails?.list?.first.main?.humidity ?? 0} %")
                            .toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.sunny),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        (countryWeatherDetails?.list?.first.wind?.speed ?? 0)
                            .toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.wb_sunny),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("${sunrise.hour}:${sunrise.minute}")
                    ],
                  ),
                  Row(
                    children: [
                      Text("${sunset.hour}:${sunset.minute}"),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.brightness_3),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(),
              ),
              SizedBox(
                height: 120,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SingleDayWeatherLoadedCard(
                        data: index == 0
                            ? countryWeatherDetails?.list?.firstWhere((element) =>
                                DateTime.parse(element.dtTxt ?? "")
                                    .difference(DateTime.now())
                                    .inDays ==
                                1)
                            : index == 1
                                ? countryWeatherDetails?.list?.firstWhere(
                                    (element) =>
                                        DateTime.parse(element.dtTxt ?? "")
                                            .difference(DateTime.now())
                                            .inDays ==
                                        2)
                                : index == 2
                                    ? countryWeatherDetails?.list?.firstWhere(
                                        (element) =>
                                            DateTime.parse(element.dtTxt ?? "")
                                                .difference(DateTime.now())
                                                .inDays ==
                                            3)
                                    : index == 3
                                        ? countryWeatherDetails?.list
                                            ?.firstWhere((element) =>
                                                DateTime.parse(element.dtTxt ?? "")
                                                    .difference(DateTime.now())
                                                    .inDays ==
                                                4)
                                        : null,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: 4),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
