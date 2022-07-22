class PdfHomework {
  int? id;
  String? hwContent;
  String? hwName;

  PdfHomework({this.id, this.hwContent, this.hwName});

  PdfHomework.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hwName = json['hwName'];
    hwContent = json['hwContent'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'id': id,
      "hwName": hwName,
      "hwContent": hwContent
    };
    return json;
  }
}
