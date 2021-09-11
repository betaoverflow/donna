import 'package:donna/model/onboardingModel.dart';
import 'package:donna/screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:donna/home.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _controller,
            itemCount: onboardingContent.length,
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, i) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Image.network(
                      onboardingContent[i].image,
                      height: 400,
                    ),
                    Text(
                      onboardingContent[i].title,
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      onboardingContent[i].descp,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                onboardingContent.length, (index) => dots(index, context)),
          ),
        ),
        Container(
          height: 60,
          margin: EdgeInsets.all(40),
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          child: TextButton(
            child: Text(
              currentIndex == onboardingContent.length - 1 ? 'Done' : 'Next',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            onPressed: () {
              if (currentIndex == onboardingContent.length - 1) {
                Navigator.push(
                    // context, MaterialPageRoute(builder: (_) => LoginPage()));
                    context, MaterialPageRoute(builder: (_) => Home()));
              }
              _controller.nextPage(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceIn);
            },
          ),
        )
      ],
    ));
  }

  Container dots(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 20 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currentIndex == index
              ? Colors.black
              : Theme.of(context).primaryColor),
    );
  }
}
