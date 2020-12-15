part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();

  @override
  void dispose() {
    ctrlPassword.dispose();
    ctrlEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text("Sign In")),
          body: Container(
            margin: EdgeInsets.all(10),
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 40),
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
                        icon: Icon(Icons.cloud_download),
                        label: Text("Sign In"),
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () async{
                          if (ctrlEmail.text == "" ||
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
                            String result = await AuthServices.signIn(ctrlEmail.text, ctrlPassword.text);
                            if(result=="success"){
                              Fluttertoast.showToast(
                                msg: "Success",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16,
                              );
                              Navigator.pushReplacement(context, 
                                MaterialPageRoute(
                                  builder: (context){
                                    return MainMenu();
                                  }
                                )
                              );
                            }else{
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
                        text: "Not registered yet? Sign up.",
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                        ..onTap = (){
                          Navigator.pushReplacement(context, 
                            MaterialPageRoute(builder: (context){
                              return SignUpPages();
                          }));
                        }
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}