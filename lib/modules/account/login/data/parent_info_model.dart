class ParentInfoModel {
  int? id;
  String? token;

  ParentInfoModel({this.id, this.token});

  ParentInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      "id": id,
      "token": token,
    };
    return data;
  }
}
