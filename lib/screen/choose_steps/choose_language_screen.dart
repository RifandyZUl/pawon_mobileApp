import 'package:flutter/material.dart';
import 'choose_allergies_screen.dart';

class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({super.key});

  @override
  _ChooseLanguageScreenState createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  String? _selectedLanguage;
  final TextEditingController _otherLanguageController = TextEditingController();

  @override
  void dispose() {
    _otherLanguageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: index == 0 ? Colors.green : Colors.grey[300],
                  child: Text(
                    (index + 1).toString(),
                    style: TextStyle(
                      color: index == 0 ? Colors.white : Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChooseAllergiesScreen(),
                ),
              );
            },
            child: Text(
              'Skip',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "What's your preferred language for the app?",
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.bold,
                height: 1.3, // Line height adjustment
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Select the language that you'd prefer to use while exploring Recipe Passport.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 30),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildLanguageOption('English'),
                _buildLanguageOption('Indonesia'),
                _buildLanguageOption('Melayu'),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: _otherLanguageController,
              decoration: InputDecoration(
                labelText: 'Others (Please Specify)',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.zero, // Tidak ada radius
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = null;
                });
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChooseAllergiesScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1F41BB),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Next Step',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(String language) {
    return ChoiceChip(
      label: Text(
        language,
        style: TextStyle(
          color: _selectedLanguage == language ? Colors.white : Colors.black,
        ),
      ),
      selected: _selectedLanguage == language,
      onSelected: (selected) {
        setState(() {
          _selectedLanguage = selected ? language : null;
          _otherLanguageController.clear();
        });
      },
      selectedColor: Color(0xFF1F41BB),
      backgroundColor: Colors.grey[200],
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }
}
