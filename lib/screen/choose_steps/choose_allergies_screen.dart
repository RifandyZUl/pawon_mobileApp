import 'package:flutter/material.dart';
import 'choose_dietary_screen.dart'; // Import halaman dietary restrictions

class ChooseAllergiesScreen extends StatefulWidget {
  const ChooseAllergiesScreen({super.key});

  @override
  _ChooseAllergiesScreenState createState() => _ChooseAllergiesScreenState();
}

class _ChooseAllergiesScreenState extends State<ChooseAllergiesScreen> {
  final List<String> _selectedItems = [];

  final List<Map<String, String>> _allergies = [
    {'label': 'Shrimp', 'icon': '🍤'},
    {'label': 'Carrot', 'icon': '🥕'},
    {'label': 'Mushroom', 'icon': '🍄'},
    {'label': 'Onion', 'icon': '🧅'},
    {'label': 'Bell Pepper', 'icon': '🫑'},
    {'label': 'Garlic', 'icon': '🧄'},
    {'label': 'Apple', 'icon': '🍏'},
    {'label': 'Eggplant', 'icon': '🍆'},
    {'label': 'Banana', 'icon': '🍌'},
    {'label': 'Lemon', 'icon': '🍋'},
    {'label': 'Pineapple', 'icon': '🍍'},
    {'label': 'Avocado', 'icon': '🥑'},
    {'label': 'Chicken', 'icon': '🍗'},
    {'label': 'Beef', 'icon': '🥩'},
    {'label': 'Almond Milk', 'icon': '🥛'},
    {'label': 'Greek Yoghurt', 'icon': '🥛'},
    {'label': 'Potatoes', 'icon': '🥔'},
    {'label': 'Egg', 'icon': '🥚'},
    {'label': 'Tomatoes', 'icon': '🍅'},
    {'label': 'Mayonnaise', 'icon': '🥫'},
    {'label': 'Olives', 'icon': '🫒'},
    {'label': 'Rice', 'icon': '🍚'},
    {'label': 'Basil', 'icon': '🌿'},
    {'label': 'Soy Sauce', 'icon': '🧂'},
    {'label': 'Salt', 'icon': '🧂'},
  ];

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
                  backgroundColor: index == 1 ? Colors.green : Colors.grey[300],
                  child: Text(
                    (index + 1).toString(),
                    style: TextStyle(
                      color: index == 1 ? Colors.white : Colors.black,
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
                  builder: (context) => DietaryRestrictionsScreen(),
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
      body: SingleChildScrollView( // Tambahkan SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "Do you have any allergies or dislikes?",
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
                children: _allergies.map((allergy) {
                  return ChoiceChip(
                    label: Text(
                      "${allergy['icon']} ${allergy['label']}",
                      style: TextStyle(
                        color: _selectedItems.contains(allergy['label'])
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    selected: _selectedItems.contains(allergy['label']),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _selectedItems.add(allergy['label']!);
                        } else {
                          _selectedItems.remove(allergy['label']!);
                        }
                      });
                    },
                    selectedColor: Color(0xFF1F41BB),
                    backgroundColor: Colors.grey[200],
                  );
                }).toList(),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
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
                        style: TextStyle(
                            fontSize: 18, color: Color(0xFF1F41BB)),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DietaryRestrictionsScreen(),
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
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
