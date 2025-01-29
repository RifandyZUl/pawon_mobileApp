import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '/widgets/input_field.dart';
import '/utils/constants.dart';
import '/utils/validators.dart';
import 'success_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isPolicyAgreed = false;
  bool _isLoading = false;

  String? _emailError; // Menyimpan pesan error untuk email
  String? _passwordError; // Menyimpan pesan error untuk password

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.06,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Register',
                  textAlign: TextAlign.center,
                  style: kTitleTextStyle,
                ),
                SizedBox(height: 40),
                InputField(
                  hintText: 'Enter your email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email,
                  onChanged: (value) {
                    setState(() {
                      _emailError = isValidEmail(value)
                          ? null
                          : 'Invalid email address.';
                    });
                  },
                  errorText: _emailError,
                ),
                SizedBox(height: 16),
              InputField(
                hintText: 'Enter your password',
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                prefixIcon: Icons.lock,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                onChanged: (value) {
                  setState(() {
                    _passwordError = getPasswordError(value);
                  });
                },
                errorText: _passwordError,
              ),

                SizedBox(height: 16),
                InputField(
                  hintText: 'Confirm your password',
                  controller: _confirmPasswordController,
                  obscureText: !_isConfirmPasswordVisible,
                  prefixIcon: Icons.lock,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                ),

                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: _isPolicyAgreed,
                      onChanged: (value) {
                        setState(() {
                          _isPolicyAgreed = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: 'I agree to the ',
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Privacy policy',
                              style: kLinkTextStyle,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Privacy policy action
                                },
                            ),
                            TextSpan(
                              text: ' and ',
                            ),
                            TextSpan(
                              text: 'Terms of use.',
                              style: kLinkTextStyle,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Terms of use action
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isPolicyAgreed && !_isLoading
                      ? _validateAndRegister
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isPolicyAgreed
                        ? kPrimaryColor
                        : Colors.grey,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: _isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateAndRegister() async {
    if (!_validateInputs()) return;

    setState(() => _isLoading = true);
    await Future.delayed(Duration(seconds: 2));
    setState(() => _isLoading = false);

    Navigator.push(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => SuccessScreen()),
    );
  }

  bool _validateInputs() {
    if (!isValidEmail(_emailController.text)) {
      _showError('Invalid email address.');
      return false;
    }

    if (!isValidPasswordComplex(_passwordController.text)) {
      _showError('Password does not meet criteria.');
      return false;
    }

    if (!arePasswordsMatching(
        _passwordController.text, _confirmPasswordController.text)) {
      _showError('Passwords do not match.');
      return false;
    }

    return true;
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: kErrorColor),
    );
  }
}
