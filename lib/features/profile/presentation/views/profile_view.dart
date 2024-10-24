import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tide/core/routes/routes_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/custom_snack_bar.dart';
import 'package:tech_tide/core/widgets/error_view.dart';
import 'package:tech_tide/core/widgets/gradiant_app_bar.dart';
import 'package:tech_tide/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:tech_tide/features/profile/presentation/widgets/profile_header_widget.dart';
import 'package:tech_tide/features/profile/presentation/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          context.read<ProfileCubit>().getProfile();
        }
      },
      child: Scaffold(
        appBar: context.canPop() ? const GradientAppBar(title: '') : null,
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is LogoutSuccess) {
              context.popAllThenPush(Routes.loginRoute);
            }
            if (state is LogoutError) {
              CustomSnackBar.error(state.message, context);
            }
          },
          builder: (context, state) {
            final cubit = context.read<ProfileCubit>();
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProfileError) {
              return ErrorViewWidget(
                error: state.message,
                onTryAgain: () => cubit.getProfile(),
              );
            }
            return RefreshIndicator(
              onRefresh: () async => cubit.getProfile(),
              displacement: 1,
              child: const SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    ProfileHeaderWidget(),
                    ProfileViewBody(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
