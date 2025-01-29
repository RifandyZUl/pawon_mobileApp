import 'package:flutter/material.dart';

class SuccessScreenPasswordChanged extends StatelessWidget {
  const SuccessScreenPasswordChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Success'),
        automaticallyImplyLeading: false, // Hilangkan tombol back di AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, size: 100, color: Colors.green), // Warna hijau untuk kesan sukses
            SizedBox(height: 20),
            Text(
              'Password Changed',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Teks dengan warna gelap untuk kontras
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Your password has been changed successfully.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst); 
                // Kembali ke halaman login
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1F41BB), // Warna tombol utama
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text(
                'Back to Login',
                style: TextStyle(
                  color: Colors.white, // Teks putih
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
