import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/models/notes_model.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Notes APP",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                  onTap: () {
                    viewModel.logout();
                  },
                  child: const Icon(
                    Icons.logout,
                    color: kcDarkGreyColor,
                  )),
            )
          ],
          backgroundColor: kcPrimaryColor),
      body: StreamBuilder<List<NotesModel>>(
        stream: viewModel.getNotesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final data = snapshot.data!;
          if (data.isEmpty) {
            return const Center(
              child: Text(
                "No Notes Available",
                style: TextStyle(fontSize: 18, color: kcDarkGreyColor),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: data.length,
            itemBuilder: (BuildContext context, index) {
              final note = data[index];
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Colors.white,
                shadowColor: kcPrimaryColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              note.title.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: kcPrimaryColor,
                              ),
                            ),
                          ),
                          IconButton(
                            icon:
                                const Icon(Icons.edit, color: kcSecondaryColor),
                            onPressed: () {
                              viewModel.showEditScreen(
                                note.title.toString(),
                                note.description.toString(),
                                note,
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: kcRedColor),
                            onPressed: () {
                              viewModel.showDeleteDialog(
                                note.title.toString(),
                                note,
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Description: ${note.description.toString()}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.addScreen();
        },
        backgroundColor: kcPrimaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
