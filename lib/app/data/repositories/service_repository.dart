import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:portfolio/app/core/values/app_json.dart';
import 'package:portfolio/app/data/models/journey_model.dart';
import 'package:portfolio/app/data/models/service_model.dart';
import 'package:portfolio/app/data/models/skill_model.dart';

class LocalRepository {
  Future<List<ServiceModel>> getLocalServices() async {
    final List<ServiceModel> services = [];

    final response = await rootBundle.loadString(AppJson.serviceData);
    final data = jsonDecode(response)['data'];

    for (var item in data) {
      services.add(ServiceModel.fromJson(item));
    }

    return services;
  }

  Future<List<JourneyModel>> getLocalJourneys() async {
    final List<JourneyModel> journeys = [];

    final response = await rootBundle.loadString(AppJson.journeyData);
    final data = jsonDecode(response)['data'];

    for (var item in data) {
      journeys.add(JourneyModel.fromJson(item));
    }

    return journeys;
  }

  Future<List<SkillModel>> getLocalSkills() async {
    final List<SkillModel> skills = [];

    final response = await rootBundle.loadString(AppJson.skillData);
    final data = jsonDecode(response)['data'];

    for (var item in data) {
      skills.add(SkillModel.fromJson(item));
    }

    return skills;
  }
}
