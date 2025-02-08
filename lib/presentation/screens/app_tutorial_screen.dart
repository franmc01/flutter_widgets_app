import 'package:flutter/material.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imgUrl;

  SlideInfo(this.title, this.caption, this.imgUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Look at food',
      'Aliquip id ea in ex et pariatur dolor officia Lorem veniam reprehenderit in sit.',
      'assets/1.png'),
  SlideInfo(
      'Look at meals',
      'Ullamco excepteur aute non laboris veniam tempor sint sit esse.',
      'assets/2.png'),
  SlideInfo(
      'Look at juices',
      'Ipsum aliqua ad ad reprehenderit Lorem laboris velit laboris officia enim qui.',
      'assets/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  // final PageController pageViewController = PageController();
  bool endReached = false;

  // @override
  // void initState() {
  //   super.initState();

  //   pageViewController.addListener(() {
  //     final page = pageViewController.page ?? 0;
  //     if(!endReached && page >= (slides.length - 1.5)){
  //       setState(() {
  //         endReached = true;
  //       });
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   pageViewController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            // controller: pageViewController,
            onPageChanged: (index) {
              setState(() {
                endReached = index == slides.length - 1;
              });
            },
            physics: BouncingScrollPhysics(),
            children: [
              ...slides.map((slideInfo) => _Slide(slideInfo: slideInfo))
            ],
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(onPressed: () {}, child: Text('Skip'))),
          // endReached
          //     ? Positioned(
          //         bottom: 50,
          //         right: 30,
          //         child: FilledButton(onPressed: () {}, child: Text('Start')))
          //     : SizedBox()
          Visibility(
            visible: endReached,
            child: Positioned(
              bottom: 50,
              right: 30,
              child: FilledButton(onPressed: () {}, child: Text('Start')),
            ),
          )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final SlideInfo slideInfo;

  const _Slide({required this.slideInfo});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Center(
        child: Column(
          // spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image.asset(slideInfo.imgUrl)
            Image(image: AssetImage(slideInfo.imgUrl)),
            SizedBox(height: 20),
            Text(slideInfo.title, style: titleStyle.titleLarge),
            SizedBox(height: 10),
            Text(slideInfo.caption, style: titleStyle.bodyMedium)
          ],
        ),
      ),
    );
  }
}
