class OnboardingModel {
  final image;
  final title;
  final descp;

  OnboardingModel({this.image, this.title, this.descp});
}

List<OnboardingModel> onboardingContent = [
  OnboardingModel(
      title: 'Hi I\'m Donna',
      image:
          'https://cdn.dribbble.com/users/623359/screenshots/13670617/media/b020cb592153c999817dca341de2d782.png',
      descp: "Transform your smart devices to intelligent communicators "),
  OnboardingModel(
      title: 'Take the first steps',
      image:
          'https://cdn.dribbble.com/users/623359/screenshots/13670602/media/0f15bc59541b4176455d502adc1f2cb2.png',
      descp:
          "So many options for you to choose from. Make your life easier by just a tap "),
  OnboardingModel(
      title: 'Make it your own',
      image:
          'https://cdn.dribbble.com/users/623359/screenshots/14149713/media/0f162f3f291fa31fc734534b408d73a8.png',
      descp:
          "Personalize Donna to fit your needs. Add your most used phrases and contact people you might need in distress."),
];
