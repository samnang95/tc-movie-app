import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../auth/sign_out/bloc/sign_out_bloc.dart';
import '../../auth/sign_out/bloc/sign_out_event.dart';
import '../../auth/sign_out/bloc/sign_out_state.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignOutBloc, SignOutState>(
      listener: (context, state) {
        if (state.status == SignOutStatus.success) {
          context.go('/sign-in');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () => context
                  .read<HomeBloc>()
                  .add(const HomeDataRequested()),
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => context
                  .read<SignOutBloc>()
                  .add(const SignOutRequested()),
            ),
          ],
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            // Loading state
            if (state.status == HomeStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            // Failure state
            if (state.status == HomeStatus.failure) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 48,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        state.errorMessage,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 16),
                      FilledButton.icon(
                        onPressed: () => context
                            .read<HomeBloc>()
                            .add(const HomeDataRequested()),
                        icon: const Icon(Icons.refresh),
                        label: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              );
            }

            // Empty state
            if (state.items.isEmpty) {
              return const Center(child: Text('No data found'));
            }

            // Loaded state
            return RefreshIndicator(
              onRefresh: () async => context
                  .read<HomeBloc>()
                  .add(const HomeDataRequested()),
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: state.items.length,
                separatorBuilder: (_, _) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final item = state.items[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(item.name[0].toUpperCase()),
                    ),
                    title: Text(item.name),
                    subtitle: Text(item.email),
                    trailing: const Icon(Icons.chevron_right),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
