import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black,
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String username, password;
  bool autoValidate = false;
  bool canSubmit = true;
  void submitRegisterForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      debugPrint('$username, $password');
      setState(() {
        canSubmit = false;
      });
      Scaffold.of(context)
          .showSnackBar(
            SnackBar(
              content: Text('正在注册'),
            ),
          )
          .closed
          .then(
            (value) => {
              setState(() {
                canSubmit = true;
              })
            },
          );
    } else {
      setState(() {
        autoValidate = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      autoValidate = false;
      canSubmit = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Username',
            ),
            onSaved: (val) {
              username = val;
            },
            validator: (val) {
              if (val.isEmpty) {
                return 'Username不能为空';
              }
              return null;
            },
            autovalidate: autoValidate,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
            onSaved: (val) {
              password = val;
            },
          ),
          SizedBox(
            height: 32.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 45.0,
            child: RaisedButton(
              onPressed: canSubmit ? submitRegisterForm : null,
              color: Theme.of(context).accentColor,
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextInput extends StatefulWidget {
  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  String title;

  _onTitleChange(String v) {
    debugPrint(v);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: _onTitleChange,
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: 'Title',
        hintText: 'Enter',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
    );
  }
}
