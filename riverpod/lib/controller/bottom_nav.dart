import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/home/api_list_page.dart';
import 'package:riverpodproject/home/homepage.dart';
import 'package:riverpodproject/home/profile_page.dart';

final bottomNavStateProvider =
    StateNotifierProvider<BottomNavState, int>((ref) {
  return BottomNavState();
});

class BottomNavState extends StateNotifier<int> {
  BottomNavState() : super(0);

  void onItemTapped(int index) {
    state = index;
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const ApiList(),
    const ProfilePage(),
  ];

  List<Widget> get widgetOptions => _widgetOptions;
}
