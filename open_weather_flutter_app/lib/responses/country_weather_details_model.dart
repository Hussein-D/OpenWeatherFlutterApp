class CountryWeatherDetails {
  late final String? cod;
  late final int? message;
  late final int? cnt;
  late final List<WeatherData>? list;
  late final City? city;

  CountryWeatherDetails(
      {this.cod, this.message, this.cnt, this.list, this.city});

  factory CountryWeatherDetails.fromJson(Map<String, dynamic> json) {
    return CountryWeatherDetails(
      cod: json['cod'],
      message: json['message'],
      cnt: json['cnt'],
      list: List<WeatherData>.from(
          json['list'].map((x) => WeatherData.fromJson(x))),
      city: City.fromJson(json['city']),
    );
  }
}

class WeatherData {
  late final int? dt;
  late final Main? main;
  late final List<Weather>? weather;
  late final Clouds? clouds;
  late final Wind? wind;
  late final int? visibility;
  late final double? pop;
  late final Rain? rain;
  late final Sys? sys;
  late final String? dtTxt;

  WeatherData({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.rain,
    this.sys,
    this.dtTxt,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      dt: json['dt'],
      main: Main.fromJson(json['main']),
      weather:
          List<Weather>.from(json['weather'].map((x) => Weather.fromJson(x))),
      clouds: Clouds.fromJson(json['clouds']),
      wind: Wind.fromJson(json['wind']),
      visibility: json['visibility'],
      pop: json['pop'].toDouble(),
      rain: json['rain'] != null ? Rain.fromJson(json['rain']) : null,
      sys: Sys.fromJson(json['sys']),
      dtTxt: json['dt_txt'],
    );
  }
}

class City {
  late final int? id;
  late final String? name;
  late final Coord? coord;
  late final String? country;
  late final int? population;
  late final int? timezone;
  late final int? sunrise;
  late final int? sunset;

  City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      coord: Coord.fromJson(json['coord']),
      country: json['country'],
      population: json['population'],
      timezone: json['timezone'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}

class Coord {
  late final double? lat;
  late final double? lon;

  Coord({this.lat, this.lon});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lat: json['lat'],
      lon: json['lon'],
    );
  }
}

class Main {
  late final double? temp;
  late final double? feelsLike;
  late final double? tempMin;
  late final double? tempMax;
  late final int? pressure;
  late final int? seaLevel;
  late final int? grndLevel;
  late final int? humidity;
  late final double? tempKf;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      tempMin: json['temp_min'].toDouble(),
      tempMax: json['temp_max'].toDouble(),
      pressure: json['pressure'],
      seaLevel: json['sea_level'],
      grndLevel: json['grnd_level'],
      humidity: json['humidity'],
      tempKf: json['temp_kf'].toDouble(),
    );
  }
}

class Weather {
  late final int? id;
  late final String? main;
  late final String? description;
  late final String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class Clouds {
  late final int? all;

  Clouds({this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json['all'],
    );
  }
}

class Wind {
  late final double? speed;
  late final int? deg;
  late final double? gust;

  Wind({this.speed, this.deg, this.gust});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'].toDouble(),
      deg: json['deg'],
      gust: json['gust'].toDouble(),
    );
  }
}

class Rain {
  late final double? h3;

  Rain({this.h3});

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(
      h3: json['3h'].toDouble(),
    );
  }
}

class Sys {
  late final String? pod;

  Sys({this.pod});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      pod: json['pod'],
    );
  }
}
