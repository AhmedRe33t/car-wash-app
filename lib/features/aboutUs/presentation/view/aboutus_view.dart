import 'package:carwashing/features/aboutUs/presentation/widgets/custom_app_bar.dart';
import 'package:carwashing/features/aboutUs/presentation/widgets/slider_widget.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(child: SliderWidget()),
    );
  }
}
