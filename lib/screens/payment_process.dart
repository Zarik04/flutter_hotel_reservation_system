import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/models/guest.dart';
import 'package:flutter_hotel_reservation_system/models/reservation.dart';
import 'package:flutter_hotel_reservation_system/models/room.dart';
import 'package:flutter_hotel_reservation_system/screens/booking_detail.dart';
import 'package:flutter_hotel_reservation_system/services/providers/user_provider.dart';
import 'package:flutter_hotel_reservation_system/services/reservation_db.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  final Room room;
  final String roomType;
  final List<String> roomImages;

  const PaymentScreen(
      {super.key,
      required this.room,
      required this.roomType,
      required this.roomImages});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _amountController = TextEditingController();
  static String guestId = '';
  @override
  Widget build(BuildContext context) {
    Guest guest = Provider.of<UserProvider>(context).guest;
    guestId = guest.uid!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Room Type: ${widget.roomType}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  height: 100.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.roomImages.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 150.0,
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.roomImages[index]),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Payment Amount',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter Amount',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _handlePayment(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Proceed to Payment',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handlePayment(BuildContext context) async {
    double amount = double.tryParse(_amountController.text) ?? 0.0;
    if (amount == widget.room.price) {
      Reservation reservation = Reservation(
        hotelId: widget.room.hotelId!,
        roomId: widget.room.roomNo,
        roomType: widget.room.roomType,
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 10)),
      );
      try {
        ReservationDatabase.addReservation(guestId, reservation);
      } catch (e) {
        print(e);
      }

    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Payment Result'),
          content: Text(amount == widget.room.price
              ? 'Payment Successful\nAmount: \$${amount.toStringAsFixed(2)}'
              : 'Invalid Amount. Please enter a valid amount.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (amount == widget.room.price) {
                  _showBookingDetails(context, amount);
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showBookingDetails(BuildContext context, double amountPaid) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookingDetailsScreen(
          roomType: widget.roomType,
          roomImages: widget.roomImages,
          amountPaid: amountPaid,
        ),
      ),
    );
  }
}
