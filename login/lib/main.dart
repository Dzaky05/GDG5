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
      title: 'Login Page',
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Center(
        child: Container(     //untuk membuat kotak login
          width: 400,         //didalamnya diatur lebar dan tinggi
          height: 600,
          padding: const EdgeInsets.all(27),      //jarak dari tepi kewidget yg ada didalamnya
          decoration: BoxDecoration(
            color: Colors.white,                //kasih warna putih ke kotak tsb
            borderRadius: BorderRadius.circular(16),            //membuat sdut membulat
            boxShadow: const [                    //kasih bayangan ke kotak tsb agar lebih bagus dan 3d
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column( //menyusun widget secara vertikal/menurun
            crossAxisAlignment: CrossAxisAlignment.stretch, 
            children: [
              const Center(
                child: Text(
                  "Login into Your Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: Image.asset(
                  'assets/images/gdg_logo.jpeg',
                  height: 100,
                  width: 120,   //ukuran melebar dan tinggi logo
                ),
              ),

              const SizedBox(height: 60),

              // Username
              TextField(
                decoration: InputDecoration(
                  labelText: "Username",
                  hintText: "your username",

               contentPadding: const EdgeInsets.symmetric(
                   vertical: 12,  //  makin kecil ini kotak makin kecil/pendek
                   horizontal: 12,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),    //membuat bulat sudut pada kotak inputan
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Password (ON/OFF)
              TextField(
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "your password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgot Password?"),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB47A3C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don’t have an account? "),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
