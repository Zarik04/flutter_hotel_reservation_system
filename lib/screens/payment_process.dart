import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/screens/booking_detail.dart';

class PaymentScreen extends StatefulWidget {
  final String roomType;
  final List<String> roomImages;

  PaymentScreen({required this.roomType, required this.roomImages});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.white),
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
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  height: 100.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.roomImages.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 150.0,
                        margin: EdgeInsets.only(right: 8.0),
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
                SizedBox(height: 16.0),
                Text(
                  'Payment Amount',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
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
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _handlePayment(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
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

  void _handlePayment(BuildContext context) {
    double amount = double.tryParse(_amountController.text) ?? 0.0;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Payment Result'),
          content: Text(amount > 0
              ? 'Payment Successful\nAmount: \$${amount.toStringAsFixed(2)}'
              : 'Invalid Amount. Please enter a valid amount.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (amount > 0) {
                  _showBookingDetails(context, amount);
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: Text('Close'),
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
