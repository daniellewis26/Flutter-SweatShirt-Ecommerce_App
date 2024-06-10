class Sweatshirt {
  final String name;
  final String price;
  final String imagePath;
  final String description;

  Sweatshirt({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.description,
  });

  // Convert a Sweatshirt object into a Map object
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'imagePath': imagePath,
      'description': description,
    };
  }

  // Extract a Sweatshirt object from a Map object
  factory Sweatshirt.fromJson(Map<String, dynamic> json) {
    return Sweatshirt(
      name: json['name'],
      price: json['price'],
      imagePath: json['imagePath'],
      description: json['description'],
    );
  }
}
