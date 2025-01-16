// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';
import 'package:superkit_project/config/globals.dart' as globals;
import 'package:superkit_project/view_model/home_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel hm = HomeViewModel();
  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    hm.fetchAppVersion();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleSPageTemplate(
      appBarHeight: screenHeight(context) * 0.09,
      titleWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ScaleTap(
              onPressed: () {},
              child: SvgPicture.asset(
                'assets/icons/menu.svg',
                color: globals.lightColor,
                width: 21,
              ),
            ),
            ScaleTap(
              onPressed: () {},
              child: Image.asset(
                globals.Logo,
                height: 40,
              ),
            ),
            ScaleTap(
              onPressed: () {},
              child: SvgPicture.asset(
                'assets/icons/setting.svg',
                color: globals.lightColor,
                width: 22,
              ),
            ),
          ],
        ),
      ),
      font: 'Rubik',
      pinned: true,
      enableContinuousRadius: true,
      appbarRadius: 70,
      statuBarBrightness: (Platform.isIOS)
          ? (isDarkMode(context) ? Brightness.light : Brightness.dark)
          : (isDarkMode(context) ? Brightness.light : Brightness.dark),
      elevation: isDarkMode(context) ? null : 0,
      appbarColor: colorChanger(
        context: context,
        dark: globals.cardColor,
        light: globals.kcPrimary_100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SuperKitCard(
              radius: 18,
              color: colorChanger(
                context: context,
                dark: globals.darkBG,
                light: globals.lightColor.withOpacity(.9),
              ),
              padding:
                  EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SuperKitText.heading3Bold(
                    text: 'Welcome to SuperKit',
                    fontFamily: 'Rubik',
                    lang: globals.lang,
                    fontSize: 26,
                    color: globals.colorTxt,
                  ),
                  verticalSpaceTiny,
                  SuperKitText.captionSemiBold(
                    text:
                        'SuperKit is a Flutter UI Kit, that helps you to build your app faster and easier, with a lot of components and screens that you can use in your app to make it more beautiful and user-friendly.',
                    color: globals.colorTxt,
                    lang: globals.lang,
                    fontFamily: 'DM Sans',
                    maxLines: 4,
                  ),
                  verticalSpaceSmall,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: SuperKitText.captionSemiBold(
                          text: 'Version ${hm.version}',
                          lang: globals.lang,
                          color: globals.colorTxt,
                          fontFamily: 'DM Sans',
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 70,
                        height: 32,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              child: SuperKitAvatar(
                                radius: 14,
                                borderWidth: 1,
                                imageSpace: 0,
                                borderColor: globals.softColor.withOpacity(.3),
                                onTap: () {},
                                image: globals.zaouat_avatar,
                              ),
                            ),
                            Positioned(
                              left: 18,
                              child: SuperKitAvatar(
                                radius: 14,
                                borderWidth: 1,
                                imageSpace: 0,
                                borderColor: globals.softColor.withOpacity(.3),
                                onTap: () {},
                                image: globals.elmissouri_avatar,
                              ),
                            ),
                            Positioned(
                              left: 40,
                              child: SuperKitAvatar(
                                radius: 14,
                                borderWidth: 1,
                                imageSpace: 0,
                                borderColor: globals.softColor.withOpacity(.3),
                                onTap: () {},
                                image: globals.hamza_avatar,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
