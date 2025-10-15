import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class OfflineOverlay extends StatefulWidget {
  const OfflineOverlay({super.key, required this.child});
  final Widget child;

  @override
  State<OfflineOverlay> createState() => _OfflineOverlayState();
}

class _OfflineOverlayState extends State<OfflineOverlay> {
  late final StreamSubscription _sub;
  bool _offline = false;

  @override
  void initState() {
    super.initState();
    _sub = Connectivity().onConnectivityChanged.listen((r) {
      setState(() => _offline = r == ConnectivityResult.none);
    });
  }

  @override
  void dispose() { _sub.cancel(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      widget.child,
      if (_offline)
        Positioned(
          top: 0, left: 0, right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            color: Colors.amber.shade700,
            child: const SafeArea(child: Text('You are offline', style: TextStyle(color: Colors.white))),
          ),
        ),
    ]);
  }
}
