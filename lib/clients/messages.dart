class Messages {
  int id;
  String imageUrl;
  String subject;
  String description;

  Messages(
    this.id,
    this.imageUrl,
    this.subject,
    this.description,
  );

  Messages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
    subject = json['subject'];
    description = json['description'];
  }
}
