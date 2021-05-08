import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/app/sign_in/email_sign_in_page.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_button.dart';
import 'package:time_tracker_flutter_course/app/sign_in/social_sign_in_button.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class SignInPage extends StatelessWidget {
  Future<void> _singInAnonymously(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _singInWithGoogle(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _singInWithFacebook(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithFacebook();
    } catch (e) {
      print(e.toString());
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Time Tracker')),
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }

  Container _buildContent(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Sign In',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 48.0),
            SocialSignInButton(
              text: 'Sign In with Google',
              assetName: 'images/google-logo.png',
              textColor: Colors.black87,
              color: Colors.white,
              onPressed: () => _singInWithGoogle(context),
            ),
            SizedBox(height: 8.0),
            SocialSignInButton(
              text: 'Sign In with Facebook',
              assetName: 'images/facebook-logo.png',
              textColor: Colors.white,
              color: Colors.blue[900],
              onPressed: () => _singInWithFacebook(context),
            ),
            SizedBox(height: 8.0),
            SignInButton(
              text: 'Sign In with email',
              textColor: Colors.white,
              color: Colors.teal[700],
              onPressed: () => _signInWithEmail(context),
            ),
            SizedBox(height: 8.0),
            Text(
              'or',
              style: TextStyle(fontSize: 14.0, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            SignInButton(
              text: 'Go anonymous',
              textColor: Colors.black,
              color: Colors.lime[300],
              onPressed: () => _singInAnonymously(context),
            ),
          ],
        ),
      ),
    );
  }
}
