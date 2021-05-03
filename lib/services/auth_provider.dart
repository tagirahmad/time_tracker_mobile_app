import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class AuthProvider extends InheritedWidget {
  AuthProvider({required this.auth, required this.child}) : super(child: child);

  final AuthBase auth;
  final Widget child;

  static AuthBase of(BuildContext context) {
    AuthProvider provider =
        context.dependOnInheritedWidgetOfExactType<AuthProvider>()!;
    return provider.auth;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
