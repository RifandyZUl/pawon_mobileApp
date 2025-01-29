import 'package:flutter/material.dart';
import '../pages/home_screen.dart'; // Ubah nama file jika lokasi HomePage Anda berbeda

class ChooseSkillScreen extends StatefulWidget {
  const ChooseSkillScreen({super.key});

  @override
  State<ChooseSkillScreen> createState() => _ChooseSkillScreenState();
}

class _ChooseSkillScreenState extends State<ChooseSkillScreen> {
  String _selectedSkill = 'Intermediate';

  final List<String> _skillOptions = ['Beginner', 'Intermediate', 'Advanced'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: _buildProgressBar(),
        actions: [
          TextButton(
            onPressed: () {
              // Navigasi ke HomePage ketika tombol Skip ditekan
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            child: const Text(
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
            const SizedBox(height: 20),
            const Text(
              'Lastly, how skilled are you in the kitchen?',
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'This will help us curate more recipe experiences for you.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 30),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: _skillOptions.map((skill) {
                return ChoiceChip(
                  label: Text(
                    skill,
                    style: TextStyle(
                      color: _selectedSkill == skill
                          ? Colors.white
                          : Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  selected: _selectedSkill == skill,
                  selectedColor: const Color(0xFF1F41BB),
                  backgroundColor: Colors.grey[200],
                  onSelected: (bool selected) {
                    setState(() {
                      _selectedSkill = skill;
                    });
                  },
                );
              }).toList(),
            ),
            const Spacer(),
            _buildNavigationButtons(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: index == 4
                  ? const Color(0xFF1F41BB)
                  : Colors.grey[300],
              child: Text(
                (index + 1).toString(),
                style: TextStyle(
                  color: index == 4 ? Colors.white : Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFF1F41BB)),
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Previous',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF1F41BB),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Navigasi ke HomePage ketika tombol Complete ditekan
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1F41BB),
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Complete',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
