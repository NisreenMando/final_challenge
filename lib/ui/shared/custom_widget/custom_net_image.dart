import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomNetImage extends StatefulWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit imgFit;
  final Alignment alignment;

  const CustomNetImage(
      {Key? key,
      required this.imageUrl,
      this.width,
      this.height,
      required this.imgFit,
      required this.alignment})
      : super(key: key);

  @override
  State<CustomNetImage> createState() => _CustomNetImageState();
}

class _CustomNetImageState extends State<CustomNetImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.imageUrl,
      width: widget.width,
      height: widget.height,
      fit: widget.imgFit,
      placeholder: (context, s) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, s, o) => Image.asset(
        'assets/images/facebook.png',
        fit: widget.imgFit,
        width: widget.width,
        height: widget.height,
      ),
      alignment: widget.alignment,
    );
  }
}
