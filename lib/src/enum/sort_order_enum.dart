enum SortOrderEnum { asc, desc }

extension SortOrderExtension on SortOrderEnum {
  String get name {
    switch (this) {
      case SortOrderEnum.asc:
        return 'asc';
      case SortOrderEnum.desc:
        return 'desc';
      default:
        return null;
    }
  }
}
