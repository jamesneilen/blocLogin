import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/provider.dart';
import '../blocs/bloc1.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          const SizedBox(
            height: 25,
          ),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (BuildContext context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                errorText: snapshot.error.toString(),
                hintText: 'jn@example.com',
                labelText: 'Enter your email address'),
          );
        });
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
        initialData: "Let's see see something",
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            decoration: InputDecoration(
              errorText: snapshot.error.toString(),
              labelText: 'Enter your password',
            ),
          );
        });
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder<Object>(
        stream: bloc.submitValid,
        builder: (context, snapshot) {
          return TextButton(
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.blue),
              foregroundColor: WidgetStatePropertyAll(Colors.white),
            ),
            onPressed: snapshot.hasData ? bloc.submit : null,
            child: const Text('Submit'),
          );
        });
  }
}
