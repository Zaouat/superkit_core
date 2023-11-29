// ignore_for_file: file_names, deprecated_member_use
/*
* File : SuperKit Tile Widget
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class SuperkitDropdown extends StatefulWidget {
  const SuperkitDropdown({
    super.key,
    this.customItems = const <String>['Item 1', 'Item 2', 'Item 3', 'Item 4'],
    this.height = 60,
    this.width = double.infinity,
    this.fillColor,
    this.textColor,
    this.bgColor,
    this.defaultItem = 'Item 1',
    this.onSelected,
    this.menuMaxHeight,
    this.elevation = 2,
  });

  const SuperkitDropdown.countries({
    super.key,
    this.customItems,
    this.height = 60,
    this.width = double.infinity,
    this.fillColor,
    this.textColor,
    this.bgColor,
    this.defaultItem = 'Morocco',
    this.onSelected,
    this.menuMaxHeight,
    this.elevation = 2,
  });

  final List<String>? customItems;
  final double? height;
  final double? width;
  final Color? fillColor;
  final Color? textColor;
  final Color? bgColor;
  final String? defaultItem;
  final Function? onSelected;
  final double? menuMaxHeight;

  final int? elevation;
  @override
  State<SuperkitDropdown> createState() => _SuperkitDropdownState();
}

class _SuperkitDropdownState extends State<SuperkitDropdown> {
  @override
  Widget build(BuildContext context) {
    late String? defaultVal = widget.defaultItem!;
    final String lang = Localizations.localeOf(context).languageCode;

    return ScaleTap(
      onPressed: () {},
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: DropdownButtonFormField<String>(
          isExpanded: true,
          elevation: widget.elevation!,
          menuMaxHeight: widget.menuMaxHeight ?? screenHeight(context) / 3,
          iconEnabledColor: Theme.of(context).textTheme.bodyText1!.color!,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Theme.of(context).textTheme.bodyText1!.color!,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Theme.of(context).textTheme.bodyText1!.color!,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Theme.of(context).textTheme.bodyText1!.color!,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            contentPadding: const EdgeInsets.all(20),
            filled: true,
            fillColor: widget.fillColor ??
                colorChanger(
                  context: context,
                  dark: kcNeutralColor_100,
                  light: Colors.white,
                ),
            hintStyle: fontChanger(
              lang: lang,
              color: colorChanger(
                context: context,
                dark: kcNeutralColor_20,
                light: kcNeutralColor_5,
              ),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: fontChanger(
            lang: lang,
            color: widget.textColor ??
                colorChanger(
                  context: context,
                  dark: Colors.white,
                  light: kcNeutralColor_80,
                ),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          validator: (String? value) => value == null ? 'Select a Item' : null,
          dropdownColor: widget.bgColor ??
              colorChanger(
                context: context,
                dark: kcNeutralColor_100,
                light: Colors.white,
              ),
          value: defaultVal,
          onChanged: (String? newValue) {
            setState(() {
              widget.onSelected?.call(newValue);
              defaultVal = newValue;
            });
          },
          items: widget.customItems == null
              ? sCountries.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: fontChanger(
                        lang: lang,
                        color: Theme.of(context).textTheme.bodyText1!.color!,
                      ),
                    ),
                  );
                }).toList()
              : widget.customItems!.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: fontChanger(
                        lang: lang,
                        color: Theme.of(context).textTheme.bodyText1!.color!,
                      ),
                    ),
                  );
                }).toList(),
        ),
      ),
    );
  }
}
