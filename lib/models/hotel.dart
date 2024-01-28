class Hotel {
  final String name;
  final String imageUrl;
  final double rating;
  final String location;

  Hotel({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'rating': rating,
      'location': location,
    };
  }

  factory Hotel.fromMap(Map<String, dynamic> map) {
    return Hotel(
      name: map['name'],
      imageUrl: map['imageUrl'],
      rating: map['rating'],
      location: map['location'],
    );
  }
}
