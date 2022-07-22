import 'package:lebs/models/history/pdf_homework.dart';

class HomeworkContent {
  //1-pdf作业 2-在线作业 3-unit作业
  int? homeworkType;
  String? tabName;
  //"启蒙版作业状态： 0-无作业，4-未作，5-未做完，6-已做完，未评价，7-已评价"
  int? qmStatus;

  PdfHomework? pdfHomework;

  HomeworkContent(
      {this.homeworkType, this.tabName, this.qmStatus, this.pdfHomework});
  HomeworkContent.fromJson(Map<String, dynamic> json) {
    homeworkType = json['homeworkType'];
    qmStatus = json['qmStatus'];
    tabName = json['tabName'];
    if (json['pdfHomework'] != null) {
      pdfHomework = PdfHomework.fromJson(json['pdfHomework']);
    }
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      "homeworkType": homeworkType,
      "qmStatus": qmStatus,
      "tabName": tabName,
      "pdfHomework": pdfHomework?.toJson(),
    };
    return data;
  }
}
