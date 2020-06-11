// After dart 2.0 we can use mixin rather than class

import 'dart:async';

mixin Validator{
  final emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if(email.contains('@')){
        sink.add(email);
      }else{
        sink.addError('Please enter a valid email');
      }
    }
  );

  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if(password.length> 4){
        sink.add(password);
      }else{
        sink.addError('Password includes minimum 4 charactors');
      }
    }
  );


}