import 'package:injectable/injectable.dart';

import 'package:app_user/module/sync/sync_cubit.dart';

@module
abstract class SyncInjectableModule {
  @Injectable()
  SyncCubit get syncs;
}
