import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sliverListTouchProvider = StateProvider<bool>((ref) {
  return false;
});

class SliverListPullToRefresh extends ConsumerStatefulWidget {
  const SliverListPullToRefresh({
    super.key,
    required this.onRefresh,
    this.enableRefresh = true,
    this.enableLoadMore = false,
    required this.children,
    this.bottomInset = 0,
    this.scrollController,
    this.onLoadMore,
    this.indicatorColor = Colors.black,
  });

  final Future<void> Function() onRefresh;
  final Future<void> Function()? onLoadMore;

  final bool enableRefresh;
  final bool enableLoadMore;
  final double bottomInset;
  final ScrollController? scrollController;
  final Color indicatorColor;

  final List<Widget> children;

  @override
  SliverListPullToRefreshState createState() => SliverListPullToRefreshState();
}

class SliverListPullToRefreshState
    extends ConsumerState<SliverListPullToRefresh> {
  late ScrollController _scrollController;

  LoadMoreState _state = LoadMoreState.idle;

  bool _isTouch = false;

  ProviderSubscription<bool>? touchListener;

  @override
  void initState() {
    super.initState();
    if (widget.scrollController == null) {
      _scrollController = ScrollController();
    } else {
      _scrollController = widget.scrollController!;
    }
    _scrollController.addListener(_onScroll);

    touchListener =
        ref.listenManual(sliverListTouchProvider, (previous, isTouch) async {
      if (!isTouch && widget.onLoadMore != null && mounted) {
        if (_state == LoadMoreState.willLoadmore) {
          _state = LoadMoreState.loading;
          await widget.onLoadMore!();
          await Future.delayed(const Duration(milliseconds: 500));
          if (!mounted) {
            return;
          }
          _state = LoadMoreState.idle;
          setState(() {});
        }
      }
    });
  }

  void _onScroll() async {
    if (!_scrollController.hasClients ||
        _state == LoadMoreState.loading ||
        !widget.enableLoadMore ||
        !mounted) {
      return;
    }

    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 50 &&
        _scrollController.position.pixels > 0) {
      if (widget.onLoadMore != null) {
        if (_isTouch) {
          _state = LoadMoreState.willLoadmore;
          setState(() {});
        } else {
          _state = LoadMoreState.loading;
          await widget.onLoadMore!();
          await Future.delayed(const Duration(milliseconds: 500));
          if (!mounted) {
            return;
          }
          _state = LoadMoreState.idle;
          setState(() {});
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        _isTouch = true;
        ref.watch(sliverListTouchProvider.notifier).state = true;
      },
      onPointerUp: (event) {
        _isTouch = false;
        ref.watch(sliverListTouchProvider.notifier).state = false;
      },
      child: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          if (widget.enableRefresh)
            CupertinoSliverRefreshControl(
              onRefresh: () async {
                setState(() {});
                await widget.onRefresh();
                await Future.delayed(const Duration(seconds: 1));
                if (!mounted) {
                  return;
                }
                setState(() {});
              },
              builder: (_, __, ___, ____, _____) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CupertinoActivityIndicator(
                      color: widget.indicatorColor,
                      radius: 16,
                    ),
                  ),
                );
              },
            ),
          ...widget.children,
          SliverToBoxAdapter(
            child: (_state == LoadMoreState.loading ||
                    _state == LoadMoreState.willLoadmore)
                ? Container(
                    padding: const EdgeInsets.all(20.0),
                    alignment: Alignment.center,
                    child: CupertinoActivityIndicator(
                      color: widget.indicatorColor,
                    ),
                  )
                : const SizedBox(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: widget.bottomInset,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    touchListener?.close();
    _scrollController.removeListener(_onScroll);
  }
}

enum LoadMoreState { idle, willLoadmore, loading }
