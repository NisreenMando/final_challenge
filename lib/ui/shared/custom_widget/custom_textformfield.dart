
import 'package:fluter_template/ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  final Color? backgroundColor;
  final Color textColor;
  final TextEditingController controller;
  final String? labeltext;
  final InputBorder? border;
  final double borderRaduis;
  final String? Function(String?)? validator;
  final String? onFieldSubmitted;
  final TextInputFormatter? inputFormatters;
  final String? Function(String?)? onChanged;
  final Icon? icon;
  final TextAlign? textAlign;
  final InputBorder? focusedBorder;
  final TextInputType? keyboardType;
  final int? maxLength;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final String? hintText;
  final TextStyle? style;

  const CustomTextFormField({
    Key? key,
    this.backgroundColor,
    required this.textColor,
    required this.controller,
    required this.borderRaduis,
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
  }) : super(key: key);

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
            focusedBorder: widget.focusedBorder,
            errorBorder: widget.errorBorder,
            focusedErrorBorder: widget.focusedErrorBorder,
            fillColor: widget.backgroundColor,
            filled: widget.backgroundColor != null ? true : false,
            prefixIcon: widget.icon,
            enabledBorder: widget.border ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                      color: widget.backgroundColor != null
                          ? widget.backgroundColor!
                          : AppColors.transparent),
                  borderRadius: BorderRadius.circular(widget.borderRaduis),
                ),
            hintText: widget.hintText,
            labelText: widget.labeltext,
            counterText: ''));
  }
}
