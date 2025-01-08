import 'dart:async';
import 'dart:ui';

/// Helper class for debounce functionality
class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

/// Helper class for throttle functionality
class Throttler {
  final int milliseconds;
  Timer? _timer;

  Throttler({required this.milliseconds});

  void run(VoidCallback action) {
    if (_timer == null || !_timer!.isActive) {
      action();
      _timer = Timer(Duration(milliseconds: milliseconds), () {});
    }
  }
}

/// Extension to block spam button actions
extension BlockSpamExtension on VoidCallback {
  static bool _isProcessing = false;

  VoidCallback blockSpam() {
    return () {
      if (_isProcessing) return;
      _isProcessing = true;

      try {
        this();
      } finally {
        Future.delayed(const Duration(milliseconds: 500), () {
          _isProcessing = false;
        });
      }
    };
  }
}
