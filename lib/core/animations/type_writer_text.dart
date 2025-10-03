import 'dart:async';
import 'package:flutter/material.dart';

class TypeWriterText extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final Color cursorColor;
  final Duration charDuration;
  final Duration initialDelay;

  const TypeWriterText({
    super.key,
    required this.text,
    this.textStyle,
    this.cursorColor = Colors.black,
    this.charDuration = const Duration(milliseconds: 80),
    this.initialDelay = Duration.zero,
  });

  @override
  State<TypeWriterText> createState() => _TypeWriterTextState();
}

class _TypeWriterTextState extends State<TypeWriterText> {
  String _displayed = '';
  Timer? _timer;
  int _index = 0;
  bool _showCursor = true;
  Timer? _cursorTimer;
  bool _finished = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.initialDelay, _startTyping); // ⏳ بداية بعد delay
    _startCursorBlink();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _cursorTimer?.cancel();
    super.dispose();
  }

  void _startTyping() {
    _timer = Timer.periodic(widget.charDuration, (timer) {
      if (_index < widget.text.length) {
        setState(() {
          _index++;
          _displayed = widget.text.substring(0, _index);
        });
      } else {
        timer.cancel();
        setState(() {
          _finished = true;
          _showCursor = false; // إلغاء الكيرسور بعد الانتهاء
        });
      }
    });
  }

  void _startCursorBlink() {
    _cursorTimer = Timer.periodic(const Duration(milliseconds: 500), (_) {
      if (_finished) return;
      setState(() {
        _showCursor = !_showCursor;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = widget.textStyle ?? DefaultTextStyle.of(context).style;

    return RichText(
      text: TextSpan(
        style: textStyle,
        children: [
          TextSpan(text: _displayed),
          if (!_finished)
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Opacity(
                opacity: _showCursor ? 0.8 : 0.0,
                child: Text(
                  '|',
                  style: textStyle.copyWith(color: widget.cursorColor),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
