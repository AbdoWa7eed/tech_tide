import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_tide/core/res/assets_manager.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';

class AddReplyFormField extends StatelessWidget {
  const AddReplyFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
          vertical: AppPadding.p18,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: TextFormField(
                minLines: 1,
                maxLines: null,
                style: StylesManager.regular14,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p12),
                  filled: true,
                  fillColor: ColorManager.white,
                  hintText: AppStrings.addReply.translate,
                  hintStyle: StylesManager.regular12,
                ),
              ),
            ),
            const SizedBox(width: AppSize.s12),
            IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(
                  backgroundColor: ColorManager.primary,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppSize.s8),
                    ),
                  ),
                  maximumSize: const Size(AppSize.s40, AppSize.s40),
                ),
                icon: SvgPicture.asset(AssetsManager.sendIcon)),
          ],
        ),
      ),
    );
  }
}
