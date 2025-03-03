import 'dart:async';

mixin Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (RegExp(r'@').hasMatch(email)) {
        sink.add(email);
      } else {
        sink.addError('Enter a valid email');
      }
    },
  );
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length > 3) {
        sink.add(password);
      } else {
        sink.addError('Password must be at least 4 characters');
      }
    },
  );
}
