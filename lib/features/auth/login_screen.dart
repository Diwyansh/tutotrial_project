import 'package:ecommerce_project/features/auth/bloc/bloc_cubit.dart';
import 'package:ecommerce_project/features/auth/bloc/states.dart';
import 'package:ecommerce_project/features/auth/signup_screen.dart';
import 'package:ecommerce_project/features/dashboard/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/auth_model.dart';

class SignInPage extends StatelessWidget {
   SignInPage({Key? key}) : super(key: key);


   AuthModel authModel = AuthModel();

   FirebaseAuth firebaseAuth = FirebaseAuth.instance;

   final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 110,
              right: 20,
              bottom: 20,
              left: 20,
                child: SingleChildScrollView(
                  child: Form(
                    key: _key,
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    Text("Welcome\nBack!",style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
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
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.visibility_outlined)),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.blueAccent)),
                          counter: InkWell(
                              onTap: (){},
                              child: Text("Forgot Password?",style: TextStyle(color: Colors.red)))
                      ),
                      onSaved: (val) {
                        authModel.password = val;
                      },
                    ),
                    SizedBox(height: 50,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFF83758),
                            minimumSize: Size(double.infinity, 60),
                            textStyle: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)
                        ),
                        onPressed: (){
                          if(_key.currentState!.validate()) {
                            _key.currentState!.save();
                            context.read<LoginCubit>().login(authModel);
                          }
                        },
                        child: Text("Login")
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
                        InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpPage()));
                            },
                            child: Text("SignUp",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,decoration: TextDecoration.underline))),
                      ],
                    )
              ],
            ),
                  ),
                )),
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              left: 0,
                child: BlocConsumer<LoginCubit,LoginState>(
                  listener: (context,state){
                    if(state is LoginLoadedState) {
                      if(state.response.status == 200) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Dashboard()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.response.data)));
                      }
                    }
                  },
                  builder: (context, state) {
                    return Visibility(
                      visible: state is LoginLoadingState ? true : false,
                      child: Container(
                        color: Colors.black12,
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                    );
                  }
                )),
          ],
        ),
      ),
    );
  }
}
