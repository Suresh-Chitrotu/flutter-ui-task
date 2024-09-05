import 'package:flutter/material.dart';
import 'package:task/Navigation/bottomnavscreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        backgroundColor: Colors.white,  
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
           
          },
        ),
      ),
      body: Container(
        color: Colors.white, 
        child: SingleChildScrollView( 
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/Screenshot 2024-09-05 184913.png',
                    height: 100,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Let's Begin!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Please enter your credentials to proceed',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 30),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Your Email',
                    border: UnderlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                TextField(
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Create Password',
                    border: const UnderlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Referral Code (Optional)',
                    border: UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 40), 
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyExample()));
                    },
                    backgroundColor: Colors.redAccent,
                    child: const Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:task/Navigation/bottomnavscreen.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   bool _isPasswordVisible = false;
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _referralCodeController = TextEditingController();
  
//   Future<void> _signupUser() async {
//     final String email = _emailController.text;
//     final String password = _passwordController.text;
//     final String referralCode = _referralCodeController.text;

//     // URL to send the POST request
//     const String url = 'http://devapiv4.dealsdray.com/api/v2/user/email/referral';

//     // Prepare the request body
//     final Map<String, dynamic> body = {
//       "email": email,
//       "password": password,
//       "referralCode": referralCode.isNotEmpty ? int.tryParse(referralCode) : null,
//       "userId": "62a833766ec5dafd6780fc85" // You can dynamically set this
//     };

//     try {
//       final response = await http.post(
//         Uri.parse(url),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(body),
//       );

//       if (response.statusCode == 200) {
//         // Navigate to the next screen on success
//         Navigator.push(context, MaterialPageRoute(builder: (context) => MyExample()));
//       } else {
//         // Handle server error
//         final responseData = jsonDecode(response.body);
//         String errorMessage = responseData['data']['message'] ?? 'Failed to sign up. Try again!';
//         print('Error: $errorMessage');
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(errorMessage)),
//         );
//       }
//     } catch (error) {
//       print('Error: $error');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('An error occurred. Please try again.')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white, 
//       appBar: AppBar(
//         backgroundColor: Colors.white,  
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Container(
//         color: Colors.white, 
//         child: SingleChildScrollView( 
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Image.asset(
//                     'assets/Screenshot 2024-09-05 184913.png',
//                     height: 100,
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 const Text(
//                   "Let's Begin!",
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 const Text(
//                   'Please enter your credentials to proceed',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 TextField(
//                   controller: _emailController,
//                   decoration: const InputDecoration(
//                     labelText: 'Your Email',
//                     border: UnderlineInputBorder(),
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                 ),
//                 const SizedBox(height: 20),
//                 TextField(
//                   controller: _passwordController,
//                   obscureText: !_isPasswordVisible,
//                   decoration: InputDecoration(
//                     labelText: 'Create Password',
//                     border: const UnderlineInputBorder(),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _isPasswordVisible
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _isPasswordVisible = !_isPasswordVisible;
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 TextField(
//                   controller: _referralCodeController,
//                   decoration: const InputDecoration(
//                     labelText: 'Referral Code (Optional)',
//                     border: UnderlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 40), 
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: FloatingActionButton(
//                     onPressed: _signupUser, // Call the signup method here
//                     backgroundColor: Colors.redAccent,
//                     child: const Icon(Icons.arrow_forward),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
