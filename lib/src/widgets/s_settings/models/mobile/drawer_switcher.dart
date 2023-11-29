// ignore_for_file: prefer_typing_uninitialized_variables, always_specify_types

import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class DrawerSwitcher extends StatefulWidget {
  final String? defaultDrawer;
  final List<String>? drawers;
  final drawerProvider;
  const DrawerSwitcher({
    super.key,
    this.defaultDrawer,
    required this.drawers,
    this.drawerProvider,
  });

  @override
  State<DrawerSwitcher> createState() => _DrawerSwitcherState();
}

class _DrawerSwitcherState extends State<DrawerSwitcher> {
  @override
  Widget build(BuildContext context) {
    final String lang = Localizations.localeOf(context).languageCode;

    final String? drawer = widget.defaultDrawer;
    return Padding(
      padding: lang.contains('ar')
          ? const EdgeInsets.only(
              left: 22,
              right: 16,
            )
          : const EdgeInsets.only(
              left: 16,
              right: 22,
            ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          verticalSpaceMedium,
          SuperKitText.bodySemiBold(
            text: 'Drawers',
            lang: lang,
          ),
          verticalSpaceSmall,
          SuperkitDropdown(
            customItems: widget.drawers,
            defaultItem: drawer,
            onSelected: (String val) {
              widget.drawerProvider!.setDrawer = val;
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
