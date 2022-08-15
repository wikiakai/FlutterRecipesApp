import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../constants/style.dart';
import '../../../shared/widgets/carousel_slider.dart';
import '../search/search_view.dart';
import 'home_viewmodel.dart';

class HomeView extends ViewModelBuilderWidget<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  viewModelBuilder(BuildContext context) => HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.init();
  }

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterTuts Exam'),
        leading: Image.asset('assets/app_icon.png'),
      ),
      body: SingleChildScrollView(
        // controller: controller,
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: Wrap(
                children: [
                  const Center(
                      child: Text(
                    "Today's highlight",
                    style: headline1,
                  )),
                  SizedBox(
                    // padding: EdgeInsets.symmetric(ver),
                    height: 480,
                    child: carouselSlider(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: cross,
                    children: [
                      ElevatedButton.icon(
                          icon: const Icon(Icons.refresh),
                          label: const Text('Refresh'),
                          onPressed: viewModel.getSpices),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.search_rounded),
                        label: const Text('Search recipes'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchView()),
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
            mediumMargin,
            viewModel.isLoading
                ? const Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Center(
                        child: CircularProgressIndicator(
                            color: Color(0xff14213d))),
                  )
                : viewModel.allSpices.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            ...viewModel.allSpices.map(
                              (e) => Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    e,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : const Center(
                        child: Text('Hit the button!'),
                      ),
          ],
        ),
      ),
    );
  }
}
