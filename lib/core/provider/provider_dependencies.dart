import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../api/master_api_service.dart';
import '../db/common/database_helper.dart';

List<SingleChildWidget> providers = <SingleChildWidget>[
  ...independentProviders,
  ..._dependentProviders,
];

List<SingleChildWidget> independentProviders = <SingleChildWidget>[
  Provider<DatabaseHelper>.value(value: DatabaseHelper.instance),
  Provider<MasterApiService>.value(value: MasterApiService()),
];

List<SingleChildWidget> _dependentProviders = <SingleChildWidget>[];
