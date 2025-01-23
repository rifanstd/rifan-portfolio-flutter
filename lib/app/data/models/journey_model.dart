class JourneyModel {
  final int id;
  final String title;
  final String institution;
  final String location;
  final String startDate;
  final String endDate;
  final String category;
  final String imageUrl;
  final String description;

  const JourneyModel({
    required this.id,
    required this.title,
    required this.institution,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.category,
    required this.imageUrl,
    required this.description,
  });

  factory JourneyModel.fromJson(Map<String, dynamic> json) {
    return JourneyModel(
      id: json['id'],
      title: json['title'],
      institution: json['institution'],
      location: json['location'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      category: json['category'],
      imageUrl: json['image_url'],
      description: json['description'],
    );
  }
}
