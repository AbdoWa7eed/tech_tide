import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tide/core/di/di.dart';
import 'package:tech_tide/core/widgets/slide_transition.dart';
import 'package:tech_tide/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tech_tide/features/auth/presentation/views/login_view.dart';
import 'package:tech_tide/features/auth/presentation/views/signup_view.dart';
import 'package:tech_tide/features/home/presentation/cubit/home_cubit.dart';
import 'package:tech_tide/features/home_layout/presentation/cubit/layout_cubit.dart';
import 'package:tech_tide/features/home_layout/presentation/views/home_layout.dart';
import 'package:tech_tide/features/manage_post/presentation/cubit/manage_post_cubit.dart';
import 'package:tech_tide/features/onboarding/views/onboarding_view.dart';
import 'package:tech_tide/features/popular_topic/presentation/cubit/popular_topic_cubit.dart';
import 'package:tech_tide/features/post_details/presentation/cubit/post_details_cubit.dart';
import 'package:tech_tide/features/splash/presentation/splash_view.dart';

import '../../features/event_details/presentation/views/event_details_view.dart';
import '../../features/popular_topic/presentation/views/popular_topic_view.dart';
import '../../features/post_details/presentation/views/post_details_view.dart';

part 'routes_manager.main.dart';
