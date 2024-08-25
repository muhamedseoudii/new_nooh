class MovieCategory {
  String? status;
  List<MovieCategoryData>? data;

  MovieCategory({this.status, this.data});

  MovieCategory.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <MovieCategoryData>[];
      json['data'].forEach((v) {
        data!.add(new MovieCategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MovieCategoryData {
  String? sId;
  String? title;
  String? description;
  int? releaseDate;
  Category? category;
  Image? image;
  double? rating;
  String? lang;
  int? duration;
  String? videoUrl;
  bool? trending;
  String? createdAt;
  String? updatedAt;
  int? iV;

  MovieCategoryData(
      {this.sId,
      this.title,
      this.description,
      this.releaseDate,
      this.category,
      this.image,
      this.rating,
      this.lang,
      this.duration,
      this.videoUrl,
      this.trending,
      this.createdAt,
      this.updatedAt,
      this.iV});

  MovieCategoryData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    releaseDate = json['releaseDate'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    rating = json['rating'] != null
        ? (json['rating'] is int
            ? (json['rating'] as int).toDouble()
            : json['rating'] as double)
        : null;
    lang = json['lang'];
    duration = json['duration'];
    videoUrl = json['videoUrl'];
    trending = json['trending'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['releaseDate'] = this.releaseDate;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['rating'] = this.rating;
    data['lang'] = this.lang;
    data['duration'] = this.duration;
    data['videoUrl'] = this.videoUrl;
    data['trending'] = this.trending;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Category {
  String? sId;
  String? title;
  Image? image;
  String? type;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Category(
      {this.sId,
      this.title,
      this.image,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OpenImage'] = this.openImage;
    data['DeleteImage'] = this.deleteImage;
    return data;
  }
}
