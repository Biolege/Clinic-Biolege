import '../../app/size_configuration.dart';
import '../../widgets/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SkOnboardingModel {
  String title;
  String description;
  Color titleColor;
  Color descripColor;
  String imagePath;

  SkOnboardingModel({
    @required this.title,
    @required this.description,
    @required this.imagePath,
    @required this.titleColor,
    @required this.descripColor,
  });
}

class SKOnboardingScreen extends StatefulWidget {
  final List<SkOnboardingModel> pages;
  final Color bgColor;
  final Color themeColor;
  final ValueChanged<String> getStartedClicked;

  SKOnboardingScreen({
    Key key,
    @required this.pages,
    @required this.bgColor,
    @required this.themeColor,
    @required this.getStartedClicked,
  }) : super(key: key);

  @override
  SKOnboardingScreenState createState() => SKOnboardingScreenState();
}

class SKOnboardingScreenState extends State<SKOnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < widget.pages.length; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  List<Widget> buildOnboardingPages() {
    final children = <Widget>[];

    for (int i = 0; i < widget.pages.length; i++) {
      children.add(FadeInDTU(0.5, _showPageData(widget.pages[i])));
    }
    return children;
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? widget.themeColor : Color(0xFF929794),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: widget.bgColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: SizeConfig.screenHeight * 0.8,
                    color: Colors.transparent,
                    child: PageView(
                        physics: ClampingScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: buildOnboardingPages()),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  _currentPage != widget.pages.length - 1
                      ? Expanded(
                          child: Align(
                            alignment: FractionalOffset.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 20, bottom: 10),
                              child: FloatingActionButton(
                                backgroundColor: widget.bgColor,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: widget.themeColor,
                                ),
                                onPressed: () {
                                  _pageController.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                      : Text(''),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == widget.pages.length - 1
          ? _showGetStartedButton()
          : Text(''),
    );
  }

  Widget _showPageData(SkOnboardingModel page) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(page.imagePath),
              height: getProportionateScreenHeight(300),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(50.0)),
          Text(
            page.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: page.descripColor,
              fontSize: 16,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(10.0)),
          Text(
            page.title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: page.titleColor,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _showGetStartedButton() {
    final GestureDetector loginButtonWithGesture = new GestureDetector(
      onTap: _getStartedTapped,
      child: new Container(
        height: 50.0,
        decoration: new BoxDecoration(
            color: widget.themeColor,
            borderRadius: new BorderRadius.all(
              Radius.circular(500.0),
            )),
        child: new Center(
          child: new Text(
            'Get Started',
            style: new TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );

    return new BottomSheet(
      onClosing: () => {},
      builder: (context) => Padding(
        padding: const EdgeInsets.only(
            left: 60.0, right: 60.0, top: 5.0, bottom: 30.0),
        child: loginButtonWithGesture,
      ),
    );
  }

  void _getStartedTapped() {
    widget.getStartedClicked("Get Started Tapped");
  }
}
