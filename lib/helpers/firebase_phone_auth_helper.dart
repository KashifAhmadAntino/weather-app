import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/common_widgets/loaders/progress_dialog.dart';
import 'package:weather/helpers/route_helper/any_where_door.dart';
import 'package:weather/helpers/route_helper/route_helper.gr.dart';

final ChangeNotifierProvider<FirebasePhoneAuthHelper> firebasePhoneAuthHelper =
    ChangeNotifierProvider<FirebasePhoneAuthHelper>(
        (ref) => FirebasePhoneAuthHelper());

class FirebasePhoneAuthHelper with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  String? verificationId;

  ///if otp Not Sent it will remain false else it will be true
  bool otpSent = false;

  Future<void> intUserStream(BuildContext context) async {
    ///this stream will listen to user change
    ///if user is logged ih the user !=null
    ///if user is logged out with some exception user == null
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        ///handle if user logged out due to some issue or previously
      } else {
        ///if user is logged in the navigate to weather screen
        AnywhereDoor.pushReplaceAll(context, path: const WeatherRoute());
      }
    });
  }

  ///this method will send OTP to provided number
  Future<void> sendOtpRequest(BuildContext context,
      {String? phoneNumber}) async {
    otpSent = false;
    notifyListeners();
    if (phoneNumber != null) {
      try {
        await auth.verifyPhoneNumber(
          ///passing phone number for sending otp
          phoneNumber: '+91$phoneNumber',
          timeout: const Duration(seconds: 50),
          verificationFailed: (FirebaseAuthException e) {
            ///handling exception if otp not sent to user
            otpSent = false;
            ProgressDialog.closeProgressDialog(context: context);

            ///showing user dialog is otp is not sent
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('OTP failed to send plz check the number')));
          },
          verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
          codeSent: (String verifyId, int? forceResendingToken) {
            ///if OTP is successfully sent then we will store the verification id
            verificationId = verifyId;
            otpSent = true;
            ProgressDialog.closeProgressDialog(context: context);
            notifyListeners();
          },
          codeAutoRetrievalTimeout: (String verifyId) {
            ///this only for testing as if the app is not in production sometimes firebase timeouts
            verificationId = verifyId;
            otpSent = true;
            notifyListeners();
          },
        );
      } catch (e) {
        //handle exception
      }
    }
  }

  ///this method will send and verify otp
  Future<void> verifyOTP({String? otp, required BuildContext context}) async {
    ///checking if the [verificationId] and [otp] is not null to proceed
    if (verificationId != null && otp != null) {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId ?? '', smsCode: otp);

      ///sending otp to for verification
      await auth.signInWithCredential(credential).then((value) {
        ProgressDialog.closeProgressDialog(context: context);
      });
    }
  }
}
