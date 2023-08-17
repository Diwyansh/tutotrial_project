import 'package:ecommerce_project/features/auth/signup_screen.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
   SignInPage({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome\nBack!",style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            SizedBox(height: 20,),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                hintText: "Username or email",
                prefixIcon: Icon(Icons.person),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.blueAccent)),

              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: _passwordController,
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
            ),
            SizedBox(height: 50,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF83758),
                  minimumSize: Size(double.infinity, 60),
                textStyle: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)
              ),
                onPressed: (){
                Navigator.pushNamed(context, "dashboard");
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
    );
  }
}
