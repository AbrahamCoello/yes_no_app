enum FromWho { me, other }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  final DateTime createdAt;

  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho,
  }) : createdAt = DateTime.now();
}
