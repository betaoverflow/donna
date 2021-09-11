class OnboardingModel {
  final image;
  final title;
  final descp;

  OnboardingModel({this.image, this.title, this.descp});
}

List<OnboardingModel> onboardingContent = [
  OnboardingModel(
      title: 'Title One',
      image:
          'https://cdn.dribbble.com/users/623359/screenshots/13670617/media/b020cb592153c999817dca341de2d782.png',
      descp:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "),
  OnboardingModel(
      title: 'Title Two',
      image:
          'https://cdn.dribbble.com/users/623359/screenshots/13670602/media/0f15bc59541b4176455d502adc1f2cb2.png',
      descp:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "),
  OnboardingModel(
      title: 'Title Three',
      image:
          'https://cdn.dribbble.com/users/623359/screenshots/14149713/media/0f162f3f291fa31fc734534b408d73a8.png',
      descp:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "),
];
