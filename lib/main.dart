import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(40.0),
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [
            0.1,
            0.4,
            0.7,
            0.9
          ],
              colors: [
            Colors.teal[800]!,
            Colors.teal[600]!,
            Colors.teal[500]!,
            Colors.teal[400]!,
          ])),
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Image.asset(
              "assets/logo.png",
              height: 50.0,
            ),
            const SizedBox(
              height: 50.0,
            ),
            Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter the username";
                        } else if (value.length >= 9) {
                          return "Username should not exceed 8 characters";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_circle, color: Colors.white),
                        hintText: "Username",
                        hintStyle: TextStyle(color: Colors.white60),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter the password";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock, color: Colors.white),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white60),
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 50.0,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0.1, 0.4, 0.7, 0.9],
                  colors: [
                    Colors.teal[800]!,
                    Colors.teal[600]!,
                    Colors.teal[500]!,
                    Colors.teal[400]!,
                  ],
                ),
              ),
              child: ButtonTheme(
                buttonColor: Colors.white,
                height: 50.0,
                minWidth: double.infinity,
                child: TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("form validated successfully"),
                      ));
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => FirstPage()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Error"),
                      ));
                    }
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    minimumSize: const Size(double.infinity, 60),
                  ),
                  child: const Text("LOGIN"),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "Forgot Password ?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/google_logo.png",
                  height: 30.0,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Image.asset(
                  "assets/github_logo.png",
                  height: 30.0,
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Welcome To Introduction Page"),
      ),
    );
  }
}
