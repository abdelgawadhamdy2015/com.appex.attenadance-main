import 'package:flutter/cupertino.dart';

class CustomShimmer extends StatefulWidget {
  static CustomShimmerState? of(BuildContext context) {
    return context.findAncestorStateOfType<CustomShimmerState>();
  }

  static const _shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFAF2D2D),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );

  const CustomShimmer({
    super.key,
    this.linearGradient = _shimmerGradient,
    this.child,
  });

  final LinearGradient linearGradient;
  final Widget? child;

  @override
  CustomShimmerState createState() => CustomShimmerState();
}

class CustomShimmerState extends State<CustomShimmer> {

  LinearGradient get gradient => LinearGradient(
      colors: widget.linearGradient.colors,
      stops: widget.linearGradient.stops,
      begin: widget.linearGradient.begin,
      end: widget.linearGradient.end
  );

  bool get isSized {
    if (context.findRenderObject() == null) {
      return false;
    }
    return (context.findRenderObject() as RenderBox).hasSize;
  }

  Size get size {
    if (context.findRenderObject() == null) {
      return const Size(0, 0);
    }
    return (context.findRenderObject() as RenderBox).size;
  }

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final shimmerBox = context.findRenderObject() as RenderBox;
    return descendant.localToGlobal(offset, ancestor: shimmerBox);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}