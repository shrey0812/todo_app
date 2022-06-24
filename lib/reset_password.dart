import 'package:flutter/material.dart';
import 'package:todo_app/password_changed_successfully.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'avenir'),
        home: const resetPassword());
  }
}

class resetPassword extends StatefulWidget {
  const resetPassword({Key? key}) : super(key: key);

  @override
  State<resetPassword> createState() => _resetPasswordState();
}

class _resetPasswordState extends State<resetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {},
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Reset Password',
                style: TextStyle(fontSize: 35),
              ),
              const Text(
                'Reset code was sent to your email. Please enter the code and create a new password',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Reset code',
                style: TextStyle(fontSize: 23),
              ),
              const TextField(
                decoration: InputDecoration(hintText: '*****'),
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'New Password',
                style: TextStyle(fontSize: 23),
              ),
              const TextField(
                decoration:
                    InputDecoration(hintText: 'Enter your new password here'),
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Confirm Password',
                style: TextStyle(fontSize: 23),
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'Re-enter your password'),
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: Center(
                    child: InkWell(
                  onTap: openSuccessPage,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 20),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        color: Color(0xfff96060)),
                    child: const Text(
                      'Change Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )),
              )
            ],
          ),
        ));
  }

  void openSuccessPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const PasswordChangedSuccessfully()));
  }
}
