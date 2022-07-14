// ignore_for_file: must_be_immutable
/*
* File : SuperKit Custom Sliders
* Version : 1.0.0
* */
import 'package:flutter/material.dart';
import 'package:superkit_core/src/widgets/s_sliders/s_slider.dart';
import 'package:superkit_core/superkit_core.dart';

enum SliderTypes {
  normal,
  volume,
  progress,
  emoji,
  audio,
}

class SuperKitCustomSlider extends StatefulWidget {
  SuperKitCustomSlider.normal({
    Key? key,
    this.type = SliderTypes.normal,
    this.lowerValue = 10,
    this.upperValue = 80,
    this.onNormalValChanged,
    this.disabledTooltip = true,
    this.volumeValue,
    this.progressValue,
    this.emojiValue,
    this.onVolumeChanged,
    this.onProgressChanged,
    this.onEmojiChanged,
  }) : super(key: key);

  SuperKitCustomSlider.volume({
    Key? key,
    this.type = SliderTypes.volume,
    this.lowerValue,
    this.upperValue,
    this.onNormalValChanged,
    this.disabledTooltip = false,
    this.volumeValue = 30,
    this.progressValue,
    this.emojiValue,
    this.onVolumeChanged,
    this.onProgressChanged,
    this.onEmojiChanged,
  }) : super(key: key);

  SuperKitCustomSlider.progress({
    Key? key,
    this.type = SliderTypes.progress,
    this.lowerValue,
    this.upperValue,
    this.onNormalValChanged,
    this.disabledTooltip = false,
    this.volumeValue,
    this.progressValue = 75,
    this.emojiValue,
    this.onVolumeChanged,
    this.onProgressChanged,
    this.onEmojiChanged,
  }) : super(key: key);

  SuperKitCustomSlider.emoji({
    Key? key,
    this.type = SliderTypes.emoji,
    this.lowerValue,
    this.upperValue,
    this.onNormalValChanged,
    this.disabledTooltip = false,
    this.volumeValue,
    this.progressValue,
    this.emojiValue = 3,
    this.onVolumeChanged,
    this.onProgressChanged,
    this.onEmojiChanged,
  }) : super(key: key);

  /// double min value for normal slider
  late double? lowerValue;

  /// double max value for volume slider
  late double? upperValue;

  ///Callback for normal slider
  final Function? onNormalValChanged;

  /// [type] is the type of slider
  final SliderTypes? type;

  /// [disabledTooltip] is the tooltip that will be shown when the slider is disabled
  final bool? disabledTooltip;

  /// [volumeValue] is the volume value of the slider
  late double? volumeValue;

  /// Callback for volume value change
  final Function? onVolumeChanged;

  /// [progressValue] is the progress value of the slider
  late double? progressValue;

  /// Callback for progress value change
  final Function? onProgressChanged;

  /// [emojiValue] is the emoji value of the slider
  late double? emojiValue;

  /// Callback for emoji value change
  final Function? onEmojiChanged;

  @override
  State<SuperKitCustomSlider> createState() => _SuperKitCustomSliderState();
}

class _SuperKitCustomSliderState extends State<SuperKitCustomSlider> {
  @override
  Widget build(BuildContext context) {
    final String lang = Localizations.localeOf(context).languageCode;

    if (widget.type == SliderTypes.normal) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          sliderButton(
            context: context,
            child: SuperKitText.captionBold(
              text: widget.lowerValue!.toInt().toString(),
              lang: lang,
            ),
          ),
          verticalSpaceMedium,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: SuperKitSlider(
                values: <double>[widget.lowerValue!, widget.upperValue!],
                max: 100,
                min: 0,
                rangeSlider: true,
                tooltip: FlutterSliderTooltip(
                  disabled: widget.disabledTooltip,
                ),
                onDragging: (
                  int handlerIndex,
                  dynamic lowerValue,
                  dynamic upperValue,
                ) {
                  setState(() {
                    widget.lowerValue = lowerValue as double;
                    widget.upperValue = upperValue as double;

                    widget.onNormalValChanged
                        ?.call(lowerValue.toInt(), upperValue.toInt());
                  });
                },
              ),
            ),
          ),
          verticalSpaceMedium,
          sliderButton(
            context: context,
            child: SuperKitText.captionBold(
              text: widget.upperValue!.toInt().toString(),
              lang: lang,
            ),
          ),
        ],
      );
    } else if (widget.type == SliderTypes.volume) {
      return Row(
        children: <Widget>[
          Icon(
            widget.volumeValue! == 0
                ? IconlyLight.volumeOff
                : IconlyLight.volumeDown,
            size: 30,
          ),
          verticalSpaceSmall,
          Expanded(
            child: SuperKitSlider(
              values: <double>[widget.volumeValue!],
              max: 100,
              min: 0,
              tooltip: FlutterSliderTooltip(
                disabled: widget.disabledTooltip,
              ),
              onDragging: (
                int handlerIndex,
                dynamic lowerValue,
                dynamic upperValue,
              ) {
                setState(() {
                  widget.volumeValue = lowerValue as double;

                  widget.onVolumeChanged!(widget.volumeValue!.toInt());
                });
              },
            ),
          ),
          verticalSpaceSmall,
          const Icon(
            IconlyLight.volumeUp,
            size: 30,
          ),
        ],
      );
    } else if (widget.type == SliderTypes.progress) {
      return Row(
        children: <Widget>[
          Expanded(
            child: SuperKitSlider(
              values: <double>[widget.progressValue!],
              max: 100,
              min: 0,
              tooltip: FlutterSliderTooltip(
                disabled: widget.disabledTooltip,
              ),
              jump: true,
              step: const FlutterSliderStep(
                step: 25,
              ),
              hatchMark: FlutterSliderHatchMark(
                density: 0.5, // means 50 lines, from 0 to 100 percent
                labels: <FlutterSliderHatchMarkLabel>[
                  FlutterSliderHatchMarkLabel(
                    percent: 0,
                    isText: false,
                    label: CircleAvatar(
                      radius: 8,
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  FlutterSliderHatchMarkLabel(
                    percent: 25,
                    isText: false,
                    label: CircleAvatar(
                      radius: 8,
                      backgroundColor: widget.progressValue! <= 25
                          ? colorChanger(
                              context: context,
                              dark: kcNeutralColor_80,
                              light:
                                  Theme.of(context).chipTheme.backgroundColor!)
                          : Theme.of(context).primaryColor,
                    ),
                  ),
                  FlutterSliderHatchMarkLabel(
                    percent: 50,
                    isText: false,
                    label: CircleAvatar(
                      radius: 8,
                      backgroundColor: widget.progressValue! <= 50
                          ? colorChanger(
                              context: context,
                              dark: kcNeutralColor_80,
                              light:
                                  Theme.of(context).chipTheme.backgroundColor!)
                          : Theme.of(context).primaryColor,
                    ),
                  ),
                  FlutterSliderHatchMarkLabel(
                    percent: 75,
                    isText: false,
                    label: CircleAvatar(
                      radius: 8,
                      backgroundColor: widget.progressValue! <= 75
                          ? colorChanger(
                              context: context,
                              dark: kcNeutralColor_80,
                              light:
                                  Theme.of(context).chipTheme.backgroundColor!)
                          : Theme.of(context).primaryColor,
                    ),
                  ),
                  FlutterSliderHatchMarkLabel(
                    percent: 100,
                    isText: false,
                    label: CircleAvatar(
                      radius: 8,
                      backgroundColor: widget.progressValue! <= 100
                          ? colorChanger(
                              context: context,
                              dark: kcNeutralColor_80,
                              light:
                                  Theme.of(context).chipTheme.backgroundColor!)
                          : Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              onDragging: (
                int handlerIndex,
                dynamic lowerValue,
                dynamic upperValue,
              ) {
                setState(() {
                  widget.progressValue = lowerValue as double;
                  widget.onProgressChanged!(widget.progressValue!.toInt());
                });
              },
            ),
          ),
          verticalSpaceMedium,
          sliderButton(
            context: context,
            color: kcNeutralColor_90,
            width: 70,
            child: SuperKitText.captionBold(
              text: '${widget.progressValue!.toInt()}%',
              lang: lang,
              color: Colors.white,
            ),
          ),
        ],
      );
    } else if (widget.type == SliderTypes.emoji) {
      return Row(
        children: <Widget>[
          SuperKitText.heading2Regular(text: '😠', lang: lang),
          verticalSpaceSmall,
          Expanded(
            child: SuperKitSlider(
              values: <double>[widget.emojiValue!],
              max: 10,
              min: 0,
              enableGradient: true,
              tooltip: FlutterSliderTooltip(
                disabled: widget.disabledTooltip,
              ),
              decoration: const BoxDecoration(color: Colors.transparent),
              onDragging: (
                int handlerIndex,
                dynamic lowerValue,
                dynamic upperValue,
              ) {
                setState(() {
                  widget.emojiValue = lowerValue as double;
                  widget.onEmojiChanged!(widget.emojiValue!.toInt());
                });
              },
            ),
          ),
          verticalSpaceSmall,
          SuperKitText.heading2Regular(text: '🤩', lang: lang),
        ],
      );
    } else {
      return Container();
    }
  }
}

Widget sliderButton({
  BuildContext? context,
  Widget? child,
  double? width,
  Color? color,
}) {
  return ScaleTap(
    onPressed: () {},
    child: Container(
      width: width ?? 45,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        color: color ??
            colorChanger(
              context: context!,
              dark: kcNeutralColor_90,
              light: Colors.white,
            ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: colorChanger(
              context: context!,
              dark: Theme.of(context).primaryColor.withOpacity(0.08),
              light: kcVeryLightGreyColor,
            ),
            blurRadius: 6.0,
            spreadRadius: 0.7,
          ),
        ],
      ),
      child: Center(
        child: child!,
      ),
    ),
  );
}
