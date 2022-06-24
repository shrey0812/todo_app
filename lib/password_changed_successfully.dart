import 'package:flutter/material.dart';
import 'home_page.dart';

class PasswordChangedSuccessfully extends StatelessWidget {
  const PasswordChangedSuccessfully({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'avenir'),
        home: const SuccessPage());
  }
}

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 300,
          width: 300,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/success.png'))),
        ),
        const Text('Successful!', style: TextStyle(fontSize: 35)),
        const Text(
            'You have successfully changed your password. Please use your new password to login!',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center),
        const SizedBox(
          height: 70,
        ),
        Center(
            child: InkWell(
          onTap: openHomePage,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(7)),
                color: Color(0xfff96060)),
            child: const Text(
              'Continue',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        )),
      ],
    ));
  }

  openHomePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
