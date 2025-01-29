import 'package:flutter/material.dart';

class SavedRecipesProvider with ChangeNotifier {
  List<Map<String, String>> _savedRecipes = [];

  List<Map<String, String>> get savedRecipes => _savedRecipes;

  // Method to check if a recipe is saved
  bool isSaved(String title) {
    return _savedRecipes.any((recipe) => recipe['title'] == title);
  }

  // Method to add a recipe to the saved list
  void addRecipe(Map<String, String> recipe) {
    _savedRecipes.add(recipe);
    notifyListeners();
  }

  // Method to remove a recipe from the saved list
  void removeRecipe(Map<String, String> recipe) {
    _savedRecipes.removeWhere((item) => item['title'] == recipe['title']);
    notifyListeners();
  }

  // Method to add a saved recipe by title (without needing the full recipe data)
  void addSavedRecipe(String title) {
    // You may want to get the full recipe data from somewhere (e.g., a list of all recipes)
    // Assuming you have a list of recipes available:
    // Map<String, String> recipe = getRecipeByTitle(title); 
    _savedRecipes.add({'title': title});
    notifyListeners();
  }

  // Method to remove a saved recipe by title
  void removeSavedRecipe(String title) {
    _savedRecipes.removeWhere((recipe) => recipe['title'] == title);
    notifyListeners();
  }
}
