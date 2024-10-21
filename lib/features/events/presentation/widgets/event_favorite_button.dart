import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';

class FavoriteButton extends StatefulWidget {
  final bool isFavorite;
  final VoidCallback? onPressed;

  const FavoriteButton({
    super.key,
    required this.isFavorite,
    this.onPressed,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late bool isFavorite;
  @override
  void initState() {
    isFavorite = widget.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.star_rate_rounded : Icons.star_border_rounded,
        size: AppSize.s24,
        fill: isFavorite ? 1 : null,
        color: isFavorite ? ColorManager.deepTeal : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          widget.onPressed?.call();
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
