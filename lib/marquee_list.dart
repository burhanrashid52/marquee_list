library marquee_list;

import 'dart:async';

import 'package:flutter/material.dart';

/// A Flutter widget that scrolls its children infinitely in a marquee fashion.
///
/// The [MarqueeList] widget takes a list of children and scrolls them infinitely
/// in the specified [scrollDirection]. It can be used to create a marquee effect
/// for displaying scrolling content horizontally or vertically.
///
/// The speed of the scroll animation is controlled by the [scrollDuration] parameter.
/// The children will scroll continuously until the widget is disposed or the
/// animation is stopped manually.
///
/// Example usage:
///
/// ```dart
/// MarqueeList(
///   scrollDirection: Axis.horizontal,
///   scrollDuration: Duration(seconds: 2),
///   children: [
///     Text('This is a scrolling text 1'),
///     Text('This is a scrolling text 2'),
///     Text('This is a scrolling text 3'),
///   ],
/// )
/// ```
class MarqueeList extends StatefulWidget {
  /// Creates a marquee list widget.
  ///
  /// The [children] parameter must not be null.
  /// The [scrollDuration] defaults to 1 second.
  /// The [scrollDirection] defaults to [Axis.horizontal].
  /// The [reverse] defaults to false.
  const MarqueeList({
    super.key,
    required this.children,
    this.scrollDuration = const Duration(seconds: 1),
    this.scrollDirection = Axis.horizontal,
    this.onScrollEnd,
    this.reverse = false,
  });

  /// The list of widgets to be scrolled infinitely.
  final List<Widget> children;

  /// callback when the scroll animation ends
  final VoidCallback? onScrollEnd;

  /// The duration of each scroll animation.
  final Duration scrollDuration;

  /// The direction in which the children will be scrolled.
  final Axis scrollDirection;

  /// Weather we want to reverse the scroll direction.
  final bool reverse;

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
      final size = _itemSize;
      _timer = Timer.periodic(widget.scrollDuration, (_) {
        if (_isScrollAvailable(size)) {
          if (_isScrollRemain) {
            _moveForward();
          } else {
            widget.onScrollEnd?.call();
            _resetToStart();
          }
        }
      });
    });
  }

  bool _isScrollAvailable(double size) =>
      _scrollPosition < size * widget.children.length;

  bool get _isScrollRemain =>
      _scrollPosition < _scrollController.position.maxScrollExtent;

  double get _itemSize => _scrollDirection == Axis.horizontal
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

  Axis get _scrollDirection => widget.scrollDirection;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: widget.reverse,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: _scrollDirection,
      controller: _scrollController,
      child: switch (_scrollDirection) {
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
