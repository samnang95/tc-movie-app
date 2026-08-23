import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../domain/search/entities/search_item.dart';
import '../../shared/widgets/x_text.dart';
import '../bloc/search_bloc.dart';
import '../bloc/search_state.dart';

class SearchRecommended extends StatelessWidget {
  const SearchRecommended({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state.status == SearchStatus.loading) {
          return const SizedBox(
            height: 260,
            child: Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        }

        final items = state.recommended;
        if (items.isEmpty) {
          return const SizedBox(height: 260);
        }

        return SizedBox(
          height: 260,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              final item = items[index];
              return _buildRecommendedCard(context, item);
            },
          ),
        );
      },
    );
  }

  // Gradient colors per item index for visual variety
  static const _gradients = [
    [Color(0xFFCC2233), Color(0xFF330A0E)],
    [Color(0xFF2A3A5C), Color(0xFF0D1321)],
    [Color(0xFF4A2D7A), Color(0xFF1A0A3E)],
    [Color(0xFF8B3A2A), Color(0xFF2D1008)],
  ];

  Widget _buildRecommendedCard(BuildContext context, SearchItem item) {
    final colors = _gradients[(item.id - 1) % _gradients.length];

    return SizedBox(
      width: 170,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Poster
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: colors,
                    ),
                    border: Border.all(
                      color: AppColors.white.withValues(alpha: 0.06),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.movie_creation_outlined,
                      color: AppColors.white.withValues(alpha: 0.12),
                      size: 48,
                    ),
                  ),
                ),

                // Badges row
                Positioned(
                  top: 10,
                  right: 10,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (item.is4K)
                        _buildBadge('4K', AppColors.white.withValues(alpha: 0.20)),
                      if (item.is4K && item.isNew) const SizedBox(width: 6),
                      if (item.isNew)
                        _buildBadge('NEW', AppColors.primary),
                    ],
                  ),
                ),

                // Bottom gradient overlay
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(12),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.transparent,
                          Colors.black.withValues(alpha: 0.60),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Title
          XText(
            item.title,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 3),

          // Genre • Duration
          XText(
            '${item.genre} • ${item.duration}',
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, Color bgColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: XText(
        text,
        fontSize: 9,
        fontWeight: FontWeight.w800,
        color: AppColors.white,
        letterSpacing: 0.5,
      ),
    );
  }
}
