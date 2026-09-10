import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_application/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_theme.dart';
import '../../widgets/onboarding_dots.dart';
import 'onboarding_content.dart';
import 'onboarding_data.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = r'\onboarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;
  int currentPage = 0;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool("onboarding_completed", true);

    Navigator.pushReplacementNamed(
      context,
      HomeScreen.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() => currentPage = index);
              },
              itemCount: pages_data.length,
              itemBuilder: (context, index) {
                return OnboardingContent(
                  image: pages_data[index]["image"]!,
                  title: (pages_data[index]["title"]!),
                  desc: pages_data[index]["desc"]?? "",
                );
              },
            ),

        Positioned(
          bottom: 30,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              currentPage == 0
                  ? SizedBox(width: 60)
                  : TextButton(
                onPressed: () => _controller.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
                child: Text("Back",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppTheme.primaryColor),
                ),
              ),

              Row(
                children: List.generate(
                  pages_data.length,
                  (index) => DotIndicator(
                    isActive: currentPage == index,
                  ),
                ),
              ),

              currentPage == pages_data.length - 1
                  ? TextButton(
                onPressed: _completeOnboarding,
                child: Text("Finish",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppTheme.primaryColor),
                ),
              )
                  : TextButton(
                onPressed: () => _controller.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
                child: Text("Next",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppTheme.primaryColor),
                ),
              ),
            ],
          ),
        ),
          ],
        ),
      ),
    );
  }
}