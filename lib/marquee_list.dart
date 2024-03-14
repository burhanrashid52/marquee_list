library marquee_list;

import 'dart:async';

import 'package:flutter/material.dart';

class MarqueeList extends StatefulWidget {
  const MarqueeList({
    super.key,
    required this.children,
    this.scrollDuration = const Duration(seconds: 1),
    this.scrollDirection = Axis.horizontal,
  });

  final List<Widget> children;
  final Duration scrollDuration;
  final Axis scrollDirection;

  @override
  _MarqueeListState createState() => _MarqueeListState();
}

class _MarqueeListState extends State<MarqueeList> {
  late final _scrollController = ScrollController();
  late Timer _timer;
  double _scrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = itemSize;
      _timer = Timer.periodic(widget.scrollDuration, (_) {
        if (isScrollAvailable(size)) {
          if (isScrollLeft) {
            _moveForward();
          } else {
            _resetToStart();
          }
        }
      });
    });
  }

  bool isScrollAvailable(double size) =>
      _scrollPosition < size * widget.children.length;

  bool get isScrollLeft =>
      _scrollPosition < _scrollController.position.maxScrollExtent;

  double get itemSize => scrollDirection == Axis.horizontal
      ? context.size!.width
      : context.size!.height;

  void _moveForward() {
    _scrollPosition += 100;
    _scrollController.animateTo(
      _scrollPosition,
      duration: widget.scrollDuration,
      curve: Curves.linear,
    );
  }

  void _resetToStart() {
    _scrollPosition = 0.0;
    _scrollController.animateTo(
      _scrollPosition,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  Axis get scrollDirection => widget.scrollDirection;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: scrollDirection,
      controller: _scrollController,
      child: switch (scrollDirection) {
        Axis.horizontal => Row(children: widget.children),
        Axis.vertical => Column(children: widget.children),
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }
}
