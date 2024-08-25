class TrendingMovies {
  final String? status;
  final List<Movie>? data;

  TrendingMovies({this.status, this.data});

  factory TrendingMovies.fromJson(Map<String, dynamic> json) {
    return TrendingMovies(
      status: json['status'] as String?, // Change to String?
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
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

class Movie {
  final String? id;
  final String? title;
  final String? description;
  final int? releaseDate;
  final String? category;
  final Image? image;
  final double? rating;
  final String? lang;
  final double? duration;
  final String? videoUrl;
  final bool? trending;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Movie({
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
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      releaseDate: json['releaseDate'] as int?,
      category: json['category'] as String?,
      image: json['image'] != null
          ? Image.fromJson(json['image'] as Map<String, dynamic>)
          : null,
      rating: json['rating'] != null
          ? (json['rating'] is int
              ? (json['rating'] as int).toDouble()
              : json['rating'] as double)
          : null,
      lang: json['lang'] as String?,
      duration: (json['duration'] as num?)?.toDouble(),
      videoUrl: json['videoUrl'] as String?,
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
    };
  }
}

class Image {
  final String? openImage;
  final String? deleteImage;

  Image({this.openImage, this.deleteImage});

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
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
