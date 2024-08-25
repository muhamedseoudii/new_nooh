class SeriesCategory {
  String? status;
  List<SeriesCategoryData>? data;

  SeriesCategory({this.status, this.data});

  SeriesCategory.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <SeriesCategoryData>[];
      json['data'].forEach((v) {
        data!.add(SeriesCategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SeriesCategoryData {
  String? id;
  String? title;
  String? description;
  int? releaseDate;
  Category? category;
  Image? image;
  double? rating;
  String? lang;
  bool? trending;
  String? createdAt;
  String? updatedAt;
  int? v;

  SeriesCategoryData(
      {this.id,
      this.title,
      this.description,
      this.releaseDate,
      this.category,
      this.image,
      this.rating,
      this.lang,
      this.trending,
      this.createdAt,
      this.updatedAt,
      this.v});

  SeriesCategoryData.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    description = json['description'];
    releaseDate = json['releaseDate'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    rating = json['rating'] != null
        ? (json['rating'] is int
            ? (json['rating'] as int).toDouble()
            : json['rating'] as double)
        : null;
    lang = json['lang'];
    trending = json['trending'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['releaseDate'] = releaseDate;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['rating'] = rating;
    data['lang'] = lang;
    data['trending'] = trending;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = v;
    return data;
  }
}

class Episodes {
  // Assuming there might be episode details in the future.
  // Since the list is empty in the example, leaving this class empty.
}

class Category {
  String? id;
  String? title;
  Image? image;
  String? type;
  String? createdAt;
  String? updatedAt;
  int? v;

  Category(
      {this.id,
      this.title,
      this.image,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.v});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['title'] = title;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['type'] = type;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = v;
    return data;
  }
}

class Image {
  String? openImage;
  String? deleteImage;

  Image({this.openImage, this.deleteImage});

  Image.fromJson(Map<String, dynamic> json) {
    openImage = json['OpenImage'];
    deleteImage = json['DeleteImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['OpenImage'] = openImage;
    data['DeleteImage'] = deleteImage;
    return data;
  }
}
