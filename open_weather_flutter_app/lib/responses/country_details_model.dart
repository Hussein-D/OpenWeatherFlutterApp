class CountryDetailsModel {
  late final String? name;
  late final List<String>? localNames;
  late final double? lat;
  late final double? lon;
  late final String? country;
  late final String? state;
  CountryDetailsModel(
      {this.country,
      this.lat,
      this.localNames,
      this.lon,
      this.name,
      this.state});
  factory CountryDetailsModel.fromJson(Map<String, dynamic> json) {
    return CountryDetailsModel(
        name: json['name'],
        localNames: json['local_names'] != null
            ? (json['local_names'] as Map<String, dynamic>)
                .values
                .map((e) => e.toString())
                .toList()
            : [],
        lat: json['lat'],
        lon: json['lon'],
        country: json['country'],
        state: json['state']);
  }
}
