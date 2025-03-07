class ContentTitle {
  final String title;
  final String subtitle;

  const ContentTitle({required this.title, required this.subtitle});
}

class CardViewModel {
  final int daysAgo;
  final int bookmark;
  final ContentTitle contentTitle;
  final List<String> displayImages;
  final List<String> allImages;

  const CardViewModel({
    required this.daysAgo,
    required this.bookmark,
    required this.contentTitle,
    required this.displayImages,
    required this.allImages,
  });
}

class CardDetailsSource {}
