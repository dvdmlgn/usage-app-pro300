import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

LocalAuthentication biometricAuth;
bool canUseBiometric = false;
bool didAuthenticate = false;
var availableBiometrics = <BiometricType>[];

void biometricInit() async {
  biometricAuth = LocalAuthentication();

  try {
    canUseBiometric = await biometricAuth.canCheckBiometrics;
    availableBiometrics = await biometricAuth.getAvailableBiometrics();

    debugPrint(canUseBiometric.toString());
    debugPrint(availableBiometrics.toString());

  } on PlatformException catch (error) {
    print(error);
  }
  
}

// NOTE:
// biometrics have only been tested with faseID right now,
// still have to test touchID and android Fingerprint
void authenticateWithBiometric() async {
  didAuthenticate = await biometricAuth.authenticateWithBiometrics(
    localizedReason: 'Please enter in your biometrics',
    stickyAuth: true,
    useErrorDialogs: true
  );

   debugPrint(didAuthenticate.toString());

  // return isAuthorised;
}



var auth0;