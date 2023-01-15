import 'package:flutter/material.dart';
import 'package:news_app/global/common/common_utils.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => widget.child!),
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonUtils.kBlackColor,
      body: Center(
        child: Text(
          "Welcome to News App",
          style: CommonUtils.themeTextStyle(context,
              fsize: CommonUtils.kextraLargeFont(context),
              fweight: FontWeight.w900),
        ),
      ),
    );
  }
}
