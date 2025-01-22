import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:portfolio/app/core/values/app_json.dart';
import 'package:portfolio/app/data/models/service_model.dart';

class ServiceRepository {
  Future<List<ServiceModel>> getLocalServices() async {
    final List<ServiceModel> services = [];

    final response = await rootBundle.loadString(AppJson.serviceData);
    final data = jsonDecode(response)['data'];

    for (var item in data) {
      services.add(ServiceModel.fromJson(item));
    }

    return services;
  }
}
