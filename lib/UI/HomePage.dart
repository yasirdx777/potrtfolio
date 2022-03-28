import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../Model/Method.dart';
import '../Widget/AppBarTitle.dart';
import '../Widget/CustomText.dart';
import '../Widget/MainTiitle.dart';
import 'About.dart';
import 'FeatureProject.dart';
import 'Work.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Method method = Method();
  AutoScrollController _autoScrollController;
  final scrollDirection = Axis.vertical;

  bool isExpaned = true;

  bool get _isAppBarExpanded {
    return _autoScrollController.hasClients &&
        _autoScrollController.offset > (160 - kToolbarHeight);
  }

  @override
  void initState() {
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    )..addListener(
        () => _isAppBarExpanded
            ? isExpaned != false
                ? setState(
                    () {
                      isExpaned = false;
                      print('setState is called');
                    },
                  )
                : {}
            : isExpaned != true
                ? setState(() {
                    print('setState is called');
                    isExpaned = true;
                  })
                : {},
      );
    super.initState();
  }

  Future _scrollToIndex(int index) async {
    await _autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _autoScrollController.highlight(index);
  }

  Widget _wrapScrollTag({int index, Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff0A192F),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        primary: true,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //Mavigation Bar
            Container(
              height: size.height * 0.08,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Container(
                      height: size.height * 0.05,
                      width: size.height * 0.05,
                      child: Image(
                        fit: BoxFit.contain,
                        image: AssetImage("images/yrlogo.jpg"),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: DefaultTabController(
                          length: 4,
                          child: TabBar(
                            indicatorColor: Colors.transparent,
                            onTap: (index) async {
                              _scrollToIndex(index);
                            },
                            tabs: [
                              Tab(
                                child: AppBarTitle(
                                  text: 'About',
                                ),
                              ),
                              Tab(
                                child: AppBarTitle(
                                  text: 'Experience',
                                ),
                              ),
                              Tab(
                                child: AppBarTitle(
                                  text: 'Project',
                                ),
                              ),
                              Tab(
                                child: AppBarTitle(
                                  text: 'Contact me',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: InkWell(
                        onTap: () {
                          method.launchURL("https://resume.io/r/ZJwT0CWBO");
                        },
                        hoverColor: Color(0xff64FFDA).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4.0),
                        child: Container(
                          alignment: Alignment.center,
                          height: size.height * 0.08,
                          width: size.width * 0.14,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xff64FFDA),
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            "Resume",
                            style: TextStyle(
                              color: Color(0xff64FFDA),
                              letterSpacing: 2.75,
                              wordSpacing: 1.0,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Row(
              children: [
                //Social Icon
                Container(
                  width: size.width * 0.09,
                  height: size.height - 82,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          icon: FaIcon(FontAwesomeIcons.github),
                          color: Color(0xffffA8B2D1),
                          iconSize: 16.0,
                          onPressed: () {
                            method.launchURL("https://github.com/yasirdx777");
                          }),
                      IconButton(
                          icon: FaIcon(FontAwesomeIcons.instagram),
                          color: Color(0xffffA8B2D1),
                          iconSize: 16.0,
                          onPressed: () {
                            method.launchURL(
                                "https://www.instagram.com/yasirdx777");
                          }),
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.linkedin),
                        color: Color(0xffffA8B2D1),
                        onPressed: () {
                          method.launchURL(
                              "https://www.linkedin.com/in/yasir-romaya-5099b9108");
                        },
                        iconSize: 16.0,
                      ),
                      IconButton(
                          icon: Icon(Icons.call),
                          color: Color(0xffffA8B2D1),
                          iconSize: 16.0,
                          onPressed: () {
                            method.launchCaller();
                          }),
                      IconButton(
                          icon: Icon(Icons.mail),
                          color: Color(0xffffA8B2D1),
                          iconSize: 16.0,
                          onPressed: () {
                            method.launchEmail();
                          }),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                          height: size.height * 0.20,
                          width: 2,
                          color: Colors.grey.withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: size.height - 82,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CustomScrollView(
                        controller: _autoScrollController,
                        slivers: <Widget>[
                          SliverList(
                              delegate: SliverChildListDelegate([
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: size.height * .06,
                                ),
                                CustomText(
                                  text: "Hi, my name is",
                                  textsize: 16.0,
                                  color: Color(0xff41FBDA),
                                  letterSpacing: 3.0,
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),
                                CustomText(
                                  text: "Yasir Romaya.",
                                  textsize: 68.0,
                                  color: Color(0xffCCD6F6),
                                  fontWeight: FontWeight.w900,
                                ),
                                SizedBox(
                                  height: 4.0,
                                ),
                                CustomText(
                                  text:
                                      "I build things for the iOS and Android.",
                                  textsize: 56.0,
                                  color: Color(0xffCCD6F6).withOpacity(0.6),
                                  fontWeight: FontWeight.w700,
                                ),
                                SizedBox(
                                  height: size.height * .04,
                                ),
                                Wrap(
                                  children: [
                                    Text(
                                      "I'm a mobile application developer based in Suli, IQ specializing in \nbuilding (and occasionally designing) exceptional applications.",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16.0,
                                        letterSpacing: 2.75,
                                        wordSpacing: 0.75,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * .12,
                                ),

                                //get in tuch text
                                InkWell(
                                  onTap: () {
                                    method.launchEmail();
                                  },
                                  hoverColor:
                                      Color(0xff64FFDA).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(4.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: size.height * 0.08,
                                    width: size.width * 0.14,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xff64FFDA),
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Text(
                                      "Get In Touch",
                                      style: TextStyle(
                                        color: Color(0xff64FFDA),
                                        letterSpacing: 2.75,
                                        wordSpacing: 1.0,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: size.height * 0.20,
                                ),
                              ],
                            ),

                            //About Me
                            _wrapScrollTag(
                              index: 0,
                              child: About(),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),

                            //Where I've Worked
                            _wrapScrollTag(index: 1, child: Work()),
                            SizedBox(
                              height: size.height * 0.10,
                            ),

                            //Some Things I've Built Main Project
                            _wrapScrollTag(
                              index: 2,
                              child: Column(
                                children: [
                                  MainTiitle(
                                    number: "0.3",
                                    text: "Some Things I've Built",
                                  ),
                                  SizedBox(
                                    height: size.height * 0.04,
                                  ),
                                  FeatureProject(
                                    imagePath: "images/iq_digicare.jpg",
                                    onStoreTab: () {
                                      method.launchURL(
                                          "https://apps.apple.com/us/app/iq-digicare/id1548680750");
                                    },
                                    onYouTubeTab: () {
                                      method.launchURL(
                                          "https://youtu.be/VFIVBJGrRoY");
                                    },
                                    projectDesc:
                                        "ISP Selfcare System\n\n-Flutter\n-Map-Internet speed test\n-Calendar manager\n-QR scanner\n-Custom painter\n-Video player\n-In app messages\n-Deeplink\n-Clean architecture",
                                    projectTitle: "iQ Digicare",
                                  ),

                                  FeatureProject(
                                    imagePath: "images/m_d_s.jpg",
                                    onStoreTab: () {
                                      method.launchURL(
                                          "https://apps.apple.com/us/app/m-d-s/id1546895007");
                                    },
                                    onYouTubeTab: () {
                                      method.launchURL(
                                          "https://youtu.be/lIKKDZ2VJC8");
                                    },
                                    projectDesc:
                                        "Medical Devices Store\n\n-Swift\n-Storyboard\n-MapKit\n-Social\n-File manager\n-Realm\n-MVC",
                                    projectTitle: "M.D.S",
                                  ),

                                  FeatureProject(
                                    imagePath: "images/rcell.jpg",
                                    onStoreTab: () {
                                      method.launchURL(
                                          "https://play.google.com/store/apps/details?id=me.rcell.my&hl=en&gl=US");
                                    },
                                    onStoreTabIcon: FontAwesomeIcons.googlePlay,
                                    projectDesc:
                                        "4G Quota App\n\n-Flutter\n-QR scanner\n-Custom painter\n-In app messages\n-MVC",
                                    projectTitle: "Rcell",
                                  ),

                                  FeatureProject(
                                    imagePath: "images/r_g.jpg",
                                    onStoreTab: () {
                                      method.launchURL(
                                          "https://apps.apple.com/ae/app/royal-galaxy-restaurant/id1518417047?l=en");
                                    },
                                    onYouTubeTab: () {
                                      method.launchURL(
                                          "https://youtu.be/7dKQAt5srIU");
                                    },
                                    projectDesc:
                                        "Food Delivery System\n\n-Swift\n-Storyboard\n-MapKit\n-OTP Auth\n-In app messages\n-Realm\n-MVC",
                                    projectTitle: "Royal Galaxy",
                                  ),
                                  //ff
                                  FeatureProject(
                                    imagePath: "images/weeana_cinema.jpg",
                                    onStoreTab: () {
                                      method.launchURL(
                                          "https://apps.apple.com/us/app/weeana-cinema/id1498299394");
                                    },
                                    onYouTubeTab: () {
                                      method.launchURL(
                                          "https://youtu.be/mXIjgM3dPSc");
                                    },
                                    projectDesc:
                                        "Media Stream Platfrom\n\n-Swift\n-UIKit\n-SnapKit\n-AVPlayerLayer\n-File manager\n-Realm\n-VIPER",
                                    projectTitle: "Weeana Cinema",
                                  ),

                                  FeatureProject(
                                    imagePath: "images/weeana_tv.jpg",
                                    onStoreTab: () {
                                      method.launchURL(
                                          "https://play.google.com/store/apps/details?id=com.iqnetwork.dx.weeanatv&hl=en&gl=US");
                                    },
                                    onStoreTabIcon: FontAwesomeIcons.googlePlay,
                                    onYouTubeTab: () {
                                      method.launchURL(
                                          "https://youtube.com/shorts/omsiJM4hhCo?feature=share");
                                    },
                                    projectDesc:
                                        "TV Channels Platfrom\n\n-Kotlin\n-Java\n-Nav graph\n-Exoplayer\n-HLS\n-Chromecast\n-Room\n-MVC",
                                    projectTitle: "Weeana TV",
                                  ),

                                  MainTiitle(
                                    number: "0.4",
                                    text: "Open Source Packages",
                                  ),

                                  SizedBox(
                                    height: size.height * 0.04,
                                  ),

                                  FeatureProject(
                                    imagePath: "images/spb.gif",
                                    onStoreTab: () {
                                      method.launchURL(
                                          "https://pub.dev/packages/square_progress_bar");
                                    },
                                    onStoreTabIcon: FontAwesomeIcons.github,
                                    projectDesc:
                                        "Progress bar package for Flutter\n\n-Custom painter\n-Tween animation",
                                    projectTitle: "square_progress_bar",
                                  ),

                                  //other Projects
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 6.0,
                            ),

                            //Get In Touch
                            _wrapScrollTag(
                              index: 3,
                              child: Column(
                                children: [
                                  Container(
                                    height: size.height * 0.68,
                                    width:
                                        MediaQuery.of(context).size.width - 100,
                                    // color: Colors.orange,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          text: "0.4 What's Next?",
                                          textsize: 16.0,
                                          color: Color(0xff41FBDA),
                                          letterSpacing: 3.0,
                                        ),
                                        SizedBox(
                                          height: 16.0,
                                        ),
                                        CustomText(
                                          text: "Get In Touch",
                                          textsize: 42.0,
                                          color: Colors.white,
                                          letterSpacing: 3.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        SizedBox(
                                          height: 16.0,
                                        ),
                                        Wrap(
                                          children: [
                                            Text(
                                              "Although I'm always open to reply whether you have a question or just want to say hi, I'll try my \nbest to get back to you!",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                                letterSpacing: 0.75,
                                                fontSize: 17.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 32.0,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            method.launchEmail();
                                          },
                                          hoverColor: Color(0xff64FFDA)
                                              .withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: size.height * 0.08,
                                            width: size.width * 0.14,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xff64FFDA),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            child: Text(
                                              "Say Hello",
                                              style: TextStyle(
                                                color: Color(0xff64FFDA),
                                                letterSpacing: 2.75,
                                                wordSpacing: 1.0,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                  //Footer
                                  Container(
                                    alignment: Alignment.center,
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width:
                                        MediaQuery.of(context).size.width - 100,
                                    //color: Colors.white,
                                    child: Text(
                                      "Designed & Built by Yasir Romaya 💙 Flutter",
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.4),
                                        letterSpacing: 1.75,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ])),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.07,
                  height: MediaQuery.of(context).size.height - 82,
                  //color: Colors.orange,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RotatedBox(
                        quarterTurns: 45,
                        child: Text(
                          "yasir.romaya@gmail.com",
                          style: TextStyle(
                            color: Colors.grey.withOpacity(0.6),
                            letterSpacing: 3.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                          height: 100,
                          width: 2,
                          color: Colors.grey.withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
