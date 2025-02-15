import 'package:flutter/material.dart';
import 'package:taskify/domain/entities/category.dart';
import 'package:taskify/domain/use_cases/categories/add_category.dart';
import 'package:taskify/domain/use_cases/categories/delete_category.dart';
import 'package:taskify/domain/use_cases/categories/get_categories.dart';

class CategoryProvider with ChangeNotifier {
  final AddCategory addCategory;
  final GetCategories getCategories;
  final DeleteCategory deleteCategory;
  List<Category> _categories = [];

  CategoryProvider({
    required this.addCategory,
    required this.getCategories,
    required this.deleteCategory,
  });

  List<Category> get categories => _categories;

  Future<void> fetchCategories() async {
    _categories = await getCategories();
    notifyListeners();
  }

  Future<void> addNewCategory(Category category) async {
    await addCategory(category);
    await fetchCategories();
  }

  Future<void> removeCategory(String categoryId) async {
    await deleteCategory(categoryId);
    await fetchCategories();
  }
}
