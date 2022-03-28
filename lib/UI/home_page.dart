import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../Model/Method.dart';
import '../widget/app_bar_title.dart';
import '../widget/custom_text.dart';
import '../widget/main_tiitle.dart';
import 'about.dart';
import 'feature_project.dart';
import 'work.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Method method = Method();
  late AutoScrollController _autoScrollController;
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
                      debugPrint('setState is called');
                    },
                  )
                : {}
            : isExpaned != true
                ? setState(() {
                    debugPrint('setState is called');
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

  Widget _wrapScrollTag({int? index, Widget? child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index ?? 0,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff0A192F),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        primary: true,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //Mavigation Bar
            SizedBox(
              height: size.height * 0.08,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                      width: size.height * 0.05,
                      child: const Image(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/images/yrlogo.jpg"),
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
                            tabs: const [
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
                        hoverColor: const Color(0xff64FFDA).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4.0),
                        child: Container(
                          alignment: Alignment.center,
                          height: size.height * 0.08,
                          width: size.width * 0.14,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xff64FFDA),
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: const Text(
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
                          icon: const FaIcon(FontAwesomeIcons.github),
                          color: const Color(0xffffA8B2D1),
                          iconSize: 16.0,
                          onPressed: () {
                            method.launchURL("https://github.com/yasirdx777");
                          }),
                      IconButton(
                          icon: const FaIcon(FontAwesomeIcons.instagram),
                          color: const Color(0xffffA8B2D1),
                          iconSize: 16.0,
                          onPressed: () {
                            method.launchURL(
                                "https://www.instagram.com/yasirdx777");
                          }),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.linkedin),
                        color: Color(0xffffA8B2D1),
                        onPressed: () {
                          method.launchURL(
                              "https://www.linkedin.com/in/yasir-romaya-5099b9108");
                        },
                        iconSize: 16.0,
                      ),
                      IconButton(
                          icon: const Icon(Icons.call),
                          color: const Color(0xffffA8B2D1),
                          iconSize: 16.0,
                          onPressed: () {
                            method.launchCaller();
                          }),
                      IconButton(
                          icon: const Icon(Icons.mail),
                          color: const Color(0xffffA8B2D1),
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
                                const CustomText(
                                  text: "Hi, my name is",
                                  textsize: 16.0,
                                  color: Color(0xff41FBDA),
                                  letterSpacing: 3.0,
                                ),
                                const SizedBox(
                                  height: 6.0,
                                ),
                                const CustomText(
                                  text: "Yasir Romaya.",
                                  textsize: 68.0,
                                  color: Color(0xffCCD6F6),
                                  fontWeight: FontWeight.w900,
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                CustomText(
                                  text:
                                      "I build things for the iOS and Android.",
                                  textsize: 56.0,
                                  color:
                                      const Color(0xffCCD6F6).withOpacity(0.6),
                                  fontWeight: FontWeight.w700,
                                ),
                                SizedBox(
                                  height: size.height * .04,
                                ),
                                Wrap(
                                  children: const [
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
                                      const Color(0xff64FFDA).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(4.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: size.height * 0.08,
                                    width: size.width * 0.14,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0xff64FFDA),
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: const Text(
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
                            _wrapScrollTag(index: 1, child: const Work()),
                            SizedBox(
                              height: size.height * 0.10,
                            ),

                            //Some Things I've Built Main Project
                            _wrapScrollTag(
                              index: 2,
                              child: Column(
                                children: [
                                  const MainTiitle(
                                    number: "0.3",
                                    text: "Some Things I've Built",
                                  ),
                                  SizedBox(
                                    height: size.height * 0.04,
                                  ),
                                  FeatureProject(
                                    imagePath: "assets/images/iq_digicare.jpg",
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
                                    imagePath: "assets/images/m_d_s.jpg",
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
                                    imagePath: "assets/images/rcell.jpg",
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
                                    imagePath: "assets/images/r_g.jpg",
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
                                    imagePath:
                                        "assets/images/weeana_cinema.jpg",
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
                                    imagePath: "assets/images/weeana_tv.jpg",
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

                                  const MainTiitle(
                                    number: "0.4",
                                    text: "Open Source Packages",
                                  ),

                                  SizedBox(
                                    height: size.height * 0.04,
                                  ),

                                  FeatureProject(
                                    imagePath: "assets/images/spb.gif",
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

                            const SizedBox(
                              height: 6.0,
                            ),

                            //Get In Touch
                            _wrapScrollTag(
                              index: 3,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: size.height * 0.68,
                                    width:
                                        MediaQuery.of(context).size.width - 100,
                                    // color: Colors.orange,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const CustomText(
                                          text: "0.4 What's Next?",
                                          textsize: 16.0,
                                          color: Color(0xff41FBDA),
                                          letterSpacing: 3.0,
                                        ),
                                        const SizedBox(
                                          height: 16.0,
                                        ),
                                        const CustomText(
                                          text: "Get In Touch",
                                          textsize: 42.0,
                                          color: Colors.white,
                                          letterSpacing: 3.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        const SizedBox(
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
                                        const SizedBox(
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
                                            child: const Text(
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
