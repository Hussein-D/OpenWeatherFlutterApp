import 'package:flutter/material.dart';
import 'package:open_weather_flutter_app/common_views/shimmer_widget.dart';
import 'package:open_weather_flutter_app/screens/weather_main_screen/views/single_day_weather_loading_widget.dart';

class WeatherLoadingWidget extends StatelessWidget {
  const WeatherLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            const ShimmerWidget(
              height: 5,
              width: 100,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/loading_animation.gif",
                    height: 200,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const ShimmerWidget(
              height: 15,
              width: 50,
            ),
            const SizedBox(
              height: 10,
            ),
            const ShimmerWidget(
              height: 5,
              width: 150,
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.wrap_text_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    ShimmerWidget(
                      height: 5,
                      width: 50,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.water_drop_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    ShimmerWidget(
                      height: 5,
                      width: 50,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.sunny),
                    SizedBox(
                      width: 10,
                    ),
                    ShimmerWidget(
                      height: 5,
                      width: 50,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Row(
              children: [
                Icon(Icons.watch_later_outlined),
                SizedBox(
                  width: 10,
                ),
                ShimmerWidget(
                  height: 5,
                  width: 50,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(child: Container()),
            SizedBox(
              height: 120,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const SingleDayWeatherLoadingCard();
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
    );
  }
}
