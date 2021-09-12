class CardModel {
  final image;
  final title;
  final category;
  final content;

  CardModel({this.image, this.title, this.category, this.content});
}

List<CardModel> cardContent = [
  CardModel(
      title: 'General Stuff',
      content: 'something',
      image:
          'https://cdn.dribbble.com/users/623359/screenshots/13670617/media/b020cb592153c999817dca341de2d782.png',
      category: "General"),
  CardModel(
      title: 'Pizza',
      content: 'I want to eat some pizza',
      image:
          'https://cdn.dribbble.com/users/623359/screenshots/13670602/media/0f15bc59541b4176455d502adc1f2cb2.png',
      category: "Food"),
  CardModel(
      title: 'Title Three',
      content: 'Content Three',
      image:
          'https://cdn.dribbble.com/users/623359/screenshots/14149713/media/0f162f3f291fa31fc734534b408d73a8.png',
      category: "Health"),
];
