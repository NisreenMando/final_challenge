
import 'package:fluter_template/ui/shared/colors.dart';
import 'package:flutter/material.dart';

// cresate 2 home//

class CustomButton extends StatefulWidget {
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final String? title;
  final Color? textColor;
  final VoidCallback? onpressd;
  final Color? borderColor;
  final IconData? icon;
  final double? height;
  final TextAlign? textAlign;
  final double? fontsize;
  final FontWeight? fontWeight;
  final Image? image;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final String? subTitle;
  final BorderRadiusGeometry? borderRadius;

  const CustomButton(
      {Key? key,
      this.margin,
      this.backgroundColor,
      this.title,
      this.textColor,
      this.onpressd,
      this.borderColor,
      this.icon,
      this.fontsize,
      this.fontWeight,
      this.height,
      this.textAlign,
      this.image,
      this.width,
      this.padding,
      this.child,
      this.subTitle,
      this.borderRadius})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: widget.padding,
        margin: widget.margin,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius,
          border:
              Border.all(color: widget.borderColor ?? AppColors.transparent),
          color: widget.backgroundColor ?? const Color(0xffFC6011),
        ),
        child: MaterialButton(
            onPressed: widget.onpressd ?? () {},
            child: widget.child ??
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.image ?? const SizedBox(),
                    // SizedBox(width: size.width / 20), //اختبار الصورة //
                    widget.icon != null
                        ? Row(
                            children: [
                              Icon(
                                widget.icon,
                                color: AppColors.white,
                                size: 30,
                              ),
                              // SizedBox(
                              //   width: size.width / 20,
                              // ),
                            ],
                          )
                        : const SizedBox(),
                    Row(
                      children: [
                        Text(
                          textAlign: widget.textAlign,
                          widget.title ?? '',
                          style: TextStyle(
                            height: widget.height,
                            fontWeight: widget.fontWeight,
                            fontSize: widget.fontsize,
                            color: widget.textColor ?? Colors.white,
                          ),
                        ),
                        Text(widget.subTitle ?? '')
                      ],
                    ),
                  ],
                )));
  }
}
