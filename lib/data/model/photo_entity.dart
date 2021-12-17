class PhotoEntity {
  final String imageUrl;
  final String title;
  final String id;

  const PhotoEntity({
    required this.imageUrl,
    required this.title,
    required this.id,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PhotoEntity &&
          runtimeType == other.runtimeType &&
          imageUrl == other.imageUrl &&
          title == other.title &&
          id == other.id);

  @override
  int get hashCode => imageUrl.hashCode ^ title.hashCode;

  @override
  String toString() {
    return 'Photo{imageUrl: $imageUrl,title: $title, id: $id}';
  }

  PhotoEntity copyWith({
    String? imageUrl,
    String? title,
    String? id,
  }) {
    return PhotoEntity(
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'src': imageUrl,
      'title': title,
      'id': id,
    };
  }

  factory PhotoEntity.fromMap(Map<String, dynamic> map) {
    return PhotoEntity(
      imageUrl: map['src'] as String,
      title: map['title'] as String,
      id: map['id'] as String,
    );
  }
}
