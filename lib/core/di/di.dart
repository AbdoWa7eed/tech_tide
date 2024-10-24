import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tech_tide/core/data/data_source/posts_data_source.dart';
import 'package:tech_tide/core/data/data_source/user_data_source.dart';
import 'package:tech_tide/core/utils/app_preferences.dart';
import 'package:tech_tide/features/add_post/data/data_source/add_post_data_source.dart';
import 'package:tech_tide/features/add_post/data/repo/add_post_repo_impl.dart';
import 'package:tech_tide/features/add_post/domain/repo/add_post_repo.dart';
import 'package:tech_tide/features/add_post/presentation/cubit/add_post_cubit.dart';
import 'package:tech_tide/features/auth/data/data_source/auth_data_source.dart';
import 'package:tech_tide/features/auth/data/repo/auth_repo_impl.dart';
import 'package:tech_tide/features/auth/domain/repo/auth_repository.dart';
import 'package:tech_tide/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tech_tide/features/events/data/data_source/events_data_source.dart';
import 'package:tech_tide/features/events/data/repo/events_repo_impl.dart';
import 'package:tech_tide/features/events/domain/repo/events_repo.dart';
import 'package:tech_tide/features/events/presentation/cubit/events_cubit.dart';
import 'package:tech_tide/features/home/data/data_source/home_data_source.dart';
import 'package:tech_tide/features/home/data/repo/home_repo_impl.dart';
import 'package:tech_tide/features/home/domain/repo/home_repo.dart';
import 'package:tech_tide/features/home/presentation/cubit/home_cubit.dart';
import 'package:tech_tide/features/home_layout/data/repo/user_repo_impl.dart';
import 'package:tech_tide/features/home_layout/domain/repo/user_repo.dart';
import 'package:tech_tide/features/home_layout/presentation/cubit/layout_cubit.dart';
import 'package:tech_tide/features/manage_post/data/data_source/manage_post_data_source.dart';
import 'package:tech_tide/features/manage_post/data/repo/manage_post_repo_impl.dart';
import 'package:tech_tide/features/manage_post/domain/repo/manage_post_repo.dart';
import 'package:tech_tide/features/manage_post/presentation/cubit/manage_post_cubit.dart';
import 'package:tech_tide/features/popular_topic/data/data_source/popular_topic_data_source.dart';
import 'package:tech_tide/features/popular_topic/data/repo/popular_topic_repo_impl.dart';
import 'package:tech_tide/features/popular_topic/domain/repo/popular_topic_repo.dart';
import 'package:tech_tide/features/popular_topic/presentation/cubit/popular_topic_cubit.dart';
import 'package:tech_tide/features/post_details/data/data_source/post_details_data_source.dart';
import 'package:tech_tide/features/post_details/data/repo/post_details_repo_impl.dart';
import 'package:tech_tide/features/post_details/domain/repo/post_details_repo.dart';
import 'package:tech_tide/features/post_details/presentation/cubit/post_details_cubit.dart';
import 'package:tech_tide/features/profile/data/data_source/profile_data_source.dart';
import 'package:tech_tide/features/profile/data/repo/profile_repo_impl.dart';
import 'package:tech_tide/features/profile/domain/repo/profile_repo.dart';
import 'package:tech_tide/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:tech_tide/features/update_profile/data/data_source/update_profile_data_source.dart';
import 'package:tech_tide/features/update_profile/data/repo/update_profile_repo_impl.dart';
import 'package:tech_tide/features/update_profile/domain/repo/update_profile_repo.dart';
import 'package:tech_tide/features/update_profile/presentation/cubit/update_profile_cubit.dart';

part 'di.main.dart';
