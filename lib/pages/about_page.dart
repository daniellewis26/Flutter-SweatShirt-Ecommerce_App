// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffaf0ca),
      appBar: AppBar(
        title: const Text('About Snug Wear', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xfffaf0ca)), ),
        backgroundColor: Color(0xff0d3b66),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Welcome to Snug Wear!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xff0d3b66)),
              ),
              SizedBox(height: 20),
              Text(
                'Snug Wear is more than just an app—it\'s a journey into the world of software development, crafted by Daniel Lewis, an aspiring software developer eager to showcase his newfound skills and passion for coding.',
                style: TextStyle(fontSize: 16, color: Color(0xff0d3b66)),
              ),
              SizedBox(height: 20),
              Text(
                'A Practice Playground',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xff0d3b66)),
              ),
              SizedBox(height: 10),
              Text(
                'Snug Wear isn\'t your typical e-commerce app—it\'s a practice ground where Daniel hones his coding abilities and explores the intricacies of app development. As he embarks on his coding journey, Daniel is excited to share his progress and demonstrate the skills he\'s been diligently learning.',
                style: TextStyle(fontSize: 16, color: Color(0xff0d3b66)),
              ),
              SizedBox(height: 20),
              Text(
                'Why Snug Wear?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xff0d3b66)),
              ),
              SizedBox(height: 10),
              Text(
                'Snug Wear may not be a fully functional app, but it represents Daniel\'s dedication to mastering the art of software development. Through Snug Wear, Daniel aims to highlight his proficiency in frontend and backend development, UI/UX design, and database management.',
                style: TextStyle(fontSize: 16, color: Color(0xff0d3b66)),
              ),
              SizedBox(height: 20),
              Text(
                'What to Expect',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xff0d3b66)),
              ),
              SizedBox(height: 10),
              Text(
                'As you navigate through Snug Wear, you\'ll notice its simplicity and charm. While it may lack the bells and whistles of a polished e-commerce platform, each feature and design element reflects Daniel\'s dedication to continuous improvement and learning.',
                style: TextStyle(fontSize: 16, color: Color(0xff0d3b66)),
              ),
              SizedBox(height: 20),
              Text(
                'Connect with Daniel',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xff0d3b66)),
              ),
              SizedBox(height: 10),
              Text(
                'If you\'re curious about Daniel\'s journey or have feedback to share, feel free to reach out! Snug Wear is more than just a practice app—it\'s a testament to Daniel\'s commitment to growth and excellence in the world of software development.',
                style: TextStyle(fontSize: 16, color: Color(0xff0d3b66)),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Thank you for joining Daniel on this exciting adventure with Snug Wear. Stay cozy, and happy coding!',
                  style: TextStyle(fontSize: 16, color: Color(0xff0d3b66),
                  ),
                  textAlign: TextAlign.center, // Add this to center the text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
