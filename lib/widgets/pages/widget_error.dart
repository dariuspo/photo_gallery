import 'package:flutter/material.dart';
import 'package:photo_gallery/app/view/theme/spacer.dart';

class WidgetError extends StatelessWidget {
  const WidgetError({super.key, this.retry, this.message, this.retryText});

  final VoidCallback? retry;
  final String? message;
  final String? retryText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message ?? 'Unknown Error'),
          miniGap,
          Visibility(
            visible: retry != null,
            child: ElevatedButton(
              onPressed: () => retry?.call(),
              child: Text(retryText ?? 'Retry'),
            ),
          ),
        ],
      ),
    );
  }
}
