import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:la_pic/components/drawer.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  int _totalPrice = 200; // Change this to your actual total price

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.yellow),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Center(
          child: Text(
            'Check Out',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: drawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 13.0),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CountryCodePicker(
                    initialSelection: 'UG',
                    favorite: ['+256', 'UG'],
                    onChanged: (code) {},
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  flex: 2,
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
                      hintText: 'Enter your phone number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Total Amount',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '\$$_totalPrice',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement your payment logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
                child: Text('Pay Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
