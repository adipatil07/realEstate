
class Property {
  final String id;
  final String ownerId;
  final String type; // Residential or Commercial
  final String? subType; // Apartment, Villa, Office, etc.
  final String title;
  final String description;
  final String address;
  final double price;
  final List<String> images;
  final bool isAvailable;
  final DateTime createdAt;

  Property({
    required this.id,
    required this.ownerId,
    required this.type,
    this.subType,
    required this.title,
    required this.description,
    required this.address,
    required this.price,
    required this.images,
    required this.isAvailable,
    required this.createdAt,
  });

  // Convert Property object to JSON for Firebase
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ownerId': ownerId,
      'type': type,
      'subType': subType,
      'title': title,
      'description': description,
      'address': address,
      'price': price,
      'images': images,
      'isAvailable': isAvailable,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Convert JSON to Property object
  factory Property.fromMap(Map<String, dynamic> map) {
    return Property(
      id: map['id'],
      ownerId: map['ownerId'],
      type: map['type'],
      subType: map['subType'],
      title: map['title'],
      description: map['description'],
      address: map['address'],
      price: map['price'].toDouble(),
      images: List<String>.from(map['images']),
      isAvailable: map['isAvailable'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
