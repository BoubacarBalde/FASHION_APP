import 'package:flutter/material.dart';

import '../utils/kcolors.dart';
import 'app_style.dart';


class ThinToastManager {
  static final _toastDuration =  Duration(seconds: 3);
  static OverlayEntry? _overlayEntry;

  static void showThinToast(BuildContext context, String message) {
    _overlayEntry?.remove();
    _overlayEntry = _createOverlayEntry(context, message);

    Overlay.of(context).insert(_overlayEntry!);

    Future.delayed(_toastDuration).then((value) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  static OverlayEntry _createOverlayEntry(BuildContext context, String message) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: 70.0,
        width: MediaQuery.of(context).size.width,
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: appStyle(
                  14,
                  Kolors.kWhite,
                  FontWeight.normal
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}