import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homescout/data/models/property_model.dart';


class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addProperty(Property property) async {
    try {
      await _firestore.collection('properties').doc(property.id).set(property.toMap());
    } catch (e) {
      throw Exception("Error adding property: $e");
    }
  }
}