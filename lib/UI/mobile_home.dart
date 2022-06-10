import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Model/Method.dart';
import '../widget/custom_text.dart';
import '../widget/mobile_project.dart';
import '../widget/mobile_work.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({Key? key}) : super(key: key);

  @override
  _MobileHomeState createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  Widget technology(BuildContext context, String text) {
    return Row(
      children: [
        Icon(
          Icons.skip_next,
          color: const Color(0xff64FFDA).withOpacity(0.6),
          size: 14.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.04,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xff717C99),
            letterSpacing: 1.75,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Method method = Method();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff0A192F),
      appBar: AppBar(
        backgroundColor: const Color(0xff0A192F),
        elevation: 0.0,
        centerTitle: false,
        title: const SizedBox(
          height: 60,
          width: 60,
          child: Image(
            fit: BoxFit.contain,
            image: AssetImage("assets/images/yrlogo.jpg"),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 23, top: 6, bottom: 6),
            child: InkWell(
              onTap: () {
                method.launchURL(
                    "https://drive.google.com/file/d/17PVvdo9maS8OwwquSGePOVN3oohjMZW3/view");
              },
              hoverColor: const Color(0xff64FFDA).withOpacity(0.2),
              borderRadius: BorderRadius.circular(4.0),
              child: Container(
                alignment: Alignment.center,
                height: 56.0,
                width: 160.0,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              const CustomText(
                text: "Hi, my name is",
                textsize: 16.0,
                color: Color(0xff41FBDA),
                letterSpacing: 3.0,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              const CustomText(
                text: "Yasir Romaya.",
                textsize: 52.0,
                color: Color(0xffCCD6F6),
                fontWeight: FontWeight.w900,
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              CustomText(
                text: "I build things for the iOS and Android.",
                textsize: 42.0,
                color: const Color(0xffCCD6F6).withOpacity(0.6),
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Wrap(
                  children: const [
                    Text(
                      "I'm a mobile application developer based in Suli, IQ specializing in building (and occasionally designing) exceptional applications.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                        letterSpacing: 2.75,
                        wordSpacing: 0.75,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.06,
              ),

              InkWell(
                onTap: () {
                  method.launchEmail();
                },
                hoverColor: const Color(0xff64FFDA).withOpacity(0.2),
                borderRadius: BorderRadius.circular(4.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 56.0,
                  width: 160.0,
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
                height: size.height * 0.08,
              ),

              //About me
              FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: size.width,
                  //color: Colors.purple,
                  child: Column(
                    children: [
                      //About me title
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CustomText(
                            text: "01.",
                            textsize: 20.0,
                            color: Color(0xff61F9D5),
                            fontWeight: FontWeight.w700,
                          ),
                          const SizedBox(
                            width: 12.0,
                          ),
                          const CustomText(
                            text: "About Me",
                            textsize: 26.0,
                            color: Color(0xffCCD6F6),
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Container(
                            width: size.width / 4,
                            height: 1.10,
                            color: const Color(0xff303C55),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: size.height * 0.07,
                      ),

                      //About me desc
                      Wrap(
                        children: const [
                          CustomText(
                            text:
                                "Hello! I'm Yasir, A mobile application developer based in Suli, IQ.\nI enjoy creating things that live on the internet, whether that be applications, open source packages. My goal is to always build products that provide pixel-perfect, performant experiences.\n",
                            textsize: 16.0,
                            color: Color(0xff828DAA),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.75,
                          ),
                          CustomText(
                            text:
                                "Shortly currently, I am a lead mobile dev at iQ Group tech company, as well as doing freelancing where I work on a wide variety of interesting and meaningful projects.\n",
                            textsize: 16.0,
                            color: Color(0xff828DAA),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.75,
                          ),
                          CustomText(
                            text:
                                "Here are a few technologies I've been working with recently:\n\n",
                            textsize: 16.0,
                            color: Color(0xff828DAA),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.75,
                          ),
                        ],
                      ),

                      SizedBox(
                        height: size.height * 0.06,
                      ),

                      Container(
                        width: size.width,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                technology(context, "Dart"),
                                technology(context, "Swift"),
                                technology(context, "Kotlin"),
                                technology(context, "Java"),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                technology(context, "Python"),
                                technology(context, "UI/UX"),
                                technology(context, "Gitflow"),
                                technology(context, "CI/CD"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 0.08,
              ),

              //Image
              Center(
                child: SizedBox(
                  height: size.height * 0.6,
                  width: size.width * 0.7,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 50,
                        right: 20,
                        left: 50.0,
                        child: Card(
                          color: const Color(0xff61F9D5),
                          child: Container(
                            margin: const EdgeInsets.all(2.75),
                            height: size.height * 0.45,
                            width: size.width * 0.66,
                            color: const Color(0xff0A192F),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.5,
                        width: size.width * 0.6,
                        child: const Image(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/me.jpg"),
                        ),
                      ),
                      Container(
                        height: size.height * 0.5,
                        width: size.width * 0.6,
                        color: const Color(0xff61F9D5).withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
              ),

              //Where I've Worked title
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomText(
                    text: "02.",
                    textsize: 20.0,
                    color: Color(0xff61F9D5),
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  const CustomText(
                    text: "Where I've Worked",
                    textsize: 26.0,
                    color: Color(0xffCCD6F6),
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  Container(
                    width: size.width * 0.08,
                    height: 1.10,
                    color: const Color(0xff303C55),
                  ),
                ],
              ),

              const MobileWork(),

              SizedBox(
                height: size.height * 0.07,
              ),

              //Some Things I've Built title
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomText(
                    text: "03.",
                    textsize: 20.0,
                    color: Color(0xff61F9D5),
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  const CustomText(
                    text: "Some Things I've Built",
                    textsize: 26.0,
                    color: Color(0xffCCD6F6),
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  Container(
                    width: size.width * 0.04,
                    height: 1.10,
                    color: const Color(0xff303C55),
                  ),
                ],
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                onStoreTab: () {
                  method.launchURL(
                      "https://apps.apple.com/us/app/iq-digicare/id1548680750");
                },
                onYouTubeTab: () {
                  method.launchURL("https://youtu.be/VFIVBJGrRoY");
                },
                image: "assets/images/iq_digicare_m.jpg",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                onStoreTab: () {
                  method.launchURL(
                      "https://apps.apple.com/us/app/m-d-s/id1546895007");
                },
                onYouTubeTab: () {
                  method.launchURL("https://youtu.be/lIKKDZ2VJC8");
                },
                image: "assets/images/m_d_s_m.jpg",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                onStoreTab: () {
                  method.launchURL(
                      "https://play.google.com/store/apps/details?id=me.rcell.my&hl=en&gl=US");
                },
                onStoreTabIcon: FontAwesomeIcons.googlePlay,
                image: "assets/images/rcell_m.jpg",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                onStoreTab: () {
                  method.launchURL(
                      "https://apps.apple.com/ae/app/royal-galaxy-restaurant/id1518417047?l=en");
                },
                onYouTubeTab: () {
                  method.launchURL("https://youtu.be/7dKQAt5srIU");
                },
                image: "assets/images/r_g_m.jpg",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                onStoreTab: () {
                  method.launchURL(
                      "https://apps.apple.com/us/app/weeana-cinema/id1498299394");
                },
                onYouTubeTab: () {
                  method.launchURL("https://youtu.be/mXIjgM3dPSc");
                },
                image: "assets/images/weeana_cinema_m.jpg",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                onStoreTab: () {
                  method.launchURL(
                      "https://play.google.com/store/apps/details?id=com.iqnetwork.dx.weeanatv&hl=en&gl=US");
                },
                onStoreTabIcon: FontAwesomeIcons.googlePlay,
                onYouTubeTab: () {
                  method.launchURL(
                      "https://youtube.com/shorts/omsiJM4hhCo?feature=share");
                },
                image: "assets/images/weeana_tv_m.jpg",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                onStoreTab: () {
                  method.launchURL(
                      "https://pub.dev/packages/square_progress_bar");
                },
                onStoreTabIcon: FontAwesomeIcons.github,
                image: "assets/images/spb_m.gif",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              FittedBox(
                fit: BoxFit.cover,
                child: Container(
                  //height: size.aspectRatio,
                  width: size.width,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            "Although I'm always open to reply whether you have a question or just want to say hi, I'll try my best to get back to you!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              letterSpacing: 0.75,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.07,
                      ),
                      InkWell(
                        onTap: () {
                          method.launchEmail();
                        },
                        hoverColor: const Color(0xff64FFDA).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4.0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 56.0,
                          width: 160.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xff64FFDA),
                            ),
                            borderRadius: BorderRadius.circular(4.0),
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
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.github,
                      color: Colors.white,
                      size: 15.0,
                    ),
                    onPressed: () {
                      method.launchURL("https://github.com/yasirdx777");
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.linkedin,
                      color: Colors.white,
                      size: 15.0,
                    ),
                    onPressed: () {
                      method.launchURL(
                          "https://www.linkedin.com/in/yasir-romaya-5099b9108");
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.instagram,
                      color: Colors.white,
                      size: 15.0,
                    ),
                    onPressed: () {
                      method.launchURL("https://www.instagram.com/yasirdx777");
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.call),
                    color: Color(0xffffA8B2D1),
                    iconSize: 16.0,
                    onPressed: () {
                      method.launchCaller();
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.mail,
                      color: Colors.white,
                      size: 15.0,
                    ),
                    onPressed: () {
                      method.launchEmail();
                    },
                  )
                ],
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              //Footer
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width,
                //color: Colors.white,
                child: Text(
                  "Designed & Built by Yasir Romaya 💙 Flutter",
                  textAlign: TextAlign.center,
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
      ),
    );
  }
}
