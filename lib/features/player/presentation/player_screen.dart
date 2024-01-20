import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/presentation/widgets/scaffold_widget.dart';
import '../../game/domain/entities/game.dart';
import '../domain/entities/player.dart';
import '../domain/usecases/get_player.dart';

class PlayerScreen extends ConsumerWidget {
  const PlayerScreen({super.key, required this.game});

  final GameEntity game;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final players = ref.watch(getPlayersFutureProvider);

    return SafeArea(
      child: ScaffoldWidget(
        title: const Text('Title'),
        displayAppBar: true,
        appBarDisplayLeading: true,
        appBarOnLeadingPressed: () => context.pop(true),
        body: players.when(
          data: (players) => _ContentPlayerScreen(players: players),
          error: (_, error) => Center(child: Text(error.toString())),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        displayBottomNavigationBar: false,
      ),
    );
  }
}

class _ContentPlayerScreen extends StatelessWidget {
  const _ContentPlayerScreen({
    required this.players,
  });

  final List<PlayerEntity> players;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Select a player'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, index) {
              final player = players[index];
              return ListTile(title: Text(player.name));
            },
          ),
        ),
      ],
    );
  }
}