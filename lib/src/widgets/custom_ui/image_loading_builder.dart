import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:superkit_core/superkit_core.dart';

class ImageLoading extends StatelessWidget {
  final double? height;
  final double? width;
  const ImageLoading({
    Key? key,
    this.height = double.infinity,
    this.width = double.infinity,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: height,
      height: width,
      child: Shimmer.fromColors(
        baseColor: colorChanger(
          context: context,
          dark: kcNeutralColor_90,
          light: kcNeutralColor_5,
        ),
        highlightColor: colorChanger(
          context: context,
          dark: kcNeutralColor_100,
          light: Colors.white,
        ),
        child: Container(
          width: height,
          height: width,
          color: colorChanger(
            context: context,
            dark: kcNeutralColor_90,
            light: kcNeutralColor_5,
          ),
        ),
      ),
    );
  }
}
