import 'dart:async';

mixin Validators {
  var emailValidator =
      StreamTransformer<String,String>.fromHandlers(
          handleData: (email, sink) {

            if (email.isEmpty) {
              return sink.addError("This Field Cant Be Empty");
            }
            if (email.length > 32) {
              return sink.addError("Length Error");
            }

            if (email.length < 6) {
              return sink.addError("Less Characters");
            }
            if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(email)) {
              return sink.addError("Enter Valid Email");
            }


    return sink.add(email);
  });
  var passwordValidator =
  StreamTransformer<String,String>.fromHandlers(
      handleData: (password, sink) {
        if (password.isEmpty) {
          return sink.addError("Field Cant Be Empty");
        }

        if (password.length < 6) {
          return sink.addError("Password Is Too Short");
        }

        return sink.add(password);



      });
}
