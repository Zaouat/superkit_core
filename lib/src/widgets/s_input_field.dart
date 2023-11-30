// ignore_for_file: deprecated_member_use

/*
* File : SuperKit Input Widget
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

InputDecoration inputSuperkitDecoration({
  String? hintText,
  String? labelText,
  String? prefixText,
  BuildContext? context,
  bool? useBorder = true,
}) {
  final String lang = Localizations.localeOf(context!).languageCode;

  return InputDecoration(
    labelText: labelText,
    labelStyle: fontChanger(
      lang: lang,
      color: colorChanger(
        context: context,
        dark: kcNeutralColor_40,
        light: kcNeutralColor_60,
      ),
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        width: 4,
        color: useBorder! ? Colors.grey.withOpacity(0.4) : Colors.transparent,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(12.0),
      ),
    ),
    prefixStyle: TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 12,
    ),
    errorStyle: fontChanger(
      lang: lang,
      color: Colors.red,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color: Theme.of(context).primaryColor,
      ),
    ),
    contentPadding: const EdgeInsets.all(20),
    filled: true,
    hintText: hintText,
    hintStyle: fontChanger(
      lang: lang,
      color: kcNeutralColor_40,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    ),
  );
}

class SuperKitInput extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final String? label;
  final IconData? icon;
  final TextInputType? type;
  final bool? isPhoneNumber;
  final bool? isPassword;
  final Function? validate;
  final TextInputAction? action;
  final int? maxLines;
  final int? minLines;
  final bool? expand;
  final bool readOnly;
  final Function? onsearch;
  final FocusNode? focus;
  final Color? txtColor;
  final Color? fillColor;
  final Color? hintColor;
  final void Function()? trailingTapped;
  final Widget? suffixIcon;
  final double? contentPadding;
  final BorderSide? borderSide;
  final Function(dynamic)? onChanged;

  final OutlineInputBorder circularBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  );

  SuperKitInput({
    super.key,
    required this.controller,
    this.placeholder = '',
    this.trailingTapped,
    this.icon,
    this.type,
    this.isPassword = false,
    this.isPhoneNumber,
    this.action,
    this.validate,
    this.maxLines,
    this.minLines,
    this.expand = false,
    this.readOnly = false,
    this.onsearch,
    this.focus,
    this.txtColor,
    this.fillColor,
    this.hintColor,
    this.suffixIcon,
    this.contentPadding,
    this.borderSide,
    this.onChanged,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    bool passwordVisible = false;
    //final String lang = Localizations.localeOf(context).languageCode;
    return Theme(
      /// Overriding the default blue color.
      ///
      /// We can also avoid this by changing the [primarySwatch] in MaterialApp
      data: ThemeData(
        primaryColor: Theme.of(context).primaryColor,
      ),
      child: StatefulBuilder(
        builder: (BuildContext context, Function(void Function()) setState) {
          final String lang = Localizations.localeOf(context).languageCode;

          return TextFormField(
            maxLines: maxLines,
            minLines: minLines,
            expands: expand!,
            readOnly: readOnly,
            focusNode: focus,
            scrollPadding: const EdgeInsets.only(bottom: 100),
            onFieldSubmitted: onsearch as void Function(String)?,
            textCapitalization: TextCapitalization.words,
            textInputAction: action,
            controller: controller,
            cursorColor: Theme.of(context).primaryColor,
            cursorWidth: 3,
            cursorHeight: 15,
            onChanged: (String value) => onChanged!(value),
            style: fontChanger(
              color: txtColor ?? Theme.of(context).textTheme.headline2!.color!,
              lang: lang,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            strutStyle: StrutStyle.fromTextStyle(
              fontChanger(
                color:
                    txtColor ?? Theme.of(context).textTheme.headline2!.color!,
                lang: lang,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            textAlignVertical: expand == true
                ? TextAlignVertical.top
                : TextAlignVertical.center,
            keyboardType: type,
            validator: validate as String? Function(String?)?,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: borderSide ??
                    BorderSide(width: 0, color: Colors.grey.withOpacity(0.4)),
                borderRadius: const BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              prefixStyle: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 14,
              ),
              errorStyle: fontChanger(
                lang: lang,
                color: Colors.red,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: borderSide ??
                    BorderSide(color: Theme.of(context).primaryColor, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: fillColor ??
                  colorChanger(
                    context: context,
                    dark: kcNeutralColor_90.withOpacity(0.5),
                    light: kcVeryLightGreyColor.withOpacity(0.5),
                  ),
              labelText: label,
              floatingLabelBehavior: label == null
                  ? FloatingLabelBehavior.never
                  : FloatingLabelBehavior.auto,
              hintText: placeholder,
              floatingLabelStyle: fontChanger(
                lang: lang,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
              alignLabelWithHint: true,
              hintStyle: fontChanger(
                lang: lang,
                color: hintColor ??
                    colorChanger(
                      context: context,
                      dark: kcNeutralColor_5.withOpacity(0.5),
                      light: txtColor ??
                          Theme.of(context)
                              .textTheme
                              .headline2!
                              .color!
                              .withOpacity(0.3),
                    ),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              labelStyle: fontChanger(
                lang: lang,
                color: hintColor ??
                    colorChanger(
                      context: context,
                      dark: kcNeutralColor_5.withOpacity(0.5),
                      light: txtColor ??
                          Theme.of(context)
                              .textTheme
                              .headline2!
                              .color!
                              .withOpacity(0.5),
                    ),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              prefixIcon: icon == null
                  ? null
                  : Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Icon(
                        icon,
                        color: colorChanger(
                          context: context,
                          dark: kcNeutralColor_5.withOpacity(0.5),
                          light: txtColor ??
                              Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .color!
                                  .withOpacity(0.5),
                        ),
                        size: 18,
                      ),
                    ),
              suffixIcon: SizedBox(
                width: 80,
                child: (suffixIcon) ??
                    IconButton(
                      icon: isPassword!
                          ? Icon(
                              passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColor,
                              size: 20,
                            )
                          : Container(),
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    ),
              ),
            ),

            // decoration: InputDecoration(
            //   border: OutlineInputBorder(
            //     borderSide:
            //         BorderSide(width: 0, color: Colors.grey.withOpacity(0.4)),
            //     borderRadius: const BorderRadius.all(
            //       Radius.circular(16.0),
            //     ),
            //   ),
            //   prefixStyle: TextStyle(
            //     color: Theme.of(context).primaryColor,
            //     fontSize: 14,
            //   ),
            //   errorStyle: fontChanger(
            //     lang: lang,
            //     color: Colors.red,
            //     fontSize: 12,
            //     fontWeight: FontWeight.w500,
            //   ),
            //   enabledBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(12.0),
            //     borderSide: BorderSide.none,
            //   ),
            //   focusedBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(12.0),
            //     borderSide: borderSide ??
            //         BorderSide(
            //           color: Theme.of(context).primaryColor,
            //         ),
            //   ),
            //   contentPadding: icon == null
            //       ? EdgeInsets.all(contentPadding ?? 20)
            //       : const EdgeInsets.only(bottom: 20, top: 20),
            //   filled: true,
            //   fillColor: fillColor ??
            //       colorChanger(
            //         context: context,
            //         dark: kcNeutralColor_90.withOpacity(0.5),
            //         light: kcVeryLightGreyColor.withOpacity(0.5),
            //       ),
            //   labelText: placeholder,
            //   hintText: place_holder,
            //   labelStyle: fontChanger(
            //     lang: lang,
            //     color: hintColor ??
            //         colorChanger(
            //           context: context,
            //           dark: kcNeutralColor_5.withOpacity(0.5),
            //           light: txtColor ??
            //               Theme.of(context)
            //                   .textTheme
            //                   .headline2!
            //                   .color!
            //                   .withOpacity(0.5),
            //         ),
            //     fontSize: 14,
            //     fontWeight: FontWeight.w400,
            //   ),
            //   errorBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(16.0),
            //     borderSide: const BorderSide(
            //       color: Colors.red,
            //     ),
            //   ),
            //   prefixIcon: icon == null
            //       ? null
            //       : Padding(
            //           padding: const EdgeInsets.only(top: 10, bottom: 10),
            //           child: Icon(
            //             icon,
            //             color: colorChanger(
            //               context: context,
            //               dark: kcNeutralColor_5.withOpacity(0.5),
            //               light: txtColor ??
            //                   Theme.of(context)
            //                       .textTheme
            //                       .headline2!
            //                       .color!
            //                       .withOpacity(0.5),
            //             ),
            //             size: 18,
            //           ),
            //         ),
            //   suffixIcon: (suffixIcon) ??
            //       IconButton(
            //         icon: isPassword!
            //             ? Icon(
            //                 passwordVisible
            //                     ? Icons.visibility
            //                     : Icons.visibility_off,
            //                 color: Theme.of(context).primaryColor,
            //                 size: 20,
            //               )
            //             : Container(),
            //         onPressed: () {
            //           setState(() {
            //             passwordVisible = !passwordVisible;
            //           });
            //         },
            //       ),
            // ),
            obscureText: isPassword! ? !passwordVisible : false,
          );
        },
      ),
    );
  }
}
