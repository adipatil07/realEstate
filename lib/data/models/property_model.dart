class CreatePropertyModel {
  final String id;
  final String ownerId;
  final String propertyType;
  final String? commercialSubType;
  final String? residentialSubType;
  
  // Address Details
  final String city;
  final String buildingName;
  final String locality;
  final String address;

  // Price & Financials
  final double price;
  final double? expectedRent;

  // Possession Details
  final String possessionStatus;
  final int? ageOfProperty;
  final DateTime? completionDate;

  // Location Hub & Connectivity
  final String? locationHubType;

  // Area & Ownership
  final double builtUpArea;
  final double carpetArea;
  final String ownershipType;

  // Room & Furnishing Details
  final String roomType;
  final String furnishedCondition;
  final int totalFloors;
  final int propertyFloor;

  // Amenities
  final List<String> amenities;

  // Photos
  final List<String> images;

  // Description
  final String description;

  // Property Status
  final bool isListed;
  final DateTime createdAt;

  CreatePropertyModel({
    required this.id,
    required this.ownerId,
    required this.propertyType,
    this.commercialSubType,
    this.residentialSubType,
    required this.city,
    required this.buildingName,
    required this.locality,
    required this.address,
    required this.price,
    this.expectedRent,
    required this.possessionStatus,
    this.ageOfProperty,
    this.completionDate,
    this.locationHubType,
    required this.builtUpArea,
    required this.carpetArea,
    required this.ownershipType,
    required this.roomType,
    required this.furnishedCondition,
    required this.totalFloors,
    required this.propertyFloor,
    required this.amenities,
    required this.images,
    required this.description,
    this.isListed = false,
    required this.createdAt,
  });

  // 🔹 Added `copyWith` method to update specific fields
  CreatePropertyModel copyWith({
    String? id,
    String? ownerId,
    String? propertyType,
    String? commercialSubType,
    String? residentialSubType,
    String? city,
    String? buildingName,
    String? locality,
    String? address,
    double? price,
    double? expectedRent,
    String? possessionStatus,
    int? ageOfProperty,
    DateTime? completionDate,
    String? locationHubType,
    double? builtUpArea,
    double? carpetArea,
    String? ownershipType,
    String? roomType,
    String? furnishedCondition,
    int? totalFloors,
    int? propertyFloor,
    List<String>? amenities,
    List<String>? images,
    String? description,
    bool? isListed,
    DateTime? createdAt,
  }) {
    return CreatePropertyModel(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      propertyType: propertyType ?? this.propertyType,
      commercialSubType: commercialSubType ?? this.commercialSubType,
      residentialSubType: residentialSubType ?? this.residentialSubType,
      city: city ?? this.city,
      buildingName: buildingName ?? this.buildingName,
      locality: locality ?? this.locality,
      address: address ?? this.address,
      price: price ?? this.price,
      expectedRent: expectedRent ?? this.expectedRent,
      possessionStatus: possessionStatus ?? this.possessionStatus,
      ageOfProperty: ageOfProperty ?? this.ageOfProperty,
      completionDate: completionDate ?? this.completionDate,
      locationHubType: locationHubType ?? this.locationHubType,
      builtUpArea: builtUpArea ?? this.builtUpArea,
      carpetArea: carpetArea ?? this.carpetArea,
      ownershipType: ownershipType ?? this.ownershipType,
      roomType: roomType ?? this.roomType,
      furnishedCondition: furnishedCondition ?? this.furnishedCondition,
      totalFloors: totalFloors ?? this.totalFloors,
      propertyFloor: propertyFloor ?? this.propertyFloor,
      amenities: amenities ?? this.amenities,
      images: images ?? this.images,
      description: description ?? this.description,
      isListed: isListed ?? this.isListed,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  // 🔹 Added `empty` method for initializing an empty object
  factory CreatePropertyModel.empty() {
    return CreatePropertyModel(
      id: "",
      ownerId: "",
      propertyType: "",
      city: "",
      buildingName: "",
      locality: "",
      address: "",
      price: 0.0,
      possessionStatus: "",
      builtUpArea: 0.0,
      carpetArea: 0.0,
      ownershipType: "",
      roomType: "",
      furnishedCondition: "",
      totalFloors: 0,
      propertyFloor: 0,
      amenities: [],
      images: [],
      description: "",
      isListed: false,
      createdAt: DateTime.now(),
    );
  }

  // Convert PropertyModel to JSON for Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ownerId': ownerId,
      'propertyType': propertyType,
      'commercialSubType': commercialSubType,
      'residentialSubType': residentialSubType,
      'city': city,
      'buildingName': buildingName,
      'locality': locality,
      'address': address,
      'price': price,
      'expectedRent': expectedRent,
      'possessionStatus': possessionStatus,
      'ageOfProperty': ageOfProperty,
      'completionDate': completionDate?.toIso8601String(),
      'locationHubType': locationHubType,
      'builtUpArea': builtUpArea,
      'carpetArea': carpetArea,
      'ownershipType': ownershipType,
      'roomType': roomType,
      'furnishedCondition': furnishedCondition,
      'totalFloors': totalFloors,
      'propertyFloor': propertyFloor,
      'amenities': amenities,
      'images': images,
      'description': description,
      'isListed': isListed,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Convert JSON to PropertyModel
  factory CreatePropertyModel.fromMap(Map<String, dynamic> map) {
    return CreatePropertyModel(
      id: map['id'],
      ownerId: map['ownerId'],
      propertyType: map['propertyType'],
      commercialSubType: map['commercialSubType'],
      residentialSubType: map['residentialSubType'],
      city: map['city'],
      buildingName: map['buildingName'],
      locality: map['locality'],
      address: map['address'],
      price: map['price'].toDouble(),
      expectedRent: map['expectedRent']?.toDouble(),
      possessionStatus: map['possessionStatus'],
      ageOfProperty: map['ageOfProperty'],
      completionDate: map['completionDate'] != null
          ? DateTime.parse(map['completionDate'])
          : null,
      locationHubType: map['locationHubType'],
      builtUpArea: map['builtUpArea'].toDouble(),
      carpetArea: map['carpetArea'].toDouble(),
      ownershipType: map['ownershipType'],
      roomType: map['roomType'],
      furnishedCondition: map['furnishedCondition'],
      totalFloors: map['totalFloors'],
      propertyFloor: map['propertyFloor'],
      amenities: List<String>.from(map['amenities']),
      images: List<String>.from(map['images']),
      description: map['description'],
      isListed: map['isListed'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
