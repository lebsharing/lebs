import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class LeftPdfHomeworkWidget extends StatefulWidget {
  final String? pdfUrl;
  const LeftPdfHomeworkWidget({Key? key, this.pdfUrl}) : super(key: key);

  @override
  State<LeftPdfHomeworkWidget> createState() => _LeftPOdfHomeworkWidgetState();
}

class _LeftPOdfHomeworkWidgetState extends State<LeftPdfHomeworkWidget> {
  int currentPage = 0;
  File? _filePath;
  bool loadSuccess = false;
  bool _error = false;

  @override
  void initState() {
    super.initState();
    createFileOfPdfUrl();
  }

  Future<File?> createFileOfPdfUrl() async {
    Completer<File> completer = Completer();
    try {
      String? url = widget.pdfUrl;
      if (url == null || url.isEmpty) {
        setState(() {
          _error = true;
        });
        return null;
      } else {
        final filename = url.substring(url.lastIndexOf("/") + 1);
        var request = await HttpClient().getUrl(Uri.parse(url));
        var response = await request.close();
        var bytes = await consolidateHttpClientResponseBytes(response);
        var dir = await getApplicationDocumentsDirectory();
        print("--fileName:${dir.path}/$filename");
        File file = File("${dir.path}/$filename");

        await file.writeAsBytes(bytes);
        setState(() {
          _error = false;
          loadSuccess = true;
          _filePath = file;
        });
        completer.complete(file);
      }
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          if (_error) Text("Error"),
          if (loadSuccess && _filePath != null)
            PDFView(
              filePath: _filePath!.path,
              swipeHorizontal: true,
              autoSpacing: false,
              pageFling: true,
              defaultPage: currentPage,
              fitPolicy: FitPolicy.WIDTH,
              preventLinkNavigation: false,
              onRender: (_pages) {
                print("----");
              },
              onError: (error) {
                print("---onError--$error");
              },
              onViewCreated: (PDFViewController pdfViewController) {
                print("----");
              },
              onPageChanged: (int? page, int? total) {
                print("----");
                setState(() {
                  currentPage = page ?? 0;
                });
              },
            ),
          if (!loadSuccess)
            Center(
              child: CircularProgressIndicator(),
            )
        ],
      ),
    );
  }
}
