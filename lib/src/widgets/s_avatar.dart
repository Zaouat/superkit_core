import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class SuperKitAvatar extends StatelessWidget {
  const SuperKitAvatar({
    super.key,
    this.radius,
    this.image = avatar,
    this.toolTip = 'Avatar',
    this.borderColor = Colors.black,
    this.bgColor = Colors.white,
    this.imageSpace = 4,
    this.borderWidth = 3,
    this.onTap,
  });

  final double? radius;
  final String? image;
  final Color? borderColor;
  final Color? bgColor;
  final double? imageSpace;
  final String? toolTip;
  final int? borderWidth;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return image!.contains('http')
        ? Tooltip(
            message: toolTip!,
            child: ScaleTap(
              onPressed: () {
                onTap!();
              },
              child: CircleAvatar(
                radius: radius,
                backgroundColor: borderColor,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(radius!),
                  child: CircleAvatar(
                    radius: radius! - borderWidth!,
                    backgroundColor: bgColor,
                    child: Padding(
                      padding: EdgeInsets.all(imageSpace ?? 0),
                      child: Image.network(
                        image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : Tooltip(
            message: toolTip!,
            child: ScaleTap(
              onPressed: () {
                onTap!();
              },
              child: CircleAvatar(
                radius: radius!,
                backgroundColor: borderColor,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(120),
                  child: CircleAvatar(
                    radius: radius! - borderWidth!,
                    backgroundColor: bgColor,
                    child: Padding(
                      padding: EdgeInsets.all(imageSpace ?? 0),
                      child: Image.asset(
                        image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
