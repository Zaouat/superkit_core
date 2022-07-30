import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';
import 'package:superkit_project/config/globals.dart' as globals;

class HomeContentDesktop extends StatefulWidget {
  @override
  State<HomeContentDesktop> createState() => _HomeContentDesktopState();
}

class _HomeContentDesktopState extends State<HomeContentDesktop> {
  int? rating = 5;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: screenWidth(context) * 0.5,
        child: Column(
          children: <Widget>[
            SuperKitLogo.big(
              logo: superkit_core_logo,
              size: 280,
            ),
            verticalSpaceMedium,
            SuperKitText.heading3Bold(
              text: 'How did you find Superkit Core?',
              lang: globals.lang,
              maxLines: 3,
              align: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: SuperKitCustomSlider.emoji(
                emojiValue: rating!.toDouble(),
                onEmojiChanged: (val) {
                  if (mounted) {
                    setState(() {
                      rating = val;
                    });
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SuperKitButton.large(
                  title: 'Send',
                  icon: IconlyBold.send,
                  onTap: () {
                    debugPrint(rating.toString());
                  },
                ),
                horizontalSpaceRegular,
                SuperKitIconButton.outline(
                  color: Theme.of(context).primaryColor,
                  icon: Icons.share,
                  onTap: () {},
                ),
              ],
            ),
            const Spacer(),
            SuperKitLogo.tiny(
              logo: devlopa_logo,
              size: 28,
              color: colorChanger(
                  context: context,
                  dark: kcNeutralColor_70,
                  light: Theme.of(context).primaryColor),
            ),
            verticalSpaceSmall,
            SuperKitText.bodyBold(text: 'Contact us', lang: globals.lang),
            SuperKitText.captionMedium(
              text: 'mobiledevlopa@gmail.com',
              lang: globals.lang,
            ),
            verticalSpaceSmall,
          ],
        ),
      ),
    );
  }
}
