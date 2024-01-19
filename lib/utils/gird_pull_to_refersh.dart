import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridPullToRefresh extends StatefulWidget {
  const GridPullToRefresh({
    super.key,
    required this.onRefresh,
    this.enableRefresh = true,
    this.enableLoadMore = false,
    required this.gridDelegate,
    required this.itemBuilder,
    required this.itemCount,
    this.bottomInset = 0,
    this.scrollController,
    this.onLoadMore,
  });

  final Future<void> Function() onRefresh;
  final Future<void> Function()? onLoadMore;

  final bool enableRefresh;
  final bool enableLoadMore;
  final SliverGridDelegate gridDelegate;
  final Widget? Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final double bottomInset;
  final ScrollController? scrollController;

  @override
  State<GridPullToRefresh> createState() => _GridPullToRefreshState();
}

class _GridPullToRefreshState extends State<GridPullToRefresh> {
  late ScrollController _scrollController;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.scrollController == null) {
      _scrollController = ScrollController();
    } else {
      _scrollController = widget.scrollController!;
    }
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    if (!_scrollController.hasClients ||
        _isLoading ||
        !widget.enableLoadMore ||
        widget.itemCount == 0 ||
        !mounted) {
      return;
    }

    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 50) {
      if (widget.onLoadMore != null) {
        _isLoading = true;
        setState(() {});
        await widget.onLoadMore!();
        if (!mounted) {
          return;
        }
        _isLoading = false;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CupertinoActivityIndicator(
                    color: Colors.white,
                    radius: 16,
                  ),
                ),
              );
            },
          ),
        SliverGrid.builder(
          gridDelegate: widget.gridDelegate,
          itemBuilder: widget.itemBuilder,
          itemCount: widget.itemCount,
        ),
        SliverToBoxAdapter(
          child: widget.enableLoadMore
              ? Container(
                  padding: const EdgeInsets.only(top: 16),
                  alignment: Alignment.center,
                  child: const CupertinoActivityIndicator(),
                )
              : const SizedBox(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: widget.bottomInset,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(_onScroll);
  }
}
