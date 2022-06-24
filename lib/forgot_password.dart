import 'package:flutter/material.dart';
import 'reset_password.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: const forgotPassword(),
    );
  }
}

class forgotPassword extends StatefulWidget {
  const forgotPassword({Key? key}) : super(key: key);

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
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
                'Forgot Password',
                style: TextStyle(fontSize: 35),
              ),
              const Text(
                'Please enter your Email Id to receive password and reset information',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'MAIL ID',
                style: TextStyle(fontSize: 23),
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'john@example.com'),
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                  child: InkWell(
                onTap: openResetPassword,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 130, vertical: 20),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      color: Color(0xfff96060)),
                  child: const Text(
                    'Send Request',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ))
            ],
          ),
        ));
  }

  void openResetPassword() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ResetPassword()));
  }
}
