class CardModel {
  final image;
  final title;
  final category;
  final content;

  CardModel({this.image, this.title, this.category, this.content});
}

List<CardModel> cardContent = [
  CardModel(
      title: 'Title One',
      image:
          'https://cdn.dribbble.com/users/623359/screenshots/13670617/media/b020cb592153c999817dca341de2d782.png',
      category: "Category1"),
  CardModel(
      title: 'Title Two',
      image:
          'https://cdn.dribbble.com/users/623359/screenshots/13670602/media/0f15bc59541b4176455d502adc1f2cb2.png',
      category: "Category2"),
  CardModel(
      title: 'Title Three',
      image:
          'https://cdn.dribbble.com/users/623359/screenshots/14149713/media/0f162f3f291fa31fc734534b408d73a8.png',
      category: "Category1"),
];
