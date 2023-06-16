class DataModel {
  String name;
  String img;
  int price;
  int people;
  int start;
  String description;
  String location;
  DataModel(
      {Key,
      key,
      required this.name,
      required this.img,
      required this.price,
      required this.people,
      required this.start,
      required this.description,
      required this.location});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        name: json['name'],
        img: json['img'],
        price: json['price'],
        people: json['people'],
        start: json['start'],
        description: json['description'],
        location: json['location']);
  }
}
