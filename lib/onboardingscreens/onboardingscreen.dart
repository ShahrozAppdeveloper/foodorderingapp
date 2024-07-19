import 'package:flutter/material.dart';
import 'package:foodorderingapp/authscreens/signup.dart';
import 'package:foodorderingapp/model/onboardmodelclass.dart';
import 'package:foodorderingapp/onboardingscreens/components/dotindicator.dart';
import 'package:foodorderingapp/onboardingscreens/components/onboaringcontent.dart';

class Onboardingscreen extends StatefulWidget {
  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  late PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void nextPageOrDashboard() {
    if (pageIndex == demolist.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Signup()),
      );
    } else {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: demolist.length,
                onPageChanged: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => Onboaringcontent(
                  image: demolist[index].image,
                  title: demolist[index].title,
                  description: demolist[index].description,
                  titleStyle: demolist[index].titleStyle, // Pass titleStyle here
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                demolist.length,
                    (index) => Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Dotindicator(
                    isActive: index == pageIndex,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: nextPageOrDashboard,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    child: Icon(Icons.arrow_right_alt_outlined, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
