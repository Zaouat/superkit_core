import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class ImageErrorBuilder extends StatelessWidget {
  final String? title;

  const ImageErrorBuilder({
    super.key,
    this.title = 'Error No Connection',
  });
  @override
  Widget build(BuildContext context) {
    final String lang = Localizations.localeOf(context).languageCode;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Icon(
            IconlyBroken.image,
            color: Colors.redAccent,
            size: 30,
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth(context) / 4,
              right: screenWidth(context) / 4,
            ),
            child: SuperKitText.captionSemiBold(
              text: title!,
              lang: lang,
              color: Colors.redAccent,
              maxLines: 2,
              align: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
