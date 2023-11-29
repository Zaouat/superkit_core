// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class AutoCompleteListItem extends StatelessWidget {
  final String state, city;
  final Function onTap;

  const AutoCompleteListItem(
      {super.key, required this.state, required this.city, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final String lang = Localizations.localeOf(context).languageCode;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(
            Icons.near_me,
            color: kcMediumGreyColor,
          ),
          onTap: () => onTap,
          title: SuperKitText.headlineMedium(
            text: city,
            lang: lang,
          ),
          subtitle: SuperKitText.captionMedium(
            text: state,
            lang: lang,
          ),
        ),
        const Divider(
          indent: 50,
        )
      ],
    );
  }
}
