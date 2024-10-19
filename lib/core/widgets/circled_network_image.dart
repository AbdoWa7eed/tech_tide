import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/assets_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';

class CircledNetworkImage extends StatelessWidget {
  const CircledNetworkImage({
    super.key,
    required this.imageUrl,
    this.radius = AppSize.s20,
  });

  final String imageUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return CircleAvatar(
          backgroundImage: imageProvider,
          radius: radius,
        );
      },
      errorWidget: (context, url, error) {
        return CircleAvatar(
          radius: radius,
          backgroundImage: const AssetImage(AssetsManager.userImagePlaceholder),
        );
      },
    );
  }
}
