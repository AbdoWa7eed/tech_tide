import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/widgets/error_view.dart';
import 'package:tech_tide/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:tech_tide/features/profile/presentation/widgets/profile_header_widget.dart';
import 'package:tech_tide/features/profile/presentation/widgets/profile_view_body.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tide/core/data/data_source/chats_data_source.dart';
import 'package:tech_tide/core/res/assets_manager.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/font_manager.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileCubit, ProfileState>(
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
    );
  }
}
