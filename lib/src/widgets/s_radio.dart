/*
* File : SuperKit Radio Widget
* Version : 1.0.0
* */
import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class SuperKitRadio extends StatefulWidget {
  final String? text;
  final int? index;
  final int? selectedButton;
  final Function? press;

  const SuperKitRadio(
      {super.key, this.text, this.index, this.selectedButton, this.press});

  @override
  SuperKitRadioPage createState() => SuperKitRadioPage();
}

class SuperKitRadioPage extends State<SuperKitRadio> {
  // QuestionController controllerCopy =QuestionController();

  int id = 1;
  bool? isButtonDisabled;

  // OptionRadioPage();

  @override
  void initState() {
    isButtonDisabled = false;
    super.initState();
  }

  final int? selected = 0;

  @override
  Widget build(BuildContext context) {
    final String lang = Localizations.localeOf(context).languageCode;

    return Expanded(
      child: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          radioTheme: Theme.of(context).radioTheme,
          // unselectedWidgetColor: Theme.of(context).textTheme.caption!.color!,
          disabledColor: Theme.of(context).colorScheme.secondary,
        ),
        child: Row(
          children: <Widget>[
            Radio<int>(
              value: widget.index!,
              groupValue: widget.selectedButton,
              toggleable: true,
              activeColor: Theme.of(context).primaryColor,
              focusColor: Theme.of(context).primaryColor,
              visualDensity: const VisualDensity(horizontal: -4.0),
              onChanged: (int? val) async {
                widget.press!(widget.index);
              },
            ),
            Flexible(
              child: GestureDetector(
                onTap: () {
                  widget.press!(widget.index);
                },
                child: SizedBox(
                  width: screenWidth(context) * 0.4,
                  child: SuperKitText.captionSemiBold(
                    text: '${widget.text}',
                    lang: lang,
                    maxLines: 2,
                    align: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),

        // RadioListTile<int>(
        //   contentPadding: EdgeInsets.zero,
        //   title: SuperKitText.captionSemiBold(
        //     text: '${widget.text}',
        //     lang: lang,
        //   ),
        //   visualDensity: const VisualDensity(horizontal: -4.0),
        //   dense: true,
        //   activeColor: Theme.of(context).primaryColor,
        //   groupValue: widget.selectedButton,
        //   value: widget.index!,
        //   // activeColor: THeme,
        //   onChanged: (int? val) async {
        //     widget.press!(widget.index);
        //   },
        //   toggleable: true,
        // ),
      ),
    );
  }
}
