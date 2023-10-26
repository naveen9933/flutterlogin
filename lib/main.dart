import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  @override
  void initState(){
    super.initState();
    _iconAnimationController = AnimationController(
      vsync: this,
        duration: Duration(seconds: 5),
    );
    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.bounceOut
    );
    _iconAnimation.addListener(()=> this.setState(() {}));
    _iconAnimationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: new AssetImage("assets/girl.jpeg"),
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.darken,
            color: Colors.black87,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                    Icons.person,
                  color: Colors.white,
                  size: _iconAnimation.value*100,
                ),
                Form(
                  child: Theme(
                    data: ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.teal,
                      inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: Colors.teal, fontSize: 20.0
                        )
                      )
                    ),
                    child: Container(
                      padding: EdgeInsets.all(60.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                             labelText: "Enter Email",
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextFormField(
                            // labelText: "Enter Password",
                            decoration: InputDecoration(
                              labelText: "Enter Password",
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          Padding(padding: EdgeInsets.only(top: 20.0)),
                          MaterialButton(
                            onPressed: ()=>{},
                            color: Colors.teal,
                            textColor: Colors.white,
                            child: Text("Login"),
                            splashColor: Colors.blue,
                          )
                        ],
                      ),
                    ),
                  ),
                )

              ],
          )
        ],
      ),
    );
  }
}

