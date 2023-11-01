import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class SuperkitPageSwitcher extends StatelessWidget {
  /// The arguments [selectedIndex], [pages], must not be null.
  const SuperkitPageSwitcher({
    Key? key,
    required this.selectedIndex,
    required this.pages,
  }) : super(key: key);

  /// The index of the selected page.
  final int? selectedIndex;

  /// The list of pages to display up to 8 page.
  final List<Widget>? pages;

  @override
  Widget build(BuildContext context) {
    final String lang = Localizations.localeOf(context).languageCode;

    switch (selectedIndex) {
      case 0:
        return pages![0];

      case 1:
        return pages![1];

      case 2:
        return pages![2];

      case 3:
        return pages![3];

      case 4:
        return pages![4];

      case 5:
        return pages![5];

      case 6:
        return pages![6];

      case 7:
        return pages![7];

      default:
        return Center(
          child: SuperKitText.captionBold(
            text: ':/ No tab selected',
            lang: lang,
            color: Colors.red,
          ),
        );
    }
  }
}
