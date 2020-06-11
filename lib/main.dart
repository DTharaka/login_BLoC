import 'package:flutter/material.dart';
import 'package:login_BLoC/bloc.dart';
import 'package:login_BLoC/nextpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final bloc = Bloc();

    return Scaffold(
        appBar: AppBar(
          title: Text("Login Page - BLoC Pattern"),
        ),
        body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  StreamBuilder<String>(
                    stream: bloc.email,
                    builder: (context, snapshot) => TextField(
                      onChanged: bloc.changeEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter email",
                          labelText: "Email",
                          errorText: snapshot.error),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  StreamBuilder<String>(
                    stream: bloc.password,
                    builder: (context, snapshot) => TextField(
                      onChanged: bloc.changePassword,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Password",
                          labelText: "Password",
                          errorText: snapshot.error),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  StreamBuilder<bool>(
                    stream: bloc.submitCheck,
                    builder: (context, snapshot) => RaisedButton(
                        child: Text('Submit'),
                        color: Colors.tealAccent,
                        onPressed: snapshot.hasData ? () => changePage(context): null
                      ),
                  )
                ],
              )),
        ));
  }

  changePage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NextPage()));
  }
}
