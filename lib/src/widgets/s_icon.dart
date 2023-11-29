/*
* File : SuperKit Icon Widget
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class SuperKitIcon extends StatefulWidget {
  final IconData icon;
  final double size;
  final String? tooltip;
  final Function? onTap;
  final Color? iconColor;
  final EdgeInsetsGeometry? padding;

  const SuperKitIcon({
    super.key,
    required this.icon,
    this.size = 22,
    this.tooltip,
    this.onTap,
    this.iconColor = kcNeutralColor_60,
    this.padding,
  });

  @override
  State<SuperKitIcon> createState() => _SuperKitIconState();
}

class _SuperKitIconState extends State<SuperKitIcon> {
  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: () {
        widget.onTap!();
      },
      child: IconButton(
        padding: widget.padding ?? const EdgeInsets.all(10),
        icon: Icon(
          widget.icon,
          color: widget.iconColor!,
          size: widget.size,
        ),
        tooltip: widget.tooltip,
        onPressed: () {
          widget.onTap!();
        },
      ),
    );
  }
}
