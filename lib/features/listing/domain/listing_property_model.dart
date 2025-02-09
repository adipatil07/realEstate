class Property {
  final String title;
  final String desciption;
  final String developer;
  final String location;
  final String propertyType;
  final String possessionDate;
  final String status;
  final String averagePrice;
  final double price;
  final double emi;
  final String sizes;
  final String locality;
  final List<String> imageUrls;
  final List<String> nearbyPlaces;

  Property( {
    required this.sizes,
    required this.locality,
    required this.title,
    required this.developer,
    required this.location,
    required this.propertyType,
    required this.possessionDate,
    required this.status,
    required this.averagePrice,
    required this.price,
    required this.emi,
    required this.imageUrls,
    required this.nearbyPlaces,
    required this.desciption,
  });
}
