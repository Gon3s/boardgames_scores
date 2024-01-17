import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_generic_app/features/config/data/repositories/config_repository_impl.dart';

import '../../data/provider/local_datasource_provider.dart';
import '../repositories/config_repository.dart';

final configRepositoryProvider = Provider<ConfigRepository>((ref) {
  final localDatasource = ref.watch(localDataSourceProvider);
  return ConfigRepositoryImpl(localDataSource: localDatasource);
});