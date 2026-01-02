class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  String? brand;
  final double price;
  final double rating;
  final Dimensions dimensions;
  final List<ImageModel> images;
  int quantity;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.rating,
    required this.dimensions,
    required this.images,
    this.brand,
    this.quantity = 1,
  });

  factory ProductModel.fromJson(dynamic jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      description: jsonData['description'],
      category: jsonData['category'],
      brand: jsonData['brand'],
      price: jsonData['price'],
      rating: jsonData['rating'],
      dimensions: Dimensions.fromJson(jsonData['dimensions']),
      images: (jsonData['images'] as List)
          .map((e) => ImageModel.fromJson(e))
          .toList(),
      quantity: jsonData['quantity'] ?? 1,
    );
  }
}

class ImageModel {
  final String url;

  ImageModel({required this.url});

  factory ImageModel.fromJson(dynamic jsonData) {
    return ImageModel(url: jsonData);
  }
}

class Dimensions {
  final double width;
  final double height;
  final double depth;

  Dimensions({required this.width, required this.height, required this.depth});

  factory Dimensions.fromJson(dynamic jsonData) {
    return Dimensions(
      width: (jsonData['width'] as num).toDouble(),
      height: (jsonData['height'] as num).toDouble(),
      depth: (jsonData['depth'] as num).toDouble(),
    );
  }
}
