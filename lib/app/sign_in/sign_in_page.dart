import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/app/common_widgets/show_exeption_alert_dialog.dart';
import 'package:time_tracker_flutter_course/app/sign_in/email_sign_in_page.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_bloc.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_button.dart';
import 'package:time_tracker_flutter_course/app/sign_in/social_sign_in_button.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class SignInPage extends StatelessWidget {
  final SignInBloc bloc;

  const SignInPage({Key? key, required this.bloc}) : super(key: key);

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);

    return Provider<SignInBloc>(
      create: (_) => SignInBloc(auth: auth),
      dispose: (_, bloc) => bloc.dispose(),
      child: Consumer<SignInBloc>(
        builder: (context, bloc, __) => SignInPage(
          bloc: bloc,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Time Tracker')),
      body: StreamBuilder<bool>(
        stream: bloc.isLoadingStream,
        initialData: false,
        builder: (context, snapshot) {
          return _buildContent(context, snapshot.data!);
        },
      ),
      backgroundColor: Colors.grey[200],
    );
  }

  Container _buildContent(BuildContext context, bool isLoading) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 50.0,
              child: _buildHeader(isLoading),
            ),
            SizedBox(height: 48.0),
            SocialSignInButton(
              text: 'Sign In with Google',
              assetName: 'images/google-logo.png',
              textColor: Colors.black87,
              color: Colors.white,
              onPressed: isLoading ? null : () => _singInWithGoogle(context),
            ),
            SizedBox(height: 8.0),
            SocialSignInButton(
              text: 'Sign In with Facebook',
              assetName: 'images/facebook-logo.png',
              textColor: Colors.white,
              color: Colors.blue[900],
              onPressed: isLoading ? null : () => _singInWithFacebook(context),
            ),
            SizedBox(height: 8.0),
            SignInButton(
              text: 'Sign In with email',
              textColor: Colors.white,
              color: Colors.teal[700],
              onPressed: isLoading ? null : () => _signInWithEmail(context),
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
              onPressed: isLoading ? null : () => _singInAnonymously(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(bool isLoading) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Text(
      'Sign In',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  void _showSignInError(
    BuildContext context,
    Exception exception,
  ) {
    if (exception is FirebaseException &&
        exception.code == 'ERROR_ABORTED_BY_USER') return;

    showExeptionAlertDialog(
      context,
      title: 'Sign in failed',
      exception: exception,
    );
  }

  Future<void> _singInAnonymously(BuildContext context) async {
    try {
      await bloc.signInAnonymously();
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
  }

  Future<void> _singInWithGoogle(BuildContext context) async {
    try {
      await bloc.signInWithGoogle();
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
  }

  Future<void> _singInWithFacebook(BuildContext context) async {
    try {
      await bloc.signInWithFacebook();
    } on Exception catch (e) {
      _showSignInError(context, e);
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
}
