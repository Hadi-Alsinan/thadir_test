import 'package:flutter/material.dart';

class SequentialAnimatedList extends StatefulWidget {
  final Offset offset;
  final Duration duration;
  final Curve curve;
  final Axis axis;
  final List<Widget> children;

  const SequentialAnimatedList({
    super.key,
    required this.offset,
    required this.duration,
    required this.curve,
    required this.axis,
    required this.children,
  });

  @override
  _SequentialAnimatedListState createState() => _SequentialAnimatedListState();
}

class _SequentialAnimatedListState extends State<SequentialAnimatedList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedList(
        key: GlobalKey(),
        initialItemCount: widget.children.length,
        itemBuilder: (context, index, animation) {
          return SizeTransition(
            sizeFactor: animation.drive(
              Tween<double>(
                begin: 0,
                end: 1,
              ).chain(CurveTween(curve: widget.curve)),
            ),
            child: SlideTransition(
              position: animation.drive(
                Tween<Offset>(
                  begin: widget.offset,
                  end: Offset.zero,
                ).chain(CurveTween(curve: widget.curve)),
              ),
              child: widget.children[index],
            ),
          );
        },
        scrollDirection: widget.axis,
      ),
    );
  }
}
