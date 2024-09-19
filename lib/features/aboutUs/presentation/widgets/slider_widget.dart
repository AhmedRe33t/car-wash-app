import 'package:carousel_slider/carousel_slider.dart';
import 'package:carwashing/core/utils/app_assets.dart';
import 'package:carwashing/features/aboutUs/presentation/widgets/custom_slider_text.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({
    super.key,
  });

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int _currentIndex = 0;
  bool _isImageSliderChanging = false;

  bool _isTextSliderChanging = false;

  final CarouselSliderController _imageController = CarouselSliderController();
  final CarouselSliderController _textController = CarouselSliderController();

  final List<String> _imagePaths = [
  Assets.imagesPerson,
  Assets.imagesCoolestCarsFeature,
  Assets.imagesTruck
  ];

  final List<Widget> widgetsWithtexts = [
    const CustomSliderText(
      title: 'Unmatched Quality and Attention to Detail:',
      subTitle:
          'We pride ourselves on delivering an exceptional car wash experience with unmatched quality and attention to detail. Our team of trained professionals uses the latest techniques and eco- friendly products to ensure that your vehicle receives the care it deserves.',
    ),
    const CustomSliderText(
      title: 'Customizable Services to Suit Your Needs:',
      subTitle:
          'Every car has unique needs, which is why our car wash app offers customizable services to suit your specific requirements. Whether you need a quick exterior wash or a comprehensive package that includes waxing, polishing, and interior detailing, our app allows you to select the services that best fit your needs and budget.',
    ),
    const CustomSliderText(
      title: 'Convenient Car Care at Your Fingertips:',
      subTitle:
          'At our car wash app, we understand the importance of convenience in your busy life. We have developed a user-friendly mobile application that allows you to schedule and manage your car wash appointments with just a few taps on your phone.',
    ),
  ];

  void _onImageSliderChange(int index) {
    if (!_isTextSliderChanging) {
      _isImageSliderChanging = true;
      _textController.animateToPage(index);
    }
    setState(() {
      _currentIndex = index;
    });
    _isImageSliderChanging = false;
  }

  void _onTextSliderChange(int index) {
    if (!_isImageSliderChanging) {
      _isTextSliderChanging = true;
      _imageController.animateToPage(index);
    }
    setState(() {
      _currentIndex = index;
    });
    _isTextSliderChanging = false;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final aspectRatio = width / height;

    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(
              height: height * .02,
            ),
            CarouselSlider.builder(
              carouselController: _imageController,
              options: CarouselOptions(
                height: height * .4,
                aspectRatio: aspectRatio,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (index, reason) {
                  _onImageSliderChange(index);
                },
                scrollDirection: Axis.horizontal,
              ),
              itemCount: _imagePaths
                  .length, // Updated to reflect actual number of images
              itemBuilder: (BuildContext context, int index, int realIndex) =>
                  ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  _imagePaths[index], // Use the correct image path
                  fit: BoxFit.fill,
                  width: width * .94,
                ),
              ),
            ),
            SizedBox(
              height: height * .01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_imagePaths.length, (index) {
                return Container(
                  width: _currentIndex == index ? 32.0 : 12.0,
                  height: 10.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: _currentIndex == index
                        ? const Color.fromARGB(255, 248, 152, 62)
                        : const Color.fromARGB(255, 52, 80, 139),
                  ),
                );
              }),
            ),
            SizedBox(
              height: height * .01,
            ),
            CarouselSlider.builder(
              carouselController: _textController,
              options: CarouselOptions(
                height: height * .4,
                aspectRatio: aspectRatio,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (index, reason) {
                  _onTextSliderChange(index);
                },
                scrollDirection: Axis.horizontal,
              ),
              itemCount: widgetsWithtexts
                  .length, // Updated to reflect actual number of texts
              itemBuilder: (BuildContext context, int index, int realIndex) =>
                  Center(
                child: Container(
                  child: widgetsWithtexts[index], // Use the correct text data
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
