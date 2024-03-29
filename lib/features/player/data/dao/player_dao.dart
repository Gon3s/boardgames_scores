import 'package:floor/floor.dart';

import '../models/player.dart';

@dao
abstract class PlayerDao {
  @Query('SELECT * FROM player')
  Future<List<Player>> findAllPlayers();

  @Query('SELECT * FROM player WHERE id = :id')
  Future<Player?> findPlayerById(int id);

  @Query('SELECT * FROM player WHERE name = :name AND id != :id')
  Future<Player?> findPlayerByName(int id, String name);

  @insert
  Future<int> insertPlayer(Player player);

  @update
  Future<void> updatePlayer(Player player);

  @delete
  Future<void> deletePlayer(Player player);
}
