import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  // __________________________________________________________________________
  // Initialise a firebase instance for the app in the starting.
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // The verification ID generated by Firebase for Phone Number Authentication
  String _verificationId;
  // __________________________________________________________________________

  // This function takes a Verification Code provided by Firebase and an
  // OTP recieved by the user and authentication with the credentials.
  Future signInPhoneNumberWithOTP(String otp) async {
    AuthCredential authCreds = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: otp);

    _firebaseAuth.signInWithCredential(authCreds);
  }

  // __________________________________________________________________________
  Future verifyPhoneNumber(String phoneNumber) async {
    try {
      // Function to call signin with credential which returns the verfication
      // Id in the callback function "codeAutoRetrievalTimeout"
      PhoneVerificationCompleted verificationCompleted =
          (PhoneAuthCredential phoneAuthCredential) async {
        await _firebaseAuth.signInWithCredential(phoneAuthCredential);
      };
      // ----------------------------------------------------------------------
      // Function to handle errors thrown by Firebase
      PhoneVerificationFailed verificationFailed =
          (FirebaseAuthException authException) {
        print('Phone number verification failed');
        print('Code:${authException.code}.\nMessage:${authException.message}');
      };
      // ----------------------------------------------------------------------
      // Notification function for verification Id.
      PhoneCodeSent codeSent =
          (String verificationId, [int forceResendingToken]) async {
        print('Please check your phone for the verification code.');
        _verificationId = verificationId;
      };
      // ----------------------------------------------------------------------
      // Function to retrive verification ID from the firebase
      PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
          (String verificationId) {
        // print("Verification code: " + verificationId);
        _verificationId = verificationId;
      };
      // ----------------------------------------------------------------------
      // Call the Verify Phone Number method to initialize verification process
      // from Firebase. Entry point of the Mobile Authentication
      _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: const Duration(seconds: 5),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
      // -----------------------------------------------------------------------
    } catch (e) {
      print("caeknl");
    }
  }
}
