import 'package:fiesta_system/fiesta_system.dart';
import 'package:flutter/material.dart';
import 'package:games_plus/app.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'repositories/game_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  timeago.setLocaleMessages('pt_BR', timeago.PtBrShortMessages());

  await Hive.initFlutter();
  if (!Hive.isBoxOpen('game_cache')) {
    await Hive.openBox('game_cache');
  }

  var box = await FiestaSystem.moduleInitializer();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifier(box)),
        
        ChangeNotifierProvider(
          create: (context) => GameRepository(),
        ),
      ],
      child: const App(),
    ),
  );
}
