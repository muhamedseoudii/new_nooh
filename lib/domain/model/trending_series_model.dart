class TrendingSeries {
  final String? status;
  final List<Series>? data;

  TrendingSeries({this.status, this.data});

  factory TrendingSeries.fromJson(Map<String, dynamic> json) {
    return TrendingSeries(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Series.fromJson(e as Map<String, dynamic>))
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

class Series {
  final String? id;
  final String? title;
  final String? description;
  final int? releaseDate;
  final List<String>? episodes;
  final String? category;
  final ImageData? image;
  final double? rating;
  final String? lang;
  final bool? trending;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Series({
    this.id,
    this.title,
    this.description,
    this.releaseDate,
    this.episodes,
    this.category,
    this.image,
    this.rating,
    this.lang,
    this.trending,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      releaseDate: json['releaseDate'] as int?,
      episodes: (json['episodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
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
      trending: json['trending'] as bool?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'releaseDate': releaseDate,
      'episodes': episodes,
      'category': category,
      'image': image?.toJson(),
      'rating': rating,
      'lang': lang,
      'trending': trending,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': v,
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
