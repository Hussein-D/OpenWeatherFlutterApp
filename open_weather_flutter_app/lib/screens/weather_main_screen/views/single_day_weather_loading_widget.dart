import 'package:flutter/material.dart';
import 'package:open_weather_flutter_app/common_views/shimmer_widget.dart';

class SingleDayWeatherLoadingCard extends StatelessWidget {
  const SingleDayWeatherLoadingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 80,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.blueGrey[200]),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShimmerWidget(
            height: 30,
            width: 30,
            isRounded: true,
          ),
          SizedBox(
            height: 10,
          ),
          ShimmerWidget(
            height: 5,
            width: 30,
          ),
          SizedBox(
            height: 10,
          ),
          ShimmerWidget(
            height: 15,
            width: 30,
          ),
        ],
      ),
    );
  }
}
