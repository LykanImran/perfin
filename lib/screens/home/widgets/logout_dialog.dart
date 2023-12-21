import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfin/blocs/sign_in_bloc/sign_in_bloc.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(
            Icons.warning,
            color: Colors.orange,
          ),
          SizedBox(width: 8),
          Text('Logout Confirmation'),
        ],
      ),
      content: Text('Are you sure you want to log out?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog without logging out
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            context.read<SignInBloc>().add(const SignOutRequired());
          },
          child: Text('Logout', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
