import 'package:dio/dio.dart';
import 'package:flutertuts_exam/models/ingredients_model.dart';

import '../models/recipes_model.dart';

class ApiServices {
  List<String> allSpices = [];

  bool isLoading = false;

  Future getSpices() async {
    final dio = Dio();
    var url =
        'https://us-central1-fluttertuts-60812.cloudfunctions.net/recipeSuggestion-api/spices';

    try {
      var response = await dio.get(url);
      allSpices.clear();
      allSpices.addAll(List<String>.from(response.data['data']));
      return allSpices;
    } catch (e) {
      print(e);
    }
  }

  List<IngredientsModel> allIngredients = [];

  Future<List<IngredientsModel>> getIngredients() async {
    final dio = Dio();
    var url =
        'https://us-central1-fluttertuts-60812.cloudfunctions.net/recipeSuggestion-api/ingredients';

    try {
      var response = await dio.get(url);
      allIngredients.clear();
      var data = response.data['data'] as List;

      allIngredients.addAll(data.map((e) => IngredientsModel(name: e)));

      return allIngredients;
    } catch (e) {
      print(e);
      return [];
    }
  }

  List<RecipesModel> recipesResult = [];
  List<IngredientsModel> filteredIngredients = [];

  Future<List<RecipesModel>> filterIngredients() async {
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

        recipesResult.addAll(List<RecipesModel>.from(
            result.map((e) => RecipesModel.fromJson(e))));

        // final recipesResult = List<RecipesModel>.from(
        //     result.map((e) => RecipesModel.fromJson(e)));

        print(recipesResult);

        return recipesResult;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
