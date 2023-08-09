import 'package:fluter_template/ui/shared/colors.dart';
import 'package:fluter_template/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormField extends StatefulWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final TextEditingController controller;
  final String? labeltext;
  final InputBorder? border;
  final double borderRaduis;
  final String? Function(String?)? validator;
  final String? onFieldSubmitted;
  final TextInputFormatter? inputFormatters;
  final String? Function(String?)? onChanged;
  final Icon? icon;
  final SvgPicture? svgPicture;
  final TextAlign? textAlign;
  final InputBorder? focusedBorder;
  final TextInputType? keyboardType;
  final int? maxLength;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final String? hintText;
  final TextStyle? style;
  final String? errorText;
  final TextStyle? labelStyle;

  const CustomTextFormField(
      {Key? key,
      this.backgroundColor,
      this.textColor,
      required this.controller,
      required this.borderRaduis,
      this.svgPicture,
      this.labeltext,
      this.focusedBorder,
      this.keyboardType,
      this.inputFormatters,
      this.textAlign,
      this.icon,
      this.validator,
      this.border,
      this.onFieldSubmitted,
      this.maxLength,
      this.errorBorder,
      this.focusedErrorBorder,
      this.onChanged,
      this.hintText,
      this.style,
      this.errorText,
      this.labelStyle})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  void dispose() {
    widget.controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(

        //  textDirection: TextDirection.ltr,
        // textAlign: TextAlign.left,
        style: widget.style,
        onChanged: (value) {},
        maxLength: widget.maxLength ?? 150,
        onFieldSubmitted: (value) {},
        validator: widget.validator
        //  ??
        //     (value) {
        //       return null;
        //     },
        ,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        decoration: InputDecoration(
          errorText: widget.errorText,

          //   contentPadding: EdgeInsets.symmetric(horizontal: ScreenWidth(30)),
          hintText: widget.hintText,
          labelText: widget.labeltext,
          labelStyle: widget.labelStyle,
          focusedBorder: widget.focusedBorder,
          errorBorder: widget.errorBorder,
          focusedErrorBorder: widget.focusedErrorBorder,
          fillColor: widget.backgroundColor,
          filled: widget.backgroundColor != null ? true : false,
          prefixIcon: widget.svgPicture,
          enabledBorder: widget.border ??
              OutlineInputBorder(
                borderSide: BorderSide(
                    color: widget.backgroundColor != null
                        ? widget.backgroundColor!
                        : AppColors.transparent),
                borderRadius: BorderRadius.circular(widget.borderRaduis),
              ),
          counterText: '',
        ));
  }
}
// import 'package:flutter/material.dart';
// import 'package:food_ordering_sp1/ui/shared/colors.dart';

// class CustomTextField extends StatelessWidget {
//   final String hitText;
//   final TextEditingController controller;
//   final String? Function(String?)? validator;
//   final IconData? suffexIcon;

//   const CustomTextField({
//     Key? key,
//     required this.hitText,
//     required this.controller,
//     this.validator,
//     this.suffexIcon = Icons.abc,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Padding(
//       padding: EdgeInsetsDirectional.only(
//           start: size.width * 0.1,
//           end: size.width * 0.1,
//           bottom: size.width * 0.07),
//       child: TextFormField(
//         validator: validator,
//         controller: controller,
//         decoration: InputDecoration(
//             suffixIcon: Icon(suffexIcon ?? Icons.abc),
//             contentPadding: EdgeInsets.symmetric(
//                 horizontal: size.width * 0.1, vertical: size.width * 0.05),
//             hintText: hitText,
//             filled: true,
//             fillColor: AppColors.mainGreyColor,
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30),
//                 borderSide: BorderSide.none)),
//         //  validator: (value) => validator != null ? validator!(value!) : null,
//       ),
//     );
//   }
// }
