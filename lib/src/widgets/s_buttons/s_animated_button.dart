import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

class SuperKitAnimatedButton extends StatefulWidget {
  final bool disabled;
  final bool busy;
  final void Function()? onTap;
  final bool outline;
  final AnimatedIconData? icon;
  final double? width;
  final double? height;
  final bool? enableSlowMo;
  final bool? iconOnly;

  const SuperKitAnimatedButton({
    Key? key,
    this.disabled = false,
    this.busy = false,
    this.onTap,
    this.icon,
    this.width = 45,
    this.height = 45,
    this.enableSlowMo = false,
    this.iconOnly = false,
  })  : outline = false,
        super(key: key);

  const SuperKitAnimatedButton.outline({
    Key? key,
    this.onTap,
    this.icon,
    this.width = 45,
    this.height = 45,
    this.enableSlowMo = false,
    this.iconOnly = false,
  })  : disabled = false,
        busy = false,
        outline = true,
        super(key: key);

  @override
  State<SuperKitAnimatedButton> createState() => _SuperKitAnimatedButtonState();
}

class _SuperKitAnimatedButtonState extends State<SuperKitAnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: widget.enableSlowMo! ? 1500 : 400,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: () {
        widget.onTap!();
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              if (isPlaying) {
                _animationController.reverse();
                setState(() {
                  isPlaying = false;
                });
              } else {
                _animationController.forward();
                setState(() {
                  isPlaying = true;
                });
              }
              if (widget.onTap != null) widget.onTap!();
            },
            child: Container(
              width: widget.width ?? double.infinity,
              height: widget.height,
              alignment: Alignment.center,
              decoration: !widget.outline
                  ? BoxDecoration(
                      color: widget.iconOnly!
                          ? Colors.transparent
                          : !widget.disabled
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    )
                  : BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: widget.iconOnly!
                            ? Colors.transparent
                            : Theme.of(context).primaryColor,
                        width: 1.5,
                      ),
                    ),
              child: !widget.busy
                  ? AnimatedIcon(
                      icon: widget.icon!,
                      progress: _animationController,
                      semanticLabel: 'Show menu',
                      color: widget.outline || widget.iconOnly!
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                    )
                  : SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
