import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../shared/widgets/x_scaffold.dart';
import '../../home/widgets/home_top_bar.dart';
import '../../home/widgets/home_section_header.dart';
import '../widgets/search_bar.dart' as search_widgets;
import '../widgets/search_category_grid.dart';
import '../widgets/search_recommended.dart';
import '../widgets/search_trending_chips.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return XScaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Top bar (reuse from home) ──
            const HomeTopBar(),

            const SizedBox(height: 8),

            // ── Search bar ──
            const search_widgets.SearchBar(),

            const SizedBox(height: 28),

            // ── Browse Categories ──
            HomeSectionHeader(title: 'browse_categories'.getString(context)),
            const SizedBox(height: 14),
            const SearchCategoryGrid(),

            const SizedBox(height: 28),

            // ── Recommended for You ──
            HomeSectionHeader(
              title: 'recommended_for_you'.getString(context),
              showViewAll: true,
            ),
            const SizedBox(height: 14),
            const SearchRecommended(),

            const SizedBox(height: 28),

            // ── Trending Searches ──
            HomeSectionHeader(title: 'trending_searches'.getString(context)),
            const SizedBox(height: 14),
            const SearchTrendingChips(),

            // Extra padding for the floating nav bar
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
