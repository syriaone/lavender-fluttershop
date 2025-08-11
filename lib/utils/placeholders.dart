import 'dart:typed_data';
import 'package:flutter/material.dart';

// a 1x1 transparent PNG (for FadeInImage.memoryNetwork)
const List<int> _kTransparentImage = <int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0xDA,
  0x63,
  0xF8,
  0x0F,
  0x00,
  0x01,
  0x01,
  0x01,
  0x00,
  0x18,
  0xDD,
  0x8D,
  0xB1,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
  0x42,
  0x60,
  0x82
];

class PH {
  static const product = 'assets/images/placeholders/product.png';
  static const category = 'assets/images/placeholders/category.png';
  static const banner = 'assets/images/placeholders/banner.png';
  static const avatar = 'assets/images/placeholders/avatar.png';

  static String of(String kind) {
    switch (kind) {
      case 'category':
        return category;
      case 'banner':
        return banner;
      case 'avatar':
        return avatar;
      default:
        return product;
    }
  }
}

class PlaceholderImage extends StatelessWidget {
  final String? url;
  final String kind;
  final BoxFit fit;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  const PlaceholderImage({
    super.key,
    required this.url,
    this.kind = 'product',
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final hasUrl = (url != null && url!.trim().isNotEmpty);
    final radius = borderRadius ?? BorderRadius.circular(12);

    Widget child;
    if (hasUrl) {
      child = ClipRRect(
        borderRadius: radius,
        child: FadeInImage.memoryNetwork(
          placeholder: Uint8List.fromList(_kTransparentImage),
          image: url!,
          fit: fit,
          fadeInDuration: const Duration(milliseconds: 220),
          fadeOutDuration: const Duration(milliseconds: 120),
          imageErrorBuilder: (_, __, ___) {
            return Image.asset(PH.of(kind), fit: fit);
          },
        ),
      );
    } else {
      child = _FadeIn(
        child: ClipRRect(
          borderRadius: radius,
          child: Image.asset(PH.of(kind), fit: fit),
        ),
      );
    }

    if (width != null || height != null) {
      return SizedBox(width: width, height: height, child: child);
    }
    return child;
  }
}

class _FadeIn extends StatefulWidget {
  final Widget child;
  const _FadeIn({required this.child});
  @override
  State<_FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<_FadeIn> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 220));
  @override
  void initState() {
    super.initState();
    _c.forward();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _c, child: widget.child);
  }
}
