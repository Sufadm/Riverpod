import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyNotifier extends StateNotifier<bool> {
  MyNotifier() : super(false);

  void toggle() {
    state = !state;
  }
}

final myNotifierProvider = StateNotifierProvider<MyNotifier, bool>((ref) {
  return MyNotifier();
});
