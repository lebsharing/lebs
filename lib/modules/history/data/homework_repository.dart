import 'package:lebs/models/history/homework_content.dart';
import 'package:lebs/models/history/pdf_homework.dart';

class HomeworkRepository {
  static Future<List<HomeworkContent>> getHomework() async {
    return Future.delayed(const Duration(seconds: 2), () {
      List<HomeworkContent> content = List.empty(growable: true);
      content.add(HomeworkContent(tabName: "课后巩固", homeworkType: 3));
      content.add(
        HomeworkContent(
          tabName: "拓展练习",
          homeworkType: 1,
          pdfHomework: PdfHomework(
              hwContent:
                  "https://cdn.lingoace.com/hw_content/1924178583/家庭作业-Level1-Unit7-Lesson2-0318-1676724564.pdf",
              hwName: "作业"),
        ),
      );
      content.add(HomeworkContent(tabName: "在线作业", homeworkType: 2));
      return content;
    }).onError((error, stackTrace) {
      return List.empty();
    });
  }
}
