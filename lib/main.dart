import 'package:flutter/material.dart';

void main() {
 runApp(
   MaterialApp(
     home: MyForm() )
 );
}

class MyForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyFormState();

  }
}

class MyFormState extends State<MyForm>{
  var _myFormKey =  GlobalKey<FormState>();

  var _Password=TextEditingController();
  var _confirmPassword=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Form"),),
      body: Container(
        padding:EdgeInsets.symmetric(vertical: 15.0,horizontal: 30.0) ,
        child: Form(
          key: _myFormKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding:EdgeInsets.all(15.0),
                child: TextFormField(
                  validator: (String? msg){
                    if (msg?.isEmpty ?? true){
                      return "Please enter name";
                    }if((msg?.length ?? 0)<3){
                      return "Name is less that 3 character";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "Enter your name",
                      border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1.0)
                      )
                  ),

                ),

              ),
              Padding(
                padding:EdgeInsets.all(15.0),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  validator: (String? msg){
                    if (msg?.isEmpty ?? true){
                      return "Please enter your mobile number";
                    }if((msg?.length ?? 0) != 10){
                      return "Please Enter Valid Mobile Number";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Mobile",
                      labelStyle: TextStyle(fontSize: 20.0),
                      hintText: "Enter your Mobile Number",
                      border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1.0)
                      )
                  ),

                ),

              ),
              Padding(
                padding:EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: _Password,

                  validator: (String? msg){
                    if (msg?.isEmpty ?? true){
                      return "Please enter your Password";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter your Password",
                      border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1.0)
                      )
                  ),

                ),

              ),
              Padding(
                padding:EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: _confirmPassword,

                  validator: (String? msg){
                    if (msg != _Password.value.text){
                      return "Please enter same password";


                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Confirm Password",
                      hintText: "Confirm your Password",
                      border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1.0)
                      )
                  ),

                ),

              )


            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _myFormKey.currentState?.validate();
        },
        child: Icon(Icons.done),
      ),

    );
  }

}