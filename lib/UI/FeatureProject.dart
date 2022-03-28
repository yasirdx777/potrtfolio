import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Widget/CustomText.dart';

class FeatureProject extends StatelessWidget {
  final String imagePath;
  final String projectTitle;
  final String projectDesc;

  final Function onStoreTab;
  final onStoreTabIcon;
  final onYouTubeTab;
  final onYouTubeTabIcon;

  FeatureProject({
    this.imagePath,
    this.onStoreTab,
    this.onStoreTabIcon,
    this.onYouTubeTab,
    this.onYouTubeTabIcon,
    this.projectDesc,
    this.projectTitle,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 0.999,
      width: size.width - 100,
      //color: Colors.tealAccent,
      child: Column(
        children: [
          Container(
            height: size.height - 100,
            width: size.width - 84,
            child: Stack(
              children: [
                //Image
                Positioned(
                  top: size.height * 0.02,
                  left: 20.0,
                  child: Container(
                    height: size.height * 0.60,
                    width: size.width * 0.5,
                    //color: Colors.redAccent,
                    child: Image(
                      fit: BoxFit.contain,
                      image: AssetImage(imagePath),
                    ),
                  ),
                ),

                // Short Desc
                Positioned(
                  top: size.height / 6,
                  right: 10.0,
                  child: Container(
                    alignment: Alignment.center,
                    height: size.height * 0.3,
                    width: size.width * 0.22,
                    color: Color(0xff172A45),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: CustomText(
                            text: projectDesc,
                            textsize: 16.0,
                            color: Colors.white.withOpacity(0.4),
                            letterSpacing: 0.75,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Project Tiitle
                Positioned(
                  top: 16.0,
                  right: 10.0,
                  child: Container(
                    height: size.height * 0.10,
                    width: size.width * 0.25,
                    //color: Colors.indigo,
                    child: Wrap(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      alignment: WrapAlignment.end,
                      children: [
                        CustomText(
                          text: projectTitle,
                          textsize: 27,
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.75,
                        ),
                      ],
                    ),
                  ),
                ),

                // Store Link
                Positioned(
                  top: size.height * 0.45,
                  right: 10.0,
                  child: Container(
                    height: size.height * 0.08,
                    width: size.width * 0.25,
                    // color: Colors.indigo,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: FaIcon(
                              onStoreTabIcon ?? FontAwesomeIcons.appStore),
                          color: Colors.white.withOpacity(0.3),
                          onPressed: onStoreTab,
                        ),
                      ],
                    ),
                  ),
                ),

                // Preview Link
                onYouTubeTab != null
                    ? Positioned(
                        top: size.height * 0.45,
                        right: 60.0,
                        child: Container(
                          height: size.height * 0.08,
                          width: size.width * 0.25,
                          // color: Colors.indigo,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: FaIcon(onYouTubeTabIcon ??
                                    FontAwesomeIcons.youtube),
                                color: Colors.white.withOpacity(0.3),
                                onPressed: onYouTubeTab,
                              ),
                            ],
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
