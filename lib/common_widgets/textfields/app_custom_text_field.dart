import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/constants/app_color.dart';
import 'package:weather/constants/app_text_style.dart';

class AppCustomTextField extends StatelessWidget {
  const AppCustomTextField(
      {this.onSuffixTap,
      this.errorText,
      this.isRequired = false,
      this.hint,
      this.formatters,
      this.isObscure = false,
      this.label,
      this.onChanged,
      this.suffixWidget,
      this.prefixWidget,
      required this.textEditingController,
      required this.textInputType,
      this.validation,
      this.enabled = true,
      this.maxLength,
      this.onSaved,
      this.onEditingComplete,
      this.width,
      this.border,
      this.height,
      Key? key,
      this.prefix,
      this.wantGreyColor})
      : super(key: key);
  final TextEditingController textEditingController;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validation;
  final TextInputType textInputType;
  final String? label;
  final bool isObscure;
  final bool? enabled;
  final bool isRequired;
  final GestureTapCallback? onSuffixTap;
  final String? errorText;
  final String? hint;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final Widget? prefix;
  final List<TextInputFormatter>? formatters;
  final int? maxLength;
  final Function(String?)? onSaved;
  final void Function()? onEditingComplete;
  final double? width;
  final double? height;
  final double? border;
  final bool? wantGreyColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (width ?? 384).w,
      child: TextFieldContainer(
        wantGreyColor: wantGreyColor,
        onEditingComplete: onEditingComplete,
        onSaved: onSaved,
        enabled: enabled,
        formatters: formatters,
        validation: validation,
        textEditingController: textEditingController,
        onChanged: onChanged,
        textInputType: textInputType,
        hint: hint,
        onSuffixTap: onSuffixTap,
        errorText: errorText,
        isObscure: isObscure,
        suffixWidget: suffixWidget,
        prefixWidget: prefixWidget,
        maxLength: maxLength,
        borderRadius: border,
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer(
      {this.validation,
      required this.textInputType,
      required this.textEditingController,
      this.suffixWidget,
      this.prefixWidget,
      this.formatters,
      this.wantGreyColor,
      this.onChanged,
      this.isObscure = false,
      this.hint,
      this.errorText,
      this.onSuffixTap,
      this.action = TextInputAction.done,
      this.maxLength,
      this.enabled = true,
      this.isDense = false,
      required this.onSaved,
      this.onEditingComplete,
      this.borderRadius,
      Key? key})
      : super(key: key);
  final TextEditingController textEditingController;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validation;
  final TextInputType textInputType;
  final GestureTapCallback? onSuffixTap;
  final bool isObscure;
  final bool? enabled;
  final bool? wantGreyColor;
  final String? hint;
  final bool? isDense;
  final String? errorText;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final int? maxLength;
  final TextInputAction action;
  final List<TextInputFormatter>? formatters;
  final Function(String?)? onSaved;
  final void Function()? onEditingComplete;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: isDense == true?height:null,      width: Get.width,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textCapitalization: TextCapitalization.words,
        inputFormatters: formatters,
        enabled: enabled,
        maxLength: maxLength,
        textInputAction: action,
        controller: textEditingController,
        onChanged: (value) {
          onChanged?.call(value);
        },
        onEditingComplete: onEditingComplete,
        onFieldSubmitted: (va) {},
        onSaved: onSaved ?? (v) {},
        keyboardType: textInputType,
        style: wantGreyColor == true ? TStyles.r16.black : TStyles.r16.white,
        textAlignVertical: TextAlignVertical.center,
        obscureText: isObscure,
        validator: validation,
        decoration: InputDecoration(
            errorText: errorText,
            prefixIcon: prefixWidget,
            prefixIconConstraints:
                const BoxConstraints(minWidth: 0, minHeight: 0),
            counterText: "",
            counterStyle: const TextStyle(fontSize: 0),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.5,
                  color: wantGreyColor == true
                      ? AppColors.kGrey217
                      : AppColors.kPureWhite,
                ),
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 6))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.5.w,
                  color: wantGreyColor == true
                      ? AppColors.kGrey217
                      : AppColors.kPureWhite,
                ),
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 6))),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.5.w,
                  color: wantGreyColor == true
                      ? AppColors.kGrey217
                      : AppColors.kPureWhite,
                ),
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 6))),
            hintText: hint,
            errorStyle: TStyles.r16.required,
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.5,
                color: AppColors.kRedDust,
              ),
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 6)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.5,
                  color: wantGreyColor == true
                      ? AppColors.kGrey217
                      : AppColors.kPureWhite),
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 6)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1.5),
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 6)),
            ),
            suffixIcon: suffixWidget != null
                ? GestureDetector(
                    onTap: onSuffixTap,
                    child: suffixWidget,
                  )
                : SizedBox(
                    height: 10.h,
                    width: 10.w,
                  ),
            hintStyle: TStyles.r16.hint),
      ),
    );
  }
}
