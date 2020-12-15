part of 'pages.dart';

class SignUpPages extends StatefulWidget {
  @override
  _SignUpPagesState createState() => _SignUpPagesState();
}

class _SignUpPagesState extends State<SignUpPages> {
  final ctrlName = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();

  @override
  void dispose() {
    ctrlPassword.dispose();
    ctrlEmail.dispose();
    ctrlName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text("SignUp")),
          body: Container(
            margin: EdgeInsets.all(10),
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 40),
                    TextFormField(
                      controller: ctrlName,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
                          labelText: "Full Name",
                          hintText: "Your full name",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: ctrlEmail,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: "Email",
                          hintText: "Your Email",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: ctrlPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key),
                          labelText: "Password",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 40),
                    RaisedButton.icon(
                        icon: Icon(Icons.cloud_upload),
                        label: Text("Sign Up"),
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () async {
                          if (ctrlName.text == "" ||
                              ctrlEmail.text == "" ||
                              ctrlPassword.text == "") {
                            Fluttertoast.showToast(
                              msg: "Please fill all fields!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16,
                            );
                          } else {
                            String result = await AuthServices.signUp(
                                ctrlEmail.text,
                                ctrlPassword.text,
                                ctrlName.text);
                            if (result == 'success') {
                              Fluttertoast.showToast(
                                msg: "Success",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16,
                              );
                            } else {
                              Fluttertoast.showToast(
                                msg: result,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16,
                              );
                            }
                          }
                        }),
                    SizedBox(
                      height: 25,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Already registered? Sign in.",
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return MyApp();
                              }));
                            }),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
