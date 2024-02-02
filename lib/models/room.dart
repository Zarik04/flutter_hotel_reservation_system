class Room {
  String? hotelId;
  final String roomNo;
  final String roomType;
  final int bedNum;
  final int maxGuests;
  final String description;
  final int price;

  Room({
    this.hotelId,
    required this.roomNo,
    required this.roomType,
    required this.bedNum,
    required this.maxGuests,
    required this.description,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'roomNo': roomNo,
      'roomType': roomType,
      'bedNum': bedNum,
      'maxGuests': maxGuests,
      'description': description,
      'price': price,
    };
  }

  factory Room.fromMap(String hotelId, Map<String, dynamic> map) {
    return Room(
      hotelId: hotelId,
      roomNo: map['roomNo'],
      roomType: map['roomType'],
      bedNum: map['bedNum'],
      maxGuests: map['maxGuests'],
      description: map['description'],
      price: map['price'],
    );
  }
}
