import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CopyableQrSection extends StatefulWidget {
  final String text;
  final String qrData;

  const CopyableQrSection({
    required this.text,
    required this.qrData,
    super.key,
  });

  @override
  State<CopyableQrSection> createState() => _CopyableQrSectionState();
}

class _CopyableQrSectionState extends State<CopyableQrSection> {
  Color textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.copy, color: textColor),
            SizedBox(width: 8),
            InkWell(
              onTapDown: (_) {
                Clipboard.setData(ClipboardData(text: widget.text));
                setState(() => textColor = theme.colorScheme.primary);
              },
              onTapUp: (_) async {
                await Future.delayed(Duration(milliseconds: 200));
                if (mounted) setState(() => textColor = Colors.black);
              },
              onTapCancel: () {
                if (mounted) setState(() => textColor = Colors.black);
              },
              child: Text(
                widget.text,
                style: TextStyle(color: textColor),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        QrImageView(
          data: widget.qrData,
          version: QrVersions.auto,
          size: 120,
        ),
        SizedBox(height: 12),
        Divider(
          color: theme.colorScheme.tertiary,
          thickness: 2,
        ),
      ],
    );
  }
}
