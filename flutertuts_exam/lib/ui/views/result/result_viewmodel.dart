import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';

import '../../../API/api.dart';
import '../../../models/recipes_model.dart';

class ResultViewModel extends BaseViewModel {
  bool isLoading = false;
  final apiServices = ApiServices();

  ResultViewModel(this.recipesResult);

  List<RecipesModel> filteredIngredients = [];

  List<RecipesModel> recipesResult = [];
}
