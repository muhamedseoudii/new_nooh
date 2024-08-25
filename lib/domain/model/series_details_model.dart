class SeriesDetails {
  final String? status;
  final SeriesData? data;

  SeriesDetails({this.status, this.data});

  factory SeriesDetails.fromJson(Map<String, dynamic> json) {
    return SeriesDetails(
      status: json['status'] as String?,
      data: json['data'] != null
          ? SeriesData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data?.toJson(),
    };
  }
}

class SeriesData {
  final String? id;
  final String? title;
  final String? description;
  final int? releaseDate;
  final List<Episode>? episodes;
  final Category? category;
  final ImageData? image;
  final double? rating;
  final String? lang;
  final bool? trending;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  SeriesData({
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

  factory SeriesData.fromJson(Map<String, dynamic> json) {
    return SeriesData(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      releaseDate: json['releaseDate'] as int?,
      episodes: (json['episodes'] as List<dynamic>?)
          ?.map((e) => Episode.fromJson(e as Map<String, dynamic>))
          .toList(),
      category: json['category'] != null
          ? Category.fromJson(json['category'] as Map<String, dynamic>)
          : null,
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
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'releaseDate': releaseDate,
      'episodes': episodes?.map((e) => e.toJson()).toList(),
      'category': category?.toJson(),
      'image': image?.toJson(),
      'rating': rating,
      'lang': lang,
      'trending': trending,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}

class Episode {
  final String? id;
  final int? title;
  final String? videoUrl;
  final String? series;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Episode({
    this.id,
    this.title,
    this.videoUrl,
    this.series,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      id: json['_id'] as String?,
      title: json['title'] as int?,
      videoUrl: json['videoUrl'] as String?,
      series: json['Series'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'videoUrl': videoUrl,
      'Series': series,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}

class Category {
  final String? id;
  final String? title;
  final ImageData? image;
  final String? type;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Category({
    this.id,
    this.title,
    this.image,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      image: json['image'] != null
          ? ImageData.fromJson(json['image'] as Map<String, dynamic>)
          : null,
      type: json['type'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'image': image?.toJson(),
      'type': type,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
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
