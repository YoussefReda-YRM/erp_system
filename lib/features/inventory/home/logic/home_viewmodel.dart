import 'package:erp_system/features/auth/login/ui/login_view.dart';
import 'package:erp_system/features/inventory/home/ui/home_view.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeViewModel extends Cubit {
  HomeViewModel() : super(MainInitialState());
  int currentTabIndex = 0;
  final List<Widget> tabs = [
     HomeView(),
     LoginView(),
     HomeView(),
     HomeView(),
  ];

  void changeSelectedTab(int newIndex) {
    currentTabIndex = newIndex;
    emit(MainInitialState());
  }
}

class MainInitialState {}
