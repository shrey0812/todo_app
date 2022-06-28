import 'package:flutter/material.dart';
import 'package:todo_app/home_page.dart';
import 'package:todo_app/on_boarding.dart';
import 'forgot_password.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const loginPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
    );
  }
}

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const onboarding()));
            },
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
                'Welcome Back!',
                style: TextStyle(fontSize: 35),
              ),
              const Text(
                'Sign In to continue...',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'UserName',
                style: TextStyle(fontSize: 23),
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'John Doe'),
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Password',
                style: TextStyle(fontSize: 23),
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'Enter Your Password'),
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword()));
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
              Expanded(
                  child: Center(
                      child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 130, vertical: 20),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    color: Color(0xfff96060)),
                child: InkWell(
                  child: const Text('Log In',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
              )))
            ],
          ),
        ));
  }
}
