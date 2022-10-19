class Shoe {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final int color;
  Shoe({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.color,
  });

  static Shoe fromJson(Map<String, dynamic> json) => Shoe(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      imageUrl: json['imagePath'],
      color: int.parse(json['color']));

  static List<Shoe> getData(List<Map<String, dynamic>> data) {
    List<Shoe> dataList = [];
    for (var element in data) {
      dataList.add(Shoe.fromJson(element));
    }
    return dataList;
  }
}
