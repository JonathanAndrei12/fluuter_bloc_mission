part of 'pages.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("My Account"),
          leading: Container(),
        ),
        body: Stack(children: [
          Container(
            padding: EdgeInsets.only(bottom: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child:Column(
                children: [
                  Flexible(
                    flex: 8,
                    child: Card(
                      margin: EdgeInsets.all(10),
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: Column(
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            // backgroundImage: NetworkImage(
                            //   // user.image,
                            //   scale: 60,
                            // ),
                          ),
                        ),
                      ),
                    )
                  ),
                  Flexible(
                    flex: 2,
                    child: RaisedButton(
                      padding: EdgeInsets.all(12),
                      textColor: Colors.white,
                      color: Colors.red,
                      child: Text("Sign Out"),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Signout Confirmation"),
                              content: Text("Are you sure you want to signout?"),
                              actions: [
                                FlatButton(
                                  child: Text("Yes"),
                                  onPressed: () async {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    await AuthServices.signOut().then((value) {
                                      if (value) {
                                        Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                            return SignInPage();
                                          })
                                        );
                                        setState(() {
                                          isLoading = false;
                                        });
                                      } else {
                                        setState(() {
                                          isLoading = false;
                                        });
                                      }
                                    });
                                  },
                                ),
                                FlatButton(
                                  child: Text("No"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          }
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          isLoading == true
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.transparent,
                  child: SpinKitFadingCircle(
                    size: 50,
                    color: Colors.blue,
                  ))
              : Container()
        ]));
  }
}
