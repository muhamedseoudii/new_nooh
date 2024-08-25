class SearchModel {
  final String? status;
  final List<SearchData>? data;

  SearchModel({this.status, this.data});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SearchData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}

class SearchData {
  final String? id;
  final String? title;
  final String? description;
  final int? releaseDate;
  final String? category;
  final ImageData? image;
  final double? rating;
  final String? lang;
  final int? duration;
  final String? videoUrl;
  final bool? trending;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? type;
  final List<String>? episodes;
  final String? streamUrl;

  SearchData({
    this.id,
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
    this.v,
    this.type,
    this.episodes,
    this.streamUrl,
  });

  factory SearchData.fromJson(Map<String, dynamic> json) {
    return SearchData(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      releaseDate: json['releaseDate'] as int?,
      category: json['category'] as String?,
      image: json['image'] != null
          ? ImageData.fromJson(json['image'] as Map<String, dynamic>)
          : null,
      rating: json['rating'] != null
          ? (json['rating'] is int
              ? (json['rating'] as int).toDouble()
              : json['rating'] as double)
          : null,
      lang: json['lang'] as String?,
      duration: json['duration'] as int?,
      videoUrl: json['videoUrl'] as String?,
      trending: json['trending'] as bool?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
      v: json['__v'] as int?,
      type: json['type'] as String?,
      episodes: (json['episodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      streamUrl: json['streamUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'releaseDate': releaseDate,
      'category': category,
      'image': image?.toJson(),
      'rating': rating,
      'lang': lang,
      'duration': duration,
      'videoUrl': videoUrl,
      'trending': trending,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': v,
      'type': type,
      'episodes': episodes,
      'streamUrl': streamUrl,
    };
  }
}

class ImageData {
  final String? openImage;
  final String? deleteImage;

  ImageData({this.openImage, this.deleteImage});

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      openImage: json['OpenImage'] as String?,
      deleteImage: json['DeleteImage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'OpenImage': openImage,
      'DeleteImage': deleteImage,
    };
  }
}
