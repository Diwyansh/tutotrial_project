import 'package:ecommerce_project/features/auth/models/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
   SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey();

  AuthModel authModel = AuthModel();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Create an\Account!",style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    hintText: "Username or email",
                    prefixIcon: Icon(Icons.person),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.blueAccent)),
                  ),
                  onSaved: (val) {
                    authModel.email = val;
                  },
                  validator: (val) {
                    return val!.contains("@") ? null : "Please enter valid email";
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(onPressed: (){

                        isVisible = !isVisible;

                        setState(() {

                        });
                      }, icon: isVisible ? Icon(Icons.visibility_off_outlined) : Icon(Icons.visibility_outlined)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.blueAccent)),
                  ),
                  obscureText: isVisible,
                ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: "Confirm Password",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(onPressed: (){}, icon: isVisible ? Icon(Icons.visibility_off_outlined) :  Icon(Icons.visibility_outlined)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.blueAccent)),
                  ),
                  obscureText: isVisible,
                  onSaved: (val) {
                    authModel.password = val;
                  },
                  validator: (val) {
                    return val == _passwordController.text ? null : "Password not matched";
                  },
                ),
                SizedBox(height: 50,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF83758),
                      minimumSize: Size(double.infinity, 60),
                    textStyle: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)
                  ),
                    onPressed: () async {

                      if(_key.currentState!.validate()) {
                        _key.currentState!.save();

                        final user = await firebaseAuth.createUserWithEmailAndPassword(email: authModel.email!, password: authModel.password!);
                        print(user.user!.email);

                      }

                    },
                    child: Text("SignUp")
                ),
                SizedBox(height: 60,),
                Center(child: Text("- OR Continue with -")),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.red),
                        color: Colors.red.withOpacity(.1)
                      ),
                      child: Icon(Icons.apple,size: 30,),
                    ),
                    VerticalDivider(),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.red),
                        color: Colors.red.withOpacity(.1)
                      ),
                      child: Icon(Icons.apple,size: 30,),
                    ),
                    VerticalDivider(),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.red),
                        color: Colors.red.withOpacity(.1)
                      ),
                      child: Icon(Icons.apple,size: 30,),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Create An Account ",),
                    Text("SignUp",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,decoration: TextDecoration.underline)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
