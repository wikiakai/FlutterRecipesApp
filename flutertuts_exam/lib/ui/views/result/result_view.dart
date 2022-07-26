import 'package:flutertuts_exam/models/recipes_model.dart';
import 'package:flutertuts_exam/ui/views/result/result_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../constants/style.dart';

class ResultView extends ViewModelBuilderWidget<ResultViewModel> {
  ResultView(this.recipesResult, {Key? key}) : super(key: key);

  List<RecipesModel> recipesResult = [];

  @override
  viewModelBuilder(BuildContext context) => ResultViewModel(recipesResult);

  @override
  Widget builder(
      BuildContext context, ResultViewModel viewModel, Widget? child) {
    // List<RecipesModel> recipesResult =
    return Scaffold(
        appBar: AppBar(title: const Text('Search result')),
        body: viewModel.isLoading
            ? const Center(child: CircularProgressIndicator(color: Colors.cyan))
            : viewModel.recipesResult.isNotEmpty
                ? SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Center(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          // crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            ...recipesResult
                                .map(
                                  (recipe) => Container(
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.network(
                                              '${recipe.imageUrl}',
                                              width: 270,
                                              height: 200,
                                            ),
                                            Text(
                                              '${recipe.title}',
                                              style: headline2,
                                            ),
                                            Text(
                                                'Bahan: ${recipe.ingredients!.toList()}'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList()
                          ],
                        ),
                      ),
                    ),
                  )
                : const Center(
                    child: Text("Sorry, there's no data here!"),
                  ));
  }
}
