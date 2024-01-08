import 'package:agriplant/utils/utils.dart';
import 'package:agriplant/view/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resourses/img_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  moveToNext() {
    Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(
        builder: (context) => const DashboardScreen(),
      ),
      (route) => false,
    );
    // Future.delayed(const Duration(milliseconds: 1500), () {
    //
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 380),
                child: Image.asset(onBoardingImg),
              ),
              const Spacer(),
              Text('Welcome to Agriplant',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  "Get your agriculture products from the comfort of your home. You're just a few clicks away from your favorite products.",
                  textAlign: TextAlign.center,
                ),
              ),
              /**/
              FilledButton.tonalIcon(
                onPressed: () {
                  moveToNext();
                },
                icon: const Icon(CupertinoIcons.arrow_right),
                label: const Text("Login As Guest"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
