import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/controller/services/switch.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(myNotifierProvider);
    return Scaffold(
      body: SafeArea(
        child: Consumer(builder: (context, ref, _) {
          return Center(
            child: Switch(
              value: value,
              onChanged: (value) {
                ref.read(myNotifierProvider.notifier).toggle();
              },
            ),
          );
        }),
      ),
    );
  }
}
