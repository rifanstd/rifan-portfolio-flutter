class ContactModel {
  final List<String> recipients;
  final Map<String, dynamic> emailContent;

  ContactModel({
    required this.recipients,
    required this.emailContent,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      recipients: List<String>.from(json['to']),
      emailContent: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'to': recipients,
      'message': emailContent,
    };
  }
}
