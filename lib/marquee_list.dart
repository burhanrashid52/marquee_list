library marquee_list;

import 'dart:async';

import 'package:flutter/material.dart';

class MarqueeList extends StatefulWidget {
  const MarqueeList({
    super.key,
    required this.children,
    this.scrollDuration = const Duration(seconds: 1),
  });

  final List<Widget> children;
  final Duration scrollDuration;

  @override
  _MarqueeListState createState() => _MarqueeListState();
}

class _MarqueeListState extends State<MarqueeList> {
  late final _scrollController = ScrollController();
  late Timer _timer;
  double _scrollPosition = 0.0;
  double _itemWidth = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _itemWidth = context.size!.width;
      _timer = Timer.periodic(widget.scrollDuration, (_) {
        if (_scrollPosition < _itemWidth * widget.children.length) {
          if (_scrollPosition < _scrollController.position.maxScrollExtent) {
            _scrollPosition += 100;
            _scrollController.animateTo(
              _scrollPosition,
              duration: widget.scrollDuration,
              curve: Curves.linear,
            );
          } else {
            _scrollPosition = 0.0;
            _scrollController.animateTo(
              _scrollPosition,
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear,
            );
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      child: Row(
        children: widget.children,
      ),
    );
  }
}
