class JourneyModel {
  final int id;
  final String major;
  final String school;
  final String country;
  final String startYear;
  final String endYear;
  final String type;

  const JourneyModel({
    required this.id,
    required this.major,
    required this.school,
    required this.country,
    required this.startYear,
    required this.endYear,
    required this.type,
  });

  factory JourneyModel.fromJson(Map<String, dynamic> json) {
    return JourneyModel(
      id: json['id'],
      major: json['major'],
      school: json['school'],
      country: json['country'],
      startYear: json['start_year'],
      endYear: json['end_year'],
      type: json['type'],
    );
  }
}
