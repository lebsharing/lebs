enum SetItemType { language, recording, version, conditions, deleteAccount }

class SetItemInfo {
  String titleKey;
  String value;
  SetItemType type;

  SetItemInfo(this.titleKey, this.value, this.type);
}
