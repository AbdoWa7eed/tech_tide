import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tech_tide/core/di/di.dart';
import 'package:tech_tide/core/entities/user_entity.dart';
import 'package:tech_tide/features/home_layout/domain/repo/user_repo.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit(this._userRepository) : super(LayoutInitial());

  final UserRepository _userRepository;

  int _currentIndex = 0;
  final PageController pageController = PageController();

  void setIndex(int index) {
    _currentIndex = index;
    if (index != 2) {
      pageController.jumpToPage(index);
    }
    emit(state);
  }

  int get index => _currentIndex;

  late final UserEntity user;

  void loadUser() async {
    emit(LayoutLoading());
    final result = await _userRepository.getUser();
    result.fold(
      (failure) {
        emit(LayoutError(failure.message));
      },
      (user) {
        this.user = user;
        emit(LayoutLoaded(user));
      },
    );
  }

  @override
  Future<void> close() {
    ServiceLocator.unregister<LayoutCubit>();
    return super.close();
  }
}
