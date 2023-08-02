import 'package:flutter/material.dart';


class CustomText extends StatefulWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration? decoration;
  final TextStyle? style;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final TextOverflow? overflow;
  final int? maxLines;
  const CustomText(
      {required this.text,
      this.size,
      this.fontWeight,
      this.color,
      this.style,
      this.decoration,
      this.fontSize,
      this.overflow,
      this.padding,
      this.maxLines,
      super.key});

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 0),
      child: Text(
        widget.text,
        style: TextStyle(
            overflow: widget.overflow,
            color: widget.color,
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            decoration: widget.decoration),
        maxLines: widget.maxLines,
      ),
    );
  }
}
