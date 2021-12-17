class Photo {
  final String imageUrl;
  final String title;
  final String id;

  const Photo({
    this.imageUrl = '',
    this.title = '',
    this.id = '',
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Photo &&
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

  Photo copyWith({
    String? imageUrl,
    String? title,
    String? id,
  }) {
    return Photo(
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'title': title,
      'id': id,
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      imageUrl: map['imageUrl'] as String,
      title: map['title'] as String,
      id: map['id'] as String,
    );
  }
}
