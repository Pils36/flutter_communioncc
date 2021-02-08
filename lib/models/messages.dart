class Messages {
  int id;
  String imageUrl;
  String subject;
  String description;
  String createdAt;

  Messages(
    this.id,
    this.imageUrl,
    this.subject,
    this.description,
    this.createdAt,
  );

  Messages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
    subject = json['subject'];
    description = json['description'];
    createdAt = json['createdAt'];
  }
}
