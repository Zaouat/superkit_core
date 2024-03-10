// ignore_for_file: avoid_dynamic_calls

import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class AppearanceCard extends StatelessWidget {
  final String? title;
  final String? image;
  final Function? onTap;
  final bool? selected;
  final bool? hideonTap;
  final double? height;
  final double? width;
  final bool? enableDesktopMode;
  final String? font;
  final String? fontAr;

  const AppearanceCard({
    super.key,
    required this.title,
    this.image = place_holder,
    this.onTap,
    this.selected,
    this.hideonTap = true,
    this.height,
    this.width,
    this.enableDesktopMode = false,
    this.font,
    this.fontAr,
  });
  @override
  Widget build(BuildContext context) {
    final String lang = Localizations.localeOf(context).languageCode;

    return ScaleTap(
      onPressed: () {
        if (hideonTap == true) {
          Navigator.of(context, rootNavigator: true).pop();
        }
        onTap!();
      },
      child: Tooltip(
        message: title,
        child: Container(
          height: height ?? screenWidth(context) / 4,
          width: width ?? screenWidth(context) / 4,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image!.contains('http')
                  ? CachedNetworkImageProvider(
                      image!,
                    )
                  : AssetImage(
                      image!,
                    ) as ImageProvider,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(enableDesktopMode! ? 16 : 24),
            ),
            border: selected!
                ? Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 3,
                  )
                : null,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: colorChanger(
                  context: context,
                  dark: Theme.of(context).primaryColor.withOpacity(0.08),
                  light: kcAccentColor_40.withOpacity(0.02),
                  //mode: mode!,
                ),
                blurRadius: 12.0,
                spreadRadius: 1.5,
              ),
            ],
          ),
          child: Padding(
            padding: enableDesktopMode!
                ? const EdgeInsets.all(8)
                : const EdgeInsets.only(
                    top: 30,
                    bottom: 30,
                    left: 15,
                    right: 15,
                  ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => onTap?.call(),
                  child: SizedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Center(
                          child: SuperKitText.captionBold(
                            text: title!,
                            lang: lang,
                            color: Colors.white,
                            align: TextAlign.center,
                            fontFamily: font,
                            fontArFamily: fontAr,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
