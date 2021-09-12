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
          'https://res.cloudinary.com/dguy8qpzi/image/upload/v1631443916/Rectangle_39-removebg-preview_ptstqh.png',
      descp: "Transform your smart devices to intelligent communicators "),
  OnboardingModel(
      title: 'Take the first steps',
      image:
          'https://res.cloudinary.com/dguy8qpzi/image/upload/v1631444074/firstSteps-removebg-preview_abogdt.png',
      descp:
          "So many options for you to choose from. Make your life easier by just a tap "),
  OnboardingModel(
      title: 'Make it your own',
      image:
          'https://res.cloudinary.com/dguy8qpzi/image/upload/v1631444144/make-your-own-removebg-preview_eefoag.png',
      descp:
          "Personalize Donna to fit your needs. Add your most used phrases and contact people you might need in distress"),
];
