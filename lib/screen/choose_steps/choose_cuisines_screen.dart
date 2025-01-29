import 'package:flutter/material.dart';
import 'choose_skill_screen.dart';

class ChooseCuisinesScreen extends StatefulWidget {
  const ChooseCuisinesScreen({super.key});

  @override
  _ChooseCuisinesScreenState createState() => _ChooseCuisinesScreenState();
}

class _ChooseCuisinesScreenState extends State<ChooseCuisinesScreen> {
  final List<String> _selectedCuisines = [];

  final List<String> _cuisines = [
    'European',
    'African',
    'Asian',
    'Middle-Eastern',
    'Latin America',
  ];

  final TextEditingController _otherCuisineController = TextEditingController();

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
                  backgroundColor: index == 3 ? Colors.green : Colors.grey[300],
                  child: Text(
                    (index + 1).toString(),
                    style: TextStyle(
                      color: index == 3 ? Colors.white : Colors.black,
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
                MaterialPageRoute(builder: (context) => ChooseSkillScreen()),
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
              "Types of cuisines you most interested in?",
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.bold,
                height: 1.3,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "This will help us curate more recipe experiences for you.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 30),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: _cuisines.map((cuisine) {
                return ChoiceChip(
                  label: Text(
                    cuisine,
                    style: TextStyle(
                      color: _selectedCuisines.contains(cuisine)
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  selected: _selectedCuisines.contains(cuisine),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedCuisines.add(cuisine);
                      } else {
                        _selectedCuisines.remove(cuisine);
                      }
                    });
                  },
                  selectedColor: Color(0xFF1F41BB),
                  backgroundColor: Colors.grey[200],
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              "Others (Please Specify)",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _otherCuisineController,
              decoration: InputDecoration(
                hintText: 'Type here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context); // Kembali ke halaman sebelumnya
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Color(0xFF1F41BB)),
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Previous',
                      style: TextStyle(fontSize: 18, color: Color(0xFF1F41BB)),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChooseSkillScreen()),
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
                    'Last Step',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
