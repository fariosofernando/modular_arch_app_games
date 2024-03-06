library cache_module;

import 'package:hive_flutter/hive_flutter.dart';

export 'cache_module.dart' show GameCache;

class GameCache {
  static final _instance = GameCache._internal();

  GameCache._internal();

  factory GameCache.init() {
    return _instance;
  }

  factory GameCache() {
    return _instance;
  }

  String read(String url) {
    Box cache = Hive.box('game_cache');

    return cache.get(url) ?? '';
  }

  write(String url, String data) {
    Box cache = Hive.box('game_cache');

    cache.put(url, data);
  }
}
