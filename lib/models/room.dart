class Room {
  final String roomId;
  final String roomType;
  final int price;

  Room({
    required this.roomId,
    required this.roomType,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'roomId': roomId,
      'roomType': roomType,
      'price': price,
    };
  }

  factory Room.fromMap(Map<String, dynamic> map) {
    return Room(
      roomId: map['roomId'],
      roomType: map['roomType'],
      price: map['price'],
    );
  }
}
