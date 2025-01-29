import 'package:flutter/material.dart';
import 'package:latihan/screen/pages/saved_recipes_page.dart';
import 'home_screen.dart';
import 'search_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Menghilangkan tombol back
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 100, // Menambah tinggi AppBar
        title: Padding(
          padding: const EdgeInsets.only(top: 60), // Geser teks lebih ke bawah
          child: Text(
            'Profile',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              // Profile Picture
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile.png'), // Ganti sesuai lokasi gambar
              ),
              SizedBox(height: 16),
              // Name and Username
              Text(
                'Muhammad Saldy Ramadhan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '@saldayy',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              // Input Fields
              ProfileInputField(label: 'Change Name'),
              SizedBox(height: 12),
              ProfileInputField(label: 'Change Email'),
              SizedBox(height: 12),
              ProfileInputField(label: 'Change Password'),
              SizedBox(height: 12),
              ProfileInputField(label: 'Change User ID Name'),
              SizedBox(height: 20),
              // Confirm Button
              ElevatedButton(
                onPressed: () {
                  // Tambahkan aksi konfirmasi di sini
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1F41BB), // Warna biru pada tombol
                  minimumSize: Size(double.infinity, 50), // Lebar tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3, // Index untuk tab Profile
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()), // Ganti dengan halaman Home
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()), // Ganti dengan halaman Search
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
               MaterialPageRoute(builder: (context) => SavedRecipesPage(savedRecipes: [])), // Ganti dengan halaman Saved
            );
          } else if (index == 3) {
            // Tetap di halaman Profile
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class ProfileInputField extends StatelessWidget {
  final String label;

  const ProfileInputField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      ),
    );
  }
}
