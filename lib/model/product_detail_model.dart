class ProductDetailModel {
  String? price;
  String? age;
  String? title;
  String? description;
  String? category;
  String? subcategory;
  List<String>? urlImage;
  bool? isFree;
  String? time;
  String? uid;

  ProductDetailModel(
      {this.price,
      this.age,
      this.title,
      this.description,
      this.category,
      this.subcategory,
      this.urlImage,
      this.isFree,
      this.time,
      this.uid});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    age = json['age'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    subcategory = json['subcategory'];
    urlImage = json['urlImage'].cast<String>();
    isFree = json['isFree'];
    time = json['Time'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['price'] = price;
    data['age'] = age;
    data['title'] = title;
    data['description'] = description;
    data['category'] = category;
    data['subcategory'] = subcategory;
    data['urlImage'] = urlImage;
    data['isFree'] = isFree;
    data['Time'] = time;
    data['uid'] = uid;
    return data;
  }
}
