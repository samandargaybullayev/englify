import 'package:flutter/material.dart';

class ScrollScaffold extends StatefulWidget {
  const ScrollScaffold({super.key, required this.child, required this.onRefresh});
  final Widget child;
  final Future<void> Function() onRefresh;

  @override
  State<ScrollScaffold> createState() => _ScrollScaffoldState();
}

class _ScrollScaffoldState extends State<ScrollScaffold> {
  final _controller = ScrollController();
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final m = _controller.position;
      final double p = (m.pixels / (m.maxScrollExtent == 0 ? 1 : m.maxScrollExtent)).clamp(0, 1);
      setState(() => _progress = p);
    });
  }

  @override
  void dispose() { _controller.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: widget.onRefresh,
          child: SingleChildScrollView(
            controller: _controller,
            physics: const AlwaysScrollableScrollPhysics(),
            child: widget.child,
          ),
        ),
        Positioned(
          top: 0, left: 0, right: 0,
          child: LinearProgressIndicator(value: _progress == 0 ? null : _progress, minHeight: 2),
        ),
        if (_progress > 0.25)
          Positioned(
            bottom: 24, right: 24,
            child: FloatingActionButton.small(
              onPressed: () => _controller.animateTo(0, duration: const Duration(milliseconds: 400), curve: Curves.easeOutCubic),
              child: const Icon(Icons.arrow_upward_rounded),
            ),
          ),
      ],
    );
  }
}
