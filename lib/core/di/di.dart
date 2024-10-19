import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tech_tide/core/utils/app_preferences.dart';
import 'package:tech_tide/features/auth/data/data_source/auth_data_source.dart';
import 'package:tech_tide/features/auth/data/repo/auth_repo_impl.dart';
import 'package:tech_tide/features/auth/domain/repo/auth_repository.dart';
import 'package:tech_tide/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tech_tide/features/home_layout/presentation/provider/layout_controller.dart';

part 'di.main.dart';
