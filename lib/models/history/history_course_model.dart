class HistoryCourseModel {
  int? classId;
  DateTime? startTime; //课程开始时间
  DateTime? endTime;
  String? studentName; //学生名字
  //状态，0：已取消；1：未开始；2：开始上课；3：正常结束；4：异常结束
  int? status;
  //学科类型,0:chinese, 1:english 3:math;4:Japanese;5:French
  int? subjectType;
  //0:试听课；1：正式课程
  int? courseType;
  //班型，1：一对一；2：小班课
  int? classTypeId;
  String? lessonDescription;

  HistoryCourseModel(
      {this.classId,
      this.startTime,
      this.endTime,
      this.studentName,
      this.status,
      this.subjectType,
      this.courseType,
      this.classTypeId,
      this.lessonDescription});

  HistoryCourseModel.fromJson(Map<String, dynamic> json) {
    classId = json['classId'];
    startTime =
        json["startTime"] != null ? DateTime.parse(json['startTime']) : null;
    endTime = json["endTime"] != null ? DateTime.parse(json['endTime']) : null;
    studentName = json['studentName'];
    status = json['status'];
    subjectType = json['subjectType'];
    courseType = json['courseType'];
    classTypeId = json['classTypeId'];
    lessonDescription = json['lessonDescription'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      "classId": classId,
      "startTime": startTime?.toIso8601String(),
      "endTime": endTime?.toIso8601String(),
      "studentName": studentName,
      "status": status,
      "subjectType": subjectType,
      "courseType": courseType,
      "classTypeId": classTypeId,
      "lessonDescription": lessonDescription,
    };
    return json;
  }

  String getSubjectName() {
    //0:chinese, 1:english 3:math;4:Japanese;5:French
    String subjectName = "";
    switch (subjectType) {
      case 0:
        subjectName = "Chinese";
        break;
      case 1:
        subjectName = "English";
        break;
      case 3:
        subjectName = "Math";
        break;
      case 4:
        subjectName = "Japanese";
        break;
      case 5:
        subjectName = "French";
        break;
      default:
        break;
    }
    return subjectName;
  }
}
