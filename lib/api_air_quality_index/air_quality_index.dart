import 'dart:convert';
import 'package:demoproject/model/aqi_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AirQualityIndex extends StatefulWidget {
  const AirQualityIndex({super.key});

  @override
  State<AirQualityIndex> createState() => _AirQualityIndexState();
}

class _AirQualityIndexState extends State<AirQualityIndex> {
  AqiData? aqiData;
  bool isLoading = true;

  Map<String, dynamic> getAqiLevel(int aqi) {
    if (aqi <= 50) {
      return {"level": "Good", "color": Colors.green};
    } else if (aqi <= 100) {
      return {"level": "Moderate", "color": Colors.yellow};
    } else if (aqi <= 150) {
      return {
        "level": "Unhealthy for Sensitive Groups",
        "color": Colors.orange
      };
    } else if (aqi <= 200) {
      return {"level": "Unhealthy", "color": Colors.red};
    } else if (aqi <= 300) {
      return {"level": "Very Unhealthy", "color": Colors.purple};
    } else {
      return {"level": "Hazardous", "color": Colors.brown};
    }
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });
    try {
      await Future.delayed(Duration(seconds: 1));
      var response = await http.get(Uri.parse(
          'https://api.waqi.info/feed/here/?token=2d75e9755158ebc986fa0ff929fb122995e118be'));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        setState(() {
          aqiData = AqiData.fromJson(jsonData);
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        print("Invalid Data");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Air Quality Index (AQI)',
            style: TextStyle(color: Colors.black)
            ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Icon(Icons.air, color: Colors.green), 
        elevation: 5,
      ),
      backgroundColor: Colors.grey[100], 
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : aqiData != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${aqiData!.city}",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold)),
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: getAqiLevel(aqiData!.aqi)["color"],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "${aqiData!.aqi}",
                          style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        getAqiLevel(aqiData!.aqi)["level"],
                        style: TextStyle(
                          color: getAqiLevel(aqiData!.aqi)["color"],
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.thermostat,
                            size: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Temperature: ${aqiData!.temperature}°C",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: fetchData,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          elevation: 5,
                        ),
                        child: Text("Refresh"),
                      ),
                    ],
                  )
                : Text("Failed to load AQI data"),
      ),
    );
  }
}
