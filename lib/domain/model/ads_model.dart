class AdsModel {
  String? status;
  List<AdsData>? data;

  AdsModel({this.status, this.data});

  AdsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <AdsData>[];
      json['data'].forEach((v) {
        data!.add(new AdsData.fromJson(v));
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

class AdsData {
  String? sId;
  String? telegramPage;
  String? appID;
  String? bannerID;
  String? interstitialID;
  String? createdAt;
  String? updatedAt;
  int? iV;

  AdsData(
      {this.sId,
      this.telegramPage,
      this.appID,
      this.bannerID,
      this.interstitialID,
      this.createdAt,
      this.updatedAt,
      this.iV});

  AdsData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    telegramPage = json['telegramPage'];
    appID = json['appID'];
    bannerID = json['bannerID'];
    interstitialID = json['interstitialID'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['telegramPage'] = this.telegramPage;
    data['appID'] = this.appID;
    data['bannerID'] = this.bannerID;
    data['interstitialID'] = this.interstitialID;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
