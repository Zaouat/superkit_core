import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:superkit_core/superkit_core.dart';
import 'package:superkit_project/config/globals.dart' as globals;

class HomeContentMobile extends StatefulWidget {
  @override
  State<HomeContentMobile> createState() => _HomeContentMobileState();
}

class _HomeContentMobileState extends State<HomeContentMobile> {
  int? rating = 5;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Center(
        child: Column(
          children: <Widget>[
            SuperKitLogo.big(
              logo: superkit_core_logo,
              size: 220,
            ),
            verticalSpaceMedium,
            SuperKitText.heading3Bold(
              text: 'Getting started is a breeze',
              lang: globals.lang,
              maxLines: 3,
              fontFamily: 'Rubik',
              align: TextAlign.center,
            ),
            SizedBox(
              width: screenWidth(context) * 0.6,
              child: SuperKitText.captionSemiBold(
                text:
                    'Download the app and meet your new virtual assistant. It’s intuitive, smart, and ready to simplify your life.',
                lang: globals.lang,
                maxLines: 3,
                fontFamily: 'DM Sans',
                align: TextAlign.center,
              ),
            ),
            verticalSpaceMedium,
            SizedBox(
              width: screenWidth(context) * 0.6,
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SuperKitButton.large(
                    title: 'Send',
                    icon: IconlyBold.send,
                    onTap: () {
                      debugPrint('Send');
                    },
                  ),
                  horizontalSpaceRegular,
                  SuperKitIconButton.outline(
                    color: Theme.of(context).primaryColor,
                    icon: Icons.share,
                    onTap: () {
                      Share.share(
                          'Check out Superkit Core on ${"https://example.com"}',
                          subject: 'Superkit Core');
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),
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
