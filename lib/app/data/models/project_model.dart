class ProjectModel {
  final int? id;
  final String? name;
  final String? abreviation;
  final String? description;
  final String? role;
  final String? androidUrlDownload;
  final String? iosUrlDownload;
  final String? downloadCount;
  final String? image;

  ProjectModel({
    required this.id,
    required this.name,
    required this.abreviation,
    required this.description,
    required this.role,
    required this.androidUrlDownload,
    required this.iosUrlDownload,
    required this.downloadCount,
    required this.image,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      name: json['name'],
      abreviation: json['abreviation'],
      description: json['description'],
      role: json['role'],
      androidUrlDownload: json['android_url_download'],
      iosUrlDownload: json['ios_url_download'],
      downloadCount: json['download_count'],
      image: json['image'],
    );
  }
}
