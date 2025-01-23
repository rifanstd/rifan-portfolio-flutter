class ServiceModel {
  final String id;
  final String title;
  final String description;
  final String iconPath;
  final List<String> details;

  const ServiceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.iconPath,
    required this.details,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'].toString(),
      title: json['title'].toString(),
      description: json['description'].toString(),
      iconPath: json['icon_path'].toString(),
      details: List<String>.from(json['details']),
    );
  }
}
