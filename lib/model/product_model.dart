class Product{
  int id;
  String title;
  String description;
  int price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;

  Product({required this.id,
  required this.title,
  required this.description,
  required this.price,
  required this.discountPercentage,
  required this.rating,
  required this.stock,
  required this.brand,
  required this.category,
  required this.thumbnail,
  required this.images});

  factory Product.fromMap(Map<String, dynamic> map){
    return Product(
      id: map['id'],
      title: map['title'],
      price: map['price'],
      description: map['description'],
      discountPercentage: map['discountPercentage'],
      category: map['category'],
      rating: map['rating'],
      stock: map['stock'],
      brand: map['brand'],
      thumbnail: map['thumbnail'],
      images: (map['images'] as List<dynamic>)
        .map((e) => e as String)
        .toList()
    );
  }
}