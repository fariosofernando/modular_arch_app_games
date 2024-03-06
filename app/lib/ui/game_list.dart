import 'package:fiesta_system/fiesta_system.dart';
import 'package:flutter/material.dart';
import '../models/game.dart';
import 'details.dart';
import '../repositories/game_repository.dart';
import 'components/game_image_card.dart';
import 'components/games_grid_view.dart';
import 'package:provider/provider.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool isDarkMode = false;

  openDetails(Game game) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => GameDetailsPage(game: game)),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier =
        Provider.of<ThemeNotifier>(context, listen: true);

    if (themeNotifier.currentThemeMode == ThemeMode.dark) {
      isDarkMode = true;
    } else if (themeNotifier.currentThemeMode == ThemeMode.light) {
      isDarkMode = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Games'),
        systemOverlayStyle: FiestaSystem.systemUiOverlayStyle(context),
        actions: [
          IconButton(
            onPressed: () {
              if (isDarkMode) {
                themeNotifier.toggleTheme(ThemeMode.light.name);
              } else {
                themeNotifier.toggleTheme(ThemeMode.dark.name);
              }
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: isDarkMode
                  ? const Icon(
                      Icons.brightness_2,
                      key: ValueKey('moon'),
                    )
                  : const Icon(
                      Icons.wb_sunny,
                      key: ValueKey('sun'),
                    ),
            ),
          ),
        ],
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
