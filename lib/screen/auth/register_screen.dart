import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '/widgets/input_field.dart';
import '/utils/constants.dart';
import '/utils/validators.dart';
import 'success_screen.dart';
import '/services/api_service.dart'; // Pastikan import API service

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isPolicyAgreed = false;
  bool _isLoading = false;

  String? _emailError;
  String? _passwordError;

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
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Register',
                  textAlign: TextAlign.center,
                  style: kTitleTextStyle,
                ),
                const SizedBox(height: 40),
                InputField(
                  hintText: 'Enter your username',
                  controller: _usernameController,
                  keyboardType: TextInputType.text,
                  prefixIcon: Icons.person,
                ),
                const SizedBox(height: 16),
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
                const SizedBox(height: 16),
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
                const SizedBox(height: 16),
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
                const SizedBox(height: 20),
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
                          style: const TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Privacy policy',
                              style: kLinkTextStyle,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Privacy policy action
                                },
                            ),
                            const TextSpan(
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
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isPolicyAgreed && !_isLoading
                      ? _validateAndRegister
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _isPolicyAgreed ? kPrimaryColor : Colors.grey,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
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

    try {
      await registerUser(
        _usernameController.text.trim(),
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SuccessScreen()),
      );
    } catch (e) {
      _showError('Registration failed: $e');
    } finally {
      setState(() => _isLoading = false);
    }
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
