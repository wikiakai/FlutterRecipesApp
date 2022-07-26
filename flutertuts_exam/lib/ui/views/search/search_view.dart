import 'package:flutertuts_exam/ui/views/search/search_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../constants/style.dart';
import '../result/result_view.dart';

class SearchView extends ViewModelBuilderWidget<SearchViewModel> {
  SearchView({Key? key}) : super(key: key);

  @override
  viewModelBuilder(BuildContext context) => SearchViewModel();

  @override
  void onViewModelReady(SearchViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.init();
  }

  @override
  Widget builder(
      BuildContext context, SearchViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search recipes')),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: () async {
              await viewModel.filterIngredients();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultView(viewModel.recipesResult),
                ),
              );
            },
            icon: const Icon(Icons.search),
            label: const Text('Apply'),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(primary: Colors.red),
            onPressed: () {},
            icon: const Icon(Icons.clear),
            label: const Text('Clear'),
          ),
        ],
      ),
      body: viewModel.isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Color(0xff14213d)))
          : viewModel.allIngredients.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    child: Wrap(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Get your recommendation food:',
                          style: headline2,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SingleChildScrollView(
                          child: Wrap(
                            children: [
                              viewModel.allIngredients.isNotEmpty
                                  ? Column(
                                      children: [
                                        ...viewModel.allIngredients.map(
                                          (ingredient) => Column(
                                            children: [
                                              Card(
                                                child: CheckboxListTile(
                                                  secondary: const Icon(Icons
                                                      .emoji_food_beverage),
                                                  value: ingredient.isChecked,
                                                  onChanged: (value) =>
                                                      // ingredient.isChecked = !value!,
                                                      viewModel.onCheckBox(
                                                          ingredient, value!),
                                                  title: Text(ingredient.name),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: const [
                                        Center(
                                          child: Text(
                                              "There's nothing here, Try to hit the button!"),
                                        ),
                                      ],
                                    )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Center(
                  child: Text(viewModel.errorMsg),
                ),
    );
  }
}
