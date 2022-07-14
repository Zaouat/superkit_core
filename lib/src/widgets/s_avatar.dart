import 'package:flutter/material.dart';
import 'package:superkit_core/src/shared/constants.dart';
import 'package:superkit_core/src/widgets/custom_ui/image_loading_builder.dart';
import 'package:superkit_core/superkit_core.dart';

class SuperKitAvatar extends StatelessWidget {
  const SuperKitAvatar({
    super.key,
    this.radius,
    this.image = avatar,
  });

  final double? radius;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return image!.contains('http')
        ? ClipRRect(
            borderRadius: BorderRadius.circular(120),
            child: SizedBox(
              height: radius!,
              width: radius,
              child: Image.network(
                image!,
                fit: BoxFit.cover,
                loadingBuilder: (
                  BuildContext? context,
                  Widget? child,
                  ImageChunkEvent? loadingProgress,
                ) {
                  if (loadingProgress == null) {
                    return child!;
                  } else {
                    return ImageLoading(
                      height: radius!,
                      width: radius,
                    );
                  }
                },
                errorBuilder: (
                  BuildContext? context,
                  Object? exception,
                  StackTrace? stackTrace,
                ) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(120),
                    child: Container(
                      color: Colors.red.withOpacity(0.5),
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
          )
        : SizedBox(
            width: radius,
            height: radius!,
            child: Image.asset(
              image!,
              fit: BoxFit.cover,
            ),
          );
  }
}
