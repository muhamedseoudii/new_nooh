class ChannelDetails {
  String? status;
  ChannelData? data;

  ChannelDetails({this.status, this.data});

  ChannelDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new ChannelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ChannelData {
  String? sId;
  String? title;
  Category? category;
  String? streamUrl;
  String? lang;
  Image? image;
  bool? trending;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ChannelData(
      {this.sId,
      this.title,
      this.category,
      this.streamUrl,
      this.lang,
      this.image,
      this.trending,
      this.createdAt,
      this.updatedAt,
      this.iV});

  ChannelData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    streamUrl = json['streamUrl'];
    lang = json['lang'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    trending = json['trending'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['streamUrl'] = this.streamUrl;
    data['lang'] = this.lang;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
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
