import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class SuperKitIconButton extends StatelessWidget {
  final bool disabled;
  final bool busy;
  final void Function()? onTap;
  final bool outline;
  final IconData? icon;
  final Color? color;
  final Color? iconColor;
  final double? iconSize;
  final double? width;
  final double? height;
  final double? radius;

  const SuperKitIconButton({
    super.key,
    this.disabled = false,
    this.busy = false,
    this.onTap,
    this.icon,
    this.color,
    this.iconSize,
    this.iconColor,
    this.width = 45,
    this.height = 45,
    this.radius = 30,
  }) : outline = false;

  const SuperKitIconButton.outline({
    super.key,
    this.onTap,
    this.icon,
    this.color = kcNeutralColor_100,
    this.iconColor,
    this.iconSize,
    this.width = 45,
    this.height = 45,
    this.radius = 30,
  })  : disabled = false,
        busy = false,
        outline = true;

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: () {
        onTap!();
      },
      child: Container(
        width: width ?? double.infinity,
        height: height,
        alignment: Alignment.center,
        decoration: !outline
            ? ShapeDecoration(
                color: disabled ? Theme.of(context).primaryColor : color!,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(radius!),
                ),
              )
            : ShapeDecoration(
                color: Colors.transparent,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(radius!),
                  side: BorderSide(
                    color: color!,
                    width: 1.5,
                  ),
                ),
              ),
        child: !busy
            ? Icon(
                icon,
                color: outline
                    ? Theme.of(context).primaryColor
                    : iconColor ?? Colors.white,
                size: iconSize,
              )
            : const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white,
                  ),
                ),
              ),
      ),
    );
  }
}
