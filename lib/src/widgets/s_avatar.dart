import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class SuperKitAvatar extends StatelessWidget {
  const SuperKitAvatar({
    super.key,
    this.radius,
    this.image = avatar,
    this.toolTip = 'Avatar',
    this.onTap,
  });

  final double? radius;
  final String? image;
  final String? toolTip;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return image!.contains('http')
        ? InkWell(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              onTap!();
            },
            child: Tooltip(
              message: toolTip!,
              child: ScaleTap(
                onPressed: () {
                  onTap!();
                },
                child: CircleAvatar(
                  radius: radius!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(120),
                    child: Image.network(
                      image!,
                      fit: BoxFit.cover,
                      errorBuilder: (
                        BuildContext? context,
                        Object? exception,
                        StackTrace? stackTrace,
                      ) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(120),
                          child: CircleAvatar(
                            radius: radius!,
                            backgroundColor: Colors.red.withOpacity(0.2),
                            child: const Center(
                              child: Icon(
                                IconlyBroken.profile,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          )
        : InkWell(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              onTap!();
            },
            child: Tooltip(
              message: toolTip!,
              child: ScaleTap(
                onPressed: () {
                  onTap!();
                },
                child: CircleAvatar(
                  radius: radius!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(120),
                    child: Image.asset(
                      image!,
                      fit: BoxFit.cover,
                      errorBuilder: (
                        BuildContext? context,
                        Object? exception,
                        StackTrace? stackTrace,
                      ) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(120),
                          child: Container(
                            color: Colors.red.withOpacity(0.2),
                            child: const Center(
                              child: Icon(
                                IconlyBroken.profile,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
