import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasources/local/local_db_service.dart';
import '../../data/datasources/local/local_db_service_impl.dart';

RepositoryProvider<LocalDbService> get localDbProvider =>
    RepositoryProvider<LocalDbService>(create: (_) => LocalDbServiceImpl());
