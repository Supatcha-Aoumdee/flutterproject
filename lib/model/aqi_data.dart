class AqiData {
  final int aqi;
  final String city;
  final double temperature;

  AqiData(this.aqi, this.city, this.temperature);

  AqiData.fromJson(Map<String, dynamic> json)
      : aqi = json['data']['aqi'],
        city = json['data']['city']['name'],
        temperature = json['data']['iaqi']['t'] != null ? json['data']['iaqi']['t']['v'].toDouble() : 0.0;
        
  Map<String, dynamic> toJson() {
    return {
      'aqi': aqi,
      'city': city,
      'temperature': temperature
    };
  }
}
