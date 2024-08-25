class TrendingChannel {
  String? status;
  List<Channel>? data;

  TrendingChannel({this.status, this.data});

  TrendingChannel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Channel>[];
      json['data'].forEach((v) {
        data!.add(Channel.fromJson(v));
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

class Channel {
  String? id;
  String? title;
  String? category;
  String? streamUrl;
  String? lang;
  ImageData? image;
  bool? trending;
  String? createdAt;
  String? updatedAt;
  int? v;

  Channel(
      {this.id,
      this.title,
      this.category,
      this.streamUrl,
      this.lang,
      this.image,
      this.trending,
      this.createdAt,
      this.updatedAt,
      this.v});

  Channel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    category = json['category'];
    streamUrl = json['streamUrl'];
    lang = json['lang'];
    image = json['image'] != null ? ImageData.fromJson(json['image']) : null;
    trending = json['trending'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['title'] = title;
    data['category'] = category;
    data['streamUrl'] = streamUrl;
    data['lang'] = lang;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['trending'] = trending;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = v;
    return data;
  }
}

class ImageData {
  String? openImage;
  String? deleteImage;

  ImageData({this.openImage, this.deleteImage});

  ImageData.fromJson(Map<String, dynamic> json) {
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
