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
    return ListView(
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth(context) * 0.35,
      ),
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
        SuperKitCustomSlider.emoji(
          emojiValue: rating!.toDouble(),
          onEmojiChanged: (val) {
            if (mounted) {
              setState(() {
                rating = val;
              });
            }
          },
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
        SuperKitText.bodyBold(
          text: 'Contact us',
          lang: globals.lang,
          align: TextAlign.center,
        ),
        SuperKitText.captionMedium(
          text: 'mobiledevlopa@gmail.com',
          lang: globals.lang,
          align: TextAlign.center,
        ),
        verticalSpaceSmall,
      ],
    );
  }
}
