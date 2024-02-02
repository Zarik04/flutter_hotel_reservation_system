class Hotel {
  String? hotelId;
  final String name;
  final String imageUrl;
  final double rating;
  final String location;

  Hotel({
    this.hotelId,
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

  factory Hotel.fromMap(String docId, Map<String, dynamic> map) {
    return Hotel(
      hotelId: docId,
      name: map['name'],
      imageUrl: map['imageUrl'],
      rating: map['rating'],
      location: map['location'],
    );
  }
}
