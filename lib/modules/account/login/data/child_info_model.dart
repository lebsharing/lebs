class ChildInfoModel {
  ///id为null,用来表示添加学生
  int? childId;
  String? name;
  String? avatar;
  int? birthday;
  //性别，1：男；2：女；0：未知，默认值0
  int? gender;

  ChildInfoModel(
      {this.childId, this.name, this.avatar, this.birthday, this.gender});

  ChildInfoModel.fromJson(Map<String, dynamic> json) {
    childId = json['childId'];
    name = json['name'];
    avatar = json['avatar'];
    birthday = json['birthday'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      "childId": childId,
      "name": name,
      "avatar": avatar,
      "birthday": birthday,
      "gender": gender,
    };
    return data;
  }
}
