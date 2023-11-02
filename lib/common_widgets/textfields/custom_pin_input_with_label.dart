// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:weather/config/responsive/size_config.dart';
import 'package:weather/constants/app_color.dart';
import 'package:weather/constants/app_text_style.dart';

class CustomPinInputWithLabel extends StatefulWidget {
  const CustomPinInputWithLabel(
      {Key? key,
      this.filledInputLabel,
      this.unfilledInputLabel,
      required this.pinController,
      this.length = 4,
      this.actions = const [],
      this.onChange,
      this.isPinInputCenter = false,
      this.pinGapWidth,
      this.isSecured = false})
      : super(key: key);

  /// Text to show when pin input is filled
  final String? filledInputLabel;

  /// Text to show when input field is not filled
  final String? unfilledInputLabel;

  /// Controller for pin input text field
  final TextEditingController pinController;

  /// Length of the pin inputs [Default is 4]
  final int length;

  /// Widgets to show right of the pin inputs to perfom actions
  final List<Widget> actions;

  /// Function callback when input field changes
  final Function(String val)? onChange;

  /// boolean to set the alignment of the pinput
  final bool isPinInputCenter;

  ///use this widget for gap in pin boxes
  final double? pinGapWidth;

  ///use this variable to secure the text
  final bool isSecured;
  @override
  State<CustomPinInputWithLabel> createState() =>
      _CustomPinInputWithLabelState();
}

class _CustomPinInputWithLabelState extends State<CustomPinInputWithLabel> {
  final focusNode = FocusNode();

  @override
  void initState() {
    widget.pinController.addListener(() {
      // Rebuild widget when input changes to refresh label state
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = AppColors.neutral5;
    const fillColor = AppColors.kPureWhite;
    const borderColor = AppColors.kGrey217;

    final defaultPinTheme = PinTheme(
      width: 48,
      height: 48,
      textStyle: TStyles.med18.black,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor, width: 1.5.w),
      ),
    );
    return Column(
      children: [
        if (widget.filledInputLabel != null)
          Align(
            alignment: Alignment.topLeft,
            child: Opacity(
              opacity:
                  widget.pinController.text.length != widget.length ? 1 : 0.34,
              child: Text(
                widget.filledInputLabel ?? '',
                style: TStyles.med16.black,
              ),
            ),
          ),
        if (widget.filledInputLabel != null)
          SizedBox(
            height: 12 * SizeConfig.heightMultiplier,
          ),
        Row(
          mainAxisAlignment: widget.isPinInputCenter
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            Flexible(
              child: Pinput(
                obscureText: widget.isSecured,
                length: widget.length,
                controller: widget.pinController,
                focusNode: focusNode,
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsUserConsentApi,
                listenForMultipleSmsOnAndroid: true,
                defaultPinTheme: defaultPinTheme,
                preFilledWidget: Text('0', style: TStyles.med16.hint),
                validator: (value) {
                  return null;
                },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onChanged: (value) {
                  widget.onChange?.call(value);
                },
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: borderColor),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(color: AppColors.kRedDust),
                ),
              ),
            ),
            ...widget.actions,
          ],
        ),
      ],
    );
  }
}
