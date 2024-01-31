import 'package:app_buy_sell/src/features/home/application/app_service.dart';
import 'package:app_buy_sell/src/features/home/domain/app_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_list_provider.g.dart';

@riverpod
class AppList extends _$AppList {
  final AppService _appService = AppService();

  @override
  FutureOr<List<AppModel>> build() async {
    return _initData();
  }

  Future<List<AppModel>> _initData() async {
    final response = await _appService.getApps();
    final data = response.$1;
    return data;
  }

  Future<void> getApps() async {
    state = const AsyncValue.loading();
    try {
      final response = await _appService.getApps();
      final data = response.$1;
      state = AsyncValue.data(data);
    } catch (err, stack) {
      state = AsyncValue.error(err, stack);
    }
  }
}
