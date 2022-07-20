enum SetItemType { language, recording, version, conditions, deleteAccount }

class SetItemInfo {
  String title;
  String value;
  SetItemType type;

  SetItemInfo(this.title, this.value, this.type);
}
