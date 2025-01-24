class SkillModel {
  final int id;
  final String name;
  final String imageUrl;

  const SkillModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) => SkillModel(
        id: json['id'],
        name: json['name'],
        imageUrl: json['image_url'],
      );
}
