import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:login_BLoC/validator.dart';

class Bloc extends Object with Validator{

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Output(Stream)
  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);

  // Input(Sink)
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Combine email, password streams together
  Stream<bool> get submitCheck => Observable.combineLatest2(email, password, (e,p)=> true);

  dispose(){
    _emailController?.close(); // if not null then close
    _passwordController?.close();
  }
}