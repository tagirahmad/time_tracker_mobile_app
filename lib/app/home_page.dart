import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/common_widgets/show_alert_dialog.dart';
import 'package:time_tracker_flutter_course/services/auth_provider.dart';

class HomePage extends StatelessWidget {
  Future<void> _singOut(BuildContext context) async {
    try {
      final auth = AuthProvider.of(context);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSingOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(
      context,
      title: 'Logout',
      content: 'Are your sure?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    );

    if (didRequestSignOut == true) {
      await _singOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
        actions: [
          ElevatedButton(
            onPressed: () => _confirmSingOut(context),
            child: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
