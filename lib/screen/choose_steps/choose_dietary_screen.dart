import 'package:flutter/material.dart';
import 'choose_cuisines_screen.dart';

/// Halaman untuk memilih pembatasan diet user.
/// User dapat memilih opsi yang disediakan atau melewati halaman ini.
class DietaryRestrictionsScreen extends StatefulWidget {
  const DietaryRestrictionsScreen({super.key});

  @override
  State<DietaryRestrictionsScreen> createState() =>
      _DietaryRestrictionsScreenState();
}

class _DietaryRestrictionsScreenState extends State<DietaryRestrictionsScreen> {
  /// Variabel untuk menyimpan opsi diet yang dipilih
  String _selectedDiet = 'None';

  /// List berisi semua opsi pembatasan diet
  final List<String> _dietaryOptions = [
    'None',
    'Vegan',
    'Lactose Intolerance',
    'Soy Allergy',
    'Pescatarian',
    'Gluten-Free',
    'Shellfish Allergy',
    'Vegetarian',
    'Kosher',
    'Halal',
    'Nut Allergy',
    'Diabetic Diet'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar untuk menampilkan progress bar dan tombol Skip
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Menghilangkan shadow di bawah AppBar
        leading: _buildProgressBar(), // Menampilkan progress bar
        actions: [
          TextButton(
            onPressed: () {
              // Navigasi ke halaman ChooseCuisinesScreen saat tombol Skip ditekan
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ChooseCuisinesScreen(),
                ),
              );
            },
            child: const Text(
              'Skip',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      /// Body utama halaman
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            /// Judul halaman
            const Text(
              'Do you have any dietary restrictions?',
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            /// Deskripsi tambahan
            const Text(
              'This will help us curate more recipe experiences for you.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 30),
            /// Widget untuk menampilkan daftar opsi diet dalam bentuk ChoiceChip
            Wrap(
              spacing: 10, // Jarak horizontal antar chip
              runSpacing: 10, // Jarak vertikal antar chip
              children: _dietaryOptions.map((diet) {
                return ChoiceChip(
                  label: Text(
                    diet,
                    style: TextStyle(
                      color: _selectedDiet == diet
                          ? Colors.white // Warna teks saat dipilih
                          : Colors.black, // Warna teks saat tidak dipilih
                    ),
                  ),
                  selected: _selectedDiet == diet, // Status pilihan chip
                  selectedColor: const Color(0xFF1F41BB), // Warna chip saat dipilih
                  backgroundColor: Colors.grey[200], // Warna chip default
                  onSelected: (selected) {
                    setState(() {
                      _selectedDiet = diet; // Update pilihan diet
                    });
                  },
                );
              }).toList(),
            ),
            const Spacer(), // Mengisi ruang kosong di antara widget
            _buildNavigationButtons(), // Tombol navigasi (Previous & Next)
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// Widget untuk menampilkan progress bar
  Widget _buildProgressBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: CircleAvatar(
              radius: 10,
              backgroundColor:
                  index == 2 ? Colors.green : Colors.grey[300], // Menandai langkah ke-3
              child: Text(
                (index + 1).toString(),
                style: TextStyle(
                  color: index == 2 ? Colors.white : Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  /// Widget untuk tombol navigasi Previous dan Next
  Widget _buildNavigationButtons() {
    return Row(
      children: [
        /// Tombol Previous
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              Navigator.pop(context); // Kembali ke halaman sebelumnya
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFF1F41BB)), // Warna border
              minimumSize: const Size(double.infinity, 50), // Ukuran minimum tombol
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Previous',
              style: TextStyle(fontSize: 18, color: Color(0xFF1F41BB)),
            ),
          ),
        ),
        const SizedBox(width: 16),
        /// Tombol Next Step
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Navigasi ke halaman ChooseCuisinesScreen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ChooseCuisinesScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1F41BB), // Warna background tombol
              minimumSize: const Size(double.infinity, 50), // Ukuran minimum tombol
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Next Step',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
