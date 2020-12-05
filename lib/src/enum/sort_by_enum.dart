enum SortByEnum { lowercaseDescription, brandOwner, score }

extension SortByExtension on SortByEnum {
  String get name {
    switch (this) {
      case SortByEnum.lowercaseDescription:
        return 'lowercaseDescription.keyword';
      case SortByEnum.brandOwner:
        return 'brandOwner.keyword';
      case SortByEnum.score:
        return 'score';
      default:
        return null;
    }
  }
}
