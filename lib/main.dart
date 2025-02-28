import 'package:coding_test/components/buttons/rounded_button.dart';
import 'package:coding_test/home.dart';
import 'package:coding_test/model/onboarding_item.dart';
import 'package:coding_test/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: false,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = PageController();

  final List<OnBoardItem> _pages = [
    OnBoardItem(
      image: "assets/icons/cup.png",
      title: "Let's meet our summer coffee drinks",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
    OnBoardItem(
      image: "assets/icons/cup.png",
      title: "Let's meet our summer coffee drinks 2",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
    OnBoardItem(
      image: "assets/icons/cup.png",
      title: "Let's meet our summer coffee drinks 3",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
  ];

  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _onButtonNextPressed() {
    _currentPage < _pages.length - 1
        ? _controller.nextPage(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInQuint,
          )
        : Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              child: PageView.builder(
                controller: _controller,
                onPageChanged: _onPageChanged,
                itemCount: _pages.length,
                itemBuilder: (contex, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child: Image.asset(
                            _pages[index].image,
                            width: 250,
                            height: 250,
                          ),
                        ),
                        Text(
                          _pages[index].title,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          _pages[index].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              child: SmoothPageIndicator(
                controller: _controller,
                count: _pages.length,
                onDotClicked: (index) {},
                effect: WormEffect(
                  spacing: 8.0,
                  dotWidth: 12.0,
                  dotHeight: 12.0,
                  strokeWidth: 1.5,
                  dotColor: Colors.grey,
                  activeDotColor: HexColor('04764E'),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: RoundedButton(
                onPress: _onButtonNextPressed,
                backgroundColor: HexColor('04764E'),
                textButton:
                    _currentPage == _pages.length - 1 ? "GET STARTED" : "NEXT",
                textColor: Colors.white,
                borderRadius: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
