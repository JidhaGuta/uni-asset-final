import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRDisplayWidget extends StatelessWidget {
  final String qrData;
  final double size;

  const QRDisplayWidget({required this.qrData, this.size = 200, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: QrImageView(
        data: qrData,
        size: size,
        backgroundColor: Colors.white,
        version: QrVersions.auto,
      ),
    );
  }
}
