import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MobileProject extends StatelessWidget {
  final String image;

  final VoidCallback onStoreTab;
  final IconData? onStoreTabIcon;
  final VoidCallback? onYouTubeTab;
  final IconData? onYouTubeTabIcon;

  const MobileProject({
    required this.onStoreTab,
    this.onStoreTabIcon,
    this.onYouTubeTab,
    this.onYouTubeTabIcon,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 1,
            child: Image(
              fit: BoxFit.contain,
              image: AssetImage(image),
            ),
          ),

          // Store Link
          Positioned(
            bottom: 5,
            right: 15,
            child: IconButton(
              icon: FaIcon(onStoreTabIcon ?? FontAwesomeIcons.appStore),
              color: Colors.white.withOpacity(0.3),
              onPressed: onStoreTab,
            ),
          ),

          // Preview Link
          onYouTubeTab != null
              ? Positioned(
                  bottom: 5,
                  right: 60,
                  child: IconButton(
                    icon: FaIcon(onYouTubeTabIcon ?? FontAwesomeIcons.youtube),
                    color: Colors.white.withOpacity(0.3),
                    onPressed: onYouTubeTab,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
