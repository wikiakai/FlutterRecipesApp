import 'package:dio/dio.dart';
import 'package:flutertuts_exam/models/ingredients_model.dart';
import 'package:flutertuts_exam/models/recipes_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../API/api.dart';

class SearchViewModel extends BaseViewModel {
  List<IngredientsModel> allIngredients = [];
  final apiServices = ApiServices();

  bool isLoading = false;

  String errorMsg = "Sorry, there's nothing here";

  void init() {
    getIngredients();
  }

  Future getIngredients() async {
    try {
      isLoading = true;
      notifyListeners();

      allIngredients = await apiServices.getIngredients();

      isLoading = false;
      notifyListeners();

      return allIngredients;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  bool? tmpStatus;

  onCheckBox(IngredientsModel ingredient, bool value) {
    ingredient.isChecked = value;
    tmpStatus = ingredient.isChecked;
    notifyListeners();
  }

  deleteFilter() {
    allIngredients[1] = false as IngredientsModel;
  }

  // List<RecipesModel> recipesList = [];
  final List<RecipesModel> recipesResult = [];

  List<IngredientsModel> filteredIngredients = [];

  Future filterIngredients() async {
    isLoading = false;

    filteredIngredients =
        allIngredients.where((element) => element.isChecked == true).toList();

    List<String> tmpIngreds = filteredIngredients.map((e) => e.name).toList();
    // print(tmpIngreds);
    String url =
        'https://us-central1-fluttertuts-60812.cloudfunctions.net/recipeSuggestion-api/recipes';

    try {
      var response = await Dio().post(url, data: {'ingredients': tmpIngreds});

      if (response.statusCode == 200) {
        var result = response.data['data'] as List;

        print(result);

        recipesResult.clear();
        recipesResult.addAll(List<RecipesModel>.from(
            result.map((e) => RecipesModel.fromJson(e))));

        // print(recipesResult[0].ingredients);

        return recipesResult;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }

    // isLoading = false;
    // notifyListeners();

    // return recipesResult;
  }
}
