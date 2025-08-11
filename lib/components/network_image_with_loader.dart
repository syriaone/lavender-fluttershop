import 'package:flutter/material.dart';

import '../constants.dart';
import '../utils/placeholders.dart';

class NetworkImageWithLoader extends StatelessWidget {
  final BoxFit fit;

  const NetworkImageWithLoader(
    this.src, {
    super.key,
    this.fit = BoxFit.cover,
    this.radius = defaultPadding,
    this.kind = 'product',
  });

  final String src;
  final double radius;
  final String kind;

  @override
  Widget build(BuildContext context) {
    return PlaceholderImage(
      url: src,
      kind: kind,
      fit: fit,
      borderRadius: BorderRadius.circular(radius),
    );
  }
}
