import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/values_manager.dart';

class EventImageWidget extends StatelessWidget {
  const EventImageWidget({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          const BorderRadius.vertical(top: Radius.circular(AppSize.s16)),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: double.infinity,
        height: AppSize.s160,
        fit: BoxFit.cover,
      ),
    );
  }
}
