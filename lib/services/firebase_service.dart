import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:homescout/data/models/property_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<List<String>> uploadImages(List<File> images) async {
    List<String> downloadUrls = [];

    for (File image in images) {
      try {
        String fileName =
            "property_images/${DateTime.now().millisecondsSinceEpoch}.jpg";
        TaskSnapshot snapshot = await _storage.ref(fileName).putFile(image);
        String downloadUrl = await snapshot.ref.getDownloadURL();
        downloadUrls.add(downloadUrl);
      } catch (e) {
        print("Error uploading image: $e");
      }
    }

    return downloadUrls;
  }

  Future<void> addProperty(CreatePropertyModel property) async {
    try {
      String docId = property.id.isNotEmpty
          ? property.id
          : _firestore.collection('properties').doc().id;

      await _firestore
          .collection('properties')
          .doc(docId)
          .set(property.toMap());

      print("Property successfully added to Firestore!");
    } catch (e) {
      print("Error adding property: $e");
      throw Exception("Firestore Error: $e");
    }
  }

  Future<Map<String, dynamic>?> fetchPropertyById(String propertyId) async {
    try {
      DocumentSnapshot snapshot = await _firestore.collection('properties').doc(propertyId).get();

      if (snapshot.exists) {
        return snapshot.data() as Map<String, dynamic>;
      } else {
        return null; // Property not found
      }
    } catch (e) {
      print("Error fetching property: $e");
      throw Exception("Firestore Error: $e");
    }
  }
}
