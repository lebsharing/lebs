import 'package:flutter/material.dart';

///in case double click
class SafeGestureDetector extends StatefulWidget {
  final Widget? child;
  final int? interval; //double click interval
  final HitTestBehavior? behavior;
  final GestureTapCallback? onTap;
  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;
  final GestureTapCancelCallback? onTapCancel;

  const SafeGestureDetector({
    Key? key,
    this.child,
    this.interval,
    this.behavior,
    this.onTap,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SafeGestureDetectorState();
  }
}

class _SafeGestureDetectorState extends State<SafeGestureDetector> {
  DateTime? _lastTime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: widget.child,
      behavior: widget.behavior,
      onTap: () {
        if (_lastTime == null ||
            (_lastTime != null &&
                DateTime.now().difference(_lastTime!) >=
                    Duration(milliseconds: widget.interval ?? 2000))) {
          _lastTime = DateTime.now();
          if (widget.onTap != null) {
            widget.onTap!();
          }
        }
      },
      onTapCancel: widget.onTapCancel,
      onTapDown: widget.onTapDown,
      onTapUp: widget.onTapUp,
    );
  }
}
