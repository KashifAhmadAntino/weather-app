import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/common_widgets/textfields/app_custom_text_field.dart';
import 'package:weather/common_widgets/buttons/custom_button.dart';
import 'package:weather/common_widgets/loaders/progress_dialog.dart';
import 'package:weather/common_widgets/textfields/custom_pin_input_with_label.dart';
import 'package:weather/config/responsive/size_config.dart';
import 'package:weather/constants/app_text_style.dart';
import 'package:weather/helpers/firebase_phone_auth_helper.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  ///Text field controller for mobile number
  final TextEditingController _mobileNumberController = TextEditingController();

  ///Text field controller for OTP
  final TextEditingController _otpController = TextEditingController();

  @override
  void initState() {
    ///starting user listener stream when user user is logged in or logged out this will get triggered
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(firebasePhoneAuthHelper).intUserStream(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///OTP sent will be true once OTP is sent successfully
    bool otpSent = ref.watch(firebasePhoneAuthHelper).otpSent;
    return Scaffold(
      body: Center(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 24 * SizeConfig.widthMultiplier),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login",
                style: TStyles.b24.black,
              ),
              Text(
                "Welcome back to the app",
                style: TStyles.r18.midBlack,
              ),
              SizedBox(
                height: 50 * SizeConfig.heightMultiplier,
              ),
              Text(
                "Mobile Number",
                style: TStyles.med18.black,
              ),
              SizedBox(
                height: 10 * SizeConfig.heightMultiplier,
              ),
              AppCustomTextField(
                  formatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  border: 7,
                  wantGreyColor: true,
                  hint: "Enter mobile number",
                  width: double.infinity,
                  onChanged: (mobileNumber) {},
                  textEditingController: _mobileNumberController,
                  textInputType: TextInputType.phone),
              if (otpSent == true)
                SizedBox(
                  height: 20 * SizeConfig.heightMultiplier,
                ),

              /// OTP is send successfully the OTP textField will be shown
              if (otpSent == true)
                CustomPinInputWithLabel(
                  filledInputLabel: 'OTP',
                  length: 6,
                  pinController: _otpController,
                ),
              SizedBox(
                height: 40 * SizeConfig.heightMultiplier,
              ),
              CustomButton(
                  onTap: () async {
                    ///Condition to validate user input
                    if ((otpSent == true && _otpController.text.length == 6) ||
                        otpSent == false &&
                            _mobileNumberController.text.isNotEmpty == true) {
                      ///opening progress dialog when API gets hit
                      ProgressDialog.openProgressDialog(context);
                      final authHelper = ref.read(firebasePhoneAuthHelper);
                      if (otpSent == true) {
                        ///calling verify OTP for otp verification
                        await authHelper.verifyOTP(
                            otp: _otpController.text, context: context);
                      } else {
                        ///calling send otp to send OTP to provided number
                        await authHelper.sendOtpRequest(context,
                            phoneNumber: _mobileNumberController.text);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Provide valid input!')));
                    }
                  },
                  title: (otpSent == false) ? 'Get OTP' : 'Verify OTP')
            ],
          ),
        ),
      ),
    );
  }
}
