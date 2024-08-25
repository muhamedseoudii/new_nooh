class MatchesDetails {
  String? status;
  MatchData? data;

  MatchesDetails({this.status, this.data});

  MatchesDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? MatchData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class MatchData {
  String? id;
  String? championship;
  String? round;
  Team? teamA;
  Team? teamB;
  String? date;
  String? time;
  List<String>? streamUrl;
  String? createdAt;
  String? updatedAt;
  int? v;

  MatchData({
    this.id,
    this.championship,
    this.round,
    this.teamA,
    this.teamB,
    this.date,
    this.time,
    this.streamUrl,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  MatchData.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    championship = json['championship'];
    round = json['round'];
    teamA = json['TeamA'] != null ? Team.fromJson(json['TeamA']) : null;
    teamB = json['TeamB'] != null ? Team.fromJson(json['TeamB']) : null;
    date = json['date'];
    time = json['time'];
    streamUrl = json['streamUrl'] != null ? List<String>.from(json['streamUrl']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['championship'] = championship;
    data['round'] = round;
    if (teamA != null) {
      data['TeamA'] = teamA!.toJson();
    }
    if (teamB != null) {
      data['TeamB'] = teamB!.toJson();
    }
    data['date'] = date;
    data['time'] = time;
    data['streamUrl'] = streamUrl;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = v;
    return data;
  }
}

class Team {
  String? name;
  String? openImage;
  String? deleteImage;

  Team({this.name, this.openImage, this.deleteImage});

  Team.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    openImage = json['OpenImage'];
    deleteImage = json['DeleteImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['OpenImage'] = openImage;
    data['DeleteImage'] = deleteImage;
    return data;
  }
}
