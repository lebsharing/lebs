import 'package:flutter/material.dart';
import 'package:lebs/models/history/homework_content.dart';
import 'package:lebs/modules/history/views/w/left_pdf_homework.dart';

class PdfHomeworkPage extends StatelessWidget {
  final HomeworkContent pdfHomework;
  const PdfHomeworkPage({
    Key? key,
    required this.pdfHomework,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: LeftPdfHomeworkWidget(
              pdfUrl: pdfHomework.pdfHomework?.hwContent,
            ),
          ),
          Expanded(
            child: Text(DateTime.now().toIso8601String()),
          ),
        ],
      ),
    );
  }
}
