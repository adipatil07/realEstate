import 'package:flutter/material.dart';

class EnquiryPage extends StatelessWidget {
  final List<Map<String, String>> enquiries = [
    {
      'title': 'Enquiry 1',
      'description': 'Description for enquiry 1',
    },
    {
      'title': 'Enquiry 2',
      'description': 'Description for enquiry 2',
    },
    // Add more enquiries as needed
  ];

  EnquiryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enquiries'),
      ),
      body: ListView.builder(
        itemCount: enquiries.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(enquiries[index]['title']!),
              subtitle: Text(enquiries[index]['description']!),
            ),
          );
        },
      ),
    );
  }
}