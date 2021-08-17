import 'dart:async';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';


Future<UserCredential> signInWithFacebook() async {
  final AccessToken result = (await FacebookAuth.instance.login()) as AccessToken;

  final OAuthCredential facebookAuthCredential =
  FacebookAuthProvider.credential(result.token);

  return await FirebaseAuth.instance
      .signInWithCredential(facebookAuthCredential);
}