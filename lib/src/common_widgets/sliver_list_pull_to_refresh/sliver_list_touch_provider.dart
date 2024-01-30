import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sliver_list_touch_provider.g.dart';

@riverpod
class SliverListTouch extends _$SliverListTouch {
  @override
  bool build() {
    return false;
  }

  void setTouch(bool touch) {    
    state = touch;
  }
}
