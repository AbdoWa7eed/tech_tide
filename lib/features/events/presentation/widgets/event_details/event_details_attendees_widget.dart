import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/di/di.dart';
import 'package:tech_tide/core/entities/user_entity.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/utils/app_preferences.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/utils/local_manager.dart';
import 'package:tech_tide/core/widgets/circled_network_image.dart';
import 'package:tech_tide/features/events/presentation/cubit/events_cubit.dart';

class AttendeesWidget extends StatefulWidget {
  const AttendeesWidget({super.key, required this.users});

  final List<UserEntity> users;

  @override
  State<AttendeesWidget> createState() => _AttendeesWidgetState();
}

class _AttendeesWidgetState extends State<AttendeesWidget> {
  late String language;
  @override
  void initState() {
    language = ServiceLocator.get<AppPreferences>().appLanguageCode();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    language = ServiceLocator.get<AppPreferences>().appLanguageCode();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventsCubit, EventsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.going.translate,
                style: StylesManager.semiBold16Black),
            const SizedBox(height: AppSize.s8),
            SizedBox(
              height: AppSize.s50,
              child: Row(
                children: [
                  Directionality(
                    textDirection: language == LanguageType.english.value
                        ? TextDirection.ltr
                        : TextDirection.rtl,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount:
                          widget.users.length <= 4 ? widget.users.length : 4,
                      itemBuilder: (context, index) {
                        return CircledNetworkImage(
                          radius: AppSize.s22,
                          imageUrl: widget.users[index].imageUrl,
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        width: AppSize.s8,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !(widget.users.length <= 4),
                    child: CircleAvatar(
                      radius: AppSize.s22,
                      backgroundColor: Colors.blue,
                      child: Text('${widget.users.length - 4}',
                          style: StylesManager.semiBold16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
