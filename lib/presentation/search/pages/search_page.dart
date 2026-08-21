import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../../core/constants/app_colors.dart';
import '../../shared/widgets/x_scaffold.dart';
import '../../shared/widgets/x_text.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return XScaffold(
      body: Center(
        child: XText(
          'nav_search'.getString(context),
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.white,
        ),
      ),
    );
  }
}
