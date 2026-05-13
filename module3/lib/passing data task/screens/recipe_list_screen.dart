import 'package:flutter/material.dart';

import '../models/recipe.dart';
import 'recipe_details_screen.dart';

class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({super.key});

  final List<Recipe> recipes = const [
    Recipe(
      name: 'Pasta',
      cookingTime: '20 mins',
      description: 'Creamy white sauce pasta with vegetables.',
      difficulty: 'Easy',
    ),
    Recipe(
      name: 'Fried Rice',
      cookingTime: '30 mins',
      description: 'Spicy fried rice with mixed vegetables.',
      difficulty: 'Medium',
    ),
    Recipe(
      name: 'Pizza',
      cookingTime: '40 mins',
      description: 'Cheesy homemade pizza with fresh toppings.',
      difficulty: 'Hard',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe App'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.restaurant_menu),
              title: Text(recipe.name),
              subtitle: Text(recipe.cookingTime),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RecipeDetailsScreen(
                      recipe: recipe,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}