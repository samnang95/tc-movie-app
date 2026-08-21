import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/custom_bottom_nav_bar.dart';
import '../../shared/widgets/x_scaffold.dart';

class DashboardPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const DashboardPage({
    super.key,
    required this.navigationShell,
  });

  void _onNavigationItemSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return XScaffold(
      useSafeArea: false,
      body: Stack(
        children: [
          // Content of the current tab
          navigationShell,

          // Floating Bottom Navigation Bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomBottomNavBar(
              currentIndex: navigationShell.currentIndex,
              onTap: _onNavigationItemSelected,
            ),
          ),
        ],
      ),
    );
  }
}
