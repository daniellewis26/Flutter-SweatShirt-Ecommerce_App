// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/payment_pages/payment_options_page.dart';
import 'package:flutter/material.dart';

class ShipmentPage extends StatefulWidget {
  const ShipmentPage({super.key});

  @override
  State<ShipmentPage> createState() => _ShipmentPageState();
}

class _ShipmentPageState extends State<ShipmentPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();

  String? _selectedCountry;
  String? _selectedCity;
  String? _selectedShippingMethod;

  final Map<String, List<String>> _countryCities = {
    'Jamaica': [
      'Kingston',
      'St. Andrew',
      'Portland',
      'St. Thomas',
      'St. Catherine',
      'St. Mary',
      'St. Ann',
      'Manchester',
      'Clarendon',
      'Hanover',
      'Westmoreland',
      'St. James',
      'Trelawny',
      'St. Elizabeth',
    ],
    'Australia': ['Sydney', 'Melbourne', 'Brisbane'],
    'USA': ['New York', 'Los Angeles', 'Chicago'],
    'Canada': ['Toronto', 'Vancouver', 'Montreal'],
    'UK': ['London', 'Manchester', 'Birmingham'],
    'India': ['Mumbai', 'Delhi', 'Bangalore'],
    'China': ['Beijing', 'Shanghai', 'Guangzhou'],
    'Germany': ['Berlin', 'Munich', 'Hamburg'],
    'France': ['Paris', 'Lyon', 'Marseille'],
    'Japan': ['Tokyo', 'Osaka', 'Kyoto'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shipping',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xfffaf0ca),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Your Email',
                labelStyle: TextStyle(color: Color(0xff0d3b66)),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                labelStyle: TextStyle(color: Color(0xff0d3b66)),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedCountry,
                    decoration: InputDecoration(
                      labelText: 'Country',
                      labelStyle: TextStyle(color: Color(0xff0d3b66)),
                    ),
                    items: _countryCities.keys.map((String country) {
                      return DropdownMenuItem<String>(
                        value: country,
                        child: Text(country),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCountry = newValue;
                        _selectedCity = null;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedCity,
                    decoration: InputDecoration(
                      labelText: 'City',
                      labelStyle: TextStyle(color: Color(0xff0d3b66)),
                    ),
                    items: (_selectedCountry != null
                        ? _countryCities[_selectedCountry]!
                        : <String>[])
                        .map<DropdownMenuItem<String>>((String city) {
                      return DropdownMenuItem<String>(
                        value: city,
                        child: Text(city),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCity = newValue;
                      });
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _zipCodeController,
                    decoration: InputDecoration(
                      labelText: 'Zip Code',
                      labelStyle: TextStyle(color: Color(0xff0d3b66)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedShippingMethod,
              decoration: InputDecoration(
                labelText: 'Shipping Method',
                labelStyle: TextStyle(color: Color(0xff0d3b66)),
              ),
              items: ['Standard Shipping', 'Express Shipping']
                  .map<DropdownMenuItem<String>>((String method) {
                return DropdownMenuItem<String>(
                  value: method,
                  child: Text(method),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedShippingMethod = newValue;
                });
              },
            ),
            Spacer(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to PaymentOptionsPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentOptionsPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Color(0xff0d3b66),
                ),
                child: Text(
                  'Continue to Payment',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xfffaf0ca),
    );
  }
}
