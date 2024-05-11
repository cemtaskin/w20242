import 'package:flutter/material.dart';
import 'package:wheater_app/models/wheater_app_response.dart';

import 'package:wheater_app/services/location_service.dart';
import 'package:wheater_app/services/web_service.dart';

class LocationScreeen extends StatefulWidget {
  const LocationScreeen({super.key});

  @override
  State<LocationScreeen> createState() => _LocationScreeenState();
}

class _LocationScreeenState extends State<LocationScreeen> {
  var response = WheaterAppResponse();
  @override
  Widget build(BuildContext context) {
    var tempature = response!.main!.temp!;
    var cityName = response!.name!;
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Text(cityName),
          Text(tempature.toString()),
          OutlinedButton(
            child: Text('Get Location'),
            onPressed: () async {
              var locationService = LocationService();
              await locationService.getCurrentLocation();
              print(locationService.latitude == null
                  ? ''
                  : locationService.latitude!);
              print(locationService.longitude!);

              var result = await WebService().getWheater(locationService);
              response = result;
              setState(() {});
            },
          ),
        ],
      )),
    );
  }
}
