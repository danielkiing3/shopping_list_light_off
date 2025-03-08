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

class CardDetailsSource {
  static CardViewModel secondExample = CardViewModel(
    daysAgo: 1,
    bookmark: 8,
    contentTitle: ContentTitle(
      title: 'Healthy Eats',
      subtitle: 'Vibes and inshallah',
    ),
    displayImages: [
      'assets/images/4.png',
      'assets/images/5.png',
      'assets/images/6.png',
    ],
    allImages: [],
  );

  static CardViewModel firstExample = CardViewModel(
    daysAgo: 2,
    bookmark: 14,
    contentTitle: ContentTitle(
      title: 'Sunday Brunch Prep',
      subtitle: 'Ready for fresh crossiants and OJ!',
    ),
    displayImages: [
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png',
    ],
    allImages: [],
  );
}
