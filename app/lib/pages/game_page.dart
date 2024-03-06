import 'package:flutter/material.dart';
import '../models/game.dart';
import 'game_details_page.dart';
import '../repositories/game_repository.dart';
import '../widgets/game_image_card.dart';
import '../widgets/games_grid_view.dart';
import 'package:provider/provider.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  openDetails(Game game) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => GameDetailsPage(game: game)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Games'),
      ),
      body: Consumer<GameRepository>(
        builder: (context, repository, _) => repository.games.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GamesGridView(
                games: List.from(
                  repository.games.map(
                    (Game game) => GameImageCard(
                      game: game,
                      onTap: () => openDetails(game),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
