
Authentication: Firebase phone authentication is used as basic authentication where I have already added all the production SHA1 to firebase and setup everything so that code can be run on other machines as well.

Note: If want to run the app and need to check the phone auth kindly build / run in release mode as I have added the keystore file in app as well.

Information: Firebase locks the account in some cases if too many request is raised to if you face any issue or doesn't received OTP here I am attaching the dummy credentials that I have added on firebase for testing.

Credentials:

Phone Number: 9999999999
OTP: 000000


Steps to setup:

1- I have used asset generator flutter_gen. I have already added the generated files but in case some issue then run these commands

	- dart pub global activate flutter_gen
	- flutter pub get
	- dart run build_runner build

2- Route service auto_router is user run this command if faced any issue.

	- dart run build_runner build