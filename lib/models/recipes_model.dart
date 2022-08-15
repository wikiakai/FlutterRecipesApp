import 'dart:isolate';

class RecipesModel {
  String? title;
  List<String>? ingredients;
  String? imageUrl;

  RecipesModel({this.title, this.ingredients, this.imageUrl});

  factory RecipesModel.fromJson(Map<String, dynamic> json) {
    var ings = json['ingredients'] as List;
    List<String> ingreds = ings.map((e) => e.toString()).toList();
    // json['ingredients'].map((e) => ingreds);

    return RecipesModel(
        title: json['title'], ingredients: ingreds, imageUrl: json['imageUrl']);
  }
}
