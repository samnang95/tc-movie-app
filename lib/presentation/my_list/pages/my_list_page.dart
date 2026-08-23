import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_colors.dart';
import '../../shared/widgets/x_text.dart';
import '../../shared/widgets/x_loading_indicator.dart';
import '../../../core/di/injection.dart';
import '../bloc/my_list_bloc.dart';
import '../bloc/my_list_event.dart';
import '../bloc/my_list_state.dart';
import '../widgets/movie_detail_widgets.dart';

class MyListPage extends StatelessWidget {
  const MyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MyListBloc>()..add(LoadMyListMovieEvent()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: BlocBuilder<MyListBloc, MyListState>(
          builder: (context, state) {
            if (state is MyListLoading || state is MyListInitial) {
              return const Center(child: XLoadingIndicator());
            } else if (state is MyListError) {
              return Center(
                child: XText(state.message, color: AppColors.primary),
              );
            } else if (state is MyListLoaded) {
              final movie = state.movie;
              return CustomScrollView(
                slivers: [
                  MovieHeroAppBar(movie: movie),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          MovieBadges(movie: movie),
                          const SizedBox(height: 12),
                          XText(
                            movie.title,
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                          ),
                          const SizedBox(height: 12),
                          MovieMetadata(movie: movie),
                          const SizedBox(height: 24),
                          const MovieActionButtons(),
                          const SizedBox(height: 36),
                          MovieSynopsis(movie: movie),
                          const SizedBox(height: 36),
                          MovieCastSection(movie: movie),
                          const SizedBox(height: 36),
                          RelatedMoviesSection(movie: movie),
                          // Extra padding for the floating nav bar
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
