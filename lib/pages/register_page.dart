import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  RegisterPageState  createState() => RegisterPageState ();
}

class RegisterPageState  extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _registerUser() async {
    setState(() {
      _isLoading = true;
    });

    final email = _emailController.text;
    final userName = _usernameController.text;
    final password = _passwordController.text;
    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;
    final phoneNumber = _phoneController.text;

    if (!RegExp(r'^\d{10}$').hasMatch(phoneNumber)) {
      setState(() {
        _errorMessage = 'Please enter a valid 10-digit phone number.';
        _isLoading = false;
      });
      return;
    }

    if (userName.isNotEmpty  &&  email.isNotEmpty && password.isNotEmpty) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("fake_email", email);
      await prefs.setString("fake_username", userName);
      await prefs.setString("fake_password", password);
      await prefs.setString("fake_firstname", firstName);
      await prefs.setString("fake_lastname", lastName);
      
      if(!mounted) return;
      
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration successful! (Fake)')),
      );

      Navigator.pop(context);
    } else {
      setState(() {
        _errorMessage = "All fields are required";
      });
    }

    setState(() {
      _isLoading = false;
    });
}


  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: const Text('Register'),
     centerTitle: true),
     body: Center(
       child: Padding(
         padding: const EdgeInsets.all(16.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             _buildTextField(_emailController, 'Email'),
             _buildTextField(_usernameController, 'User Name'),
             _buildTextField(_passwordController, 'Password', isPassword: true),
             _buildTextField(_firstNameController, 'First Name'),
             _buildTextField(_lastNameController, 'Last Name'),
             _buildTextField(_phoneController, 'Phone Number', inputType: TextInputType.phone),
             const SizedBox(height: 10),
             if (_errorMessage != null)
               Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
             const SizedBox(height: 20),
             _isLoading
                 ? const CircularProgressIndicator()
                 : SizedBox(
                     width: 150,
                     child: ElevatedButton(
                         onPressed: _registerUser,
                         child: const Text("Register")
                     ),
                 )
           ],
         ),
       ),
     ),
   );
  }
  bool _isPasswordVisible = false;

  Widget _buildTextField(TextEditingController controller, String label,
  {bool isPassword = false, TextInputType inputType = TextInputType.text}) {
    return SizedBox(
      width: 300,
      child: TextField(
        controller: controller,
        obscureText: isPassword ? !_isPasswordVisible : false,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: isPassword
            ? IconButton(
              icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
            onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
            },
          )
              : null,
        ),
      ),
    );
  }
}
