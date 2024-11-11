import 'dart:html';

import '../../model/categories_model.dart';

class FetchCategories {
  final List<Categories> categories;
  final isLoading;
  final String? error;
  final VoidCallback refetch;

  FetchCategories({
    required this.categories,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });
}