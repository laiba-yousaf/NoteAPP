import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/app/app.bottomsheets.dart';
import 'package:todo_app/app/app.dialogs.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.router.dart';
import 'package:todo_app/services/firestore_service_service.dart'
    show FirestoreServiceService;
import 'package:todo_app/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/ui/models/notes_model.dart';
import 'package:todo_app/ui/views/login/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeViewModel extends BaseViewModel {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController integerController = TextEditingController();
  final FirestoreServiceService _firestoreService = FirestoreServiceService();
  final _navigationService = locator<NavigationService>();

  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showEditScreen(String title, String description, NotesModel notesModel) {
    _navigationService.navigateToEditScreenView(
        title: title, descrip: description, notesModel: notesModel);
  }

  void addScreen() {
    _navigationService.navigateToAddNotesView();
  }

  void showDeleteDialog(String title, NotesModel notesModel) {
    _dialogService.showCustomDialog(variant: DialogType.delete, data: {
      'title': title,
      'notesModel': notesModel,
    });
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  Stream<List<NotesModel>> getNotesStream() {
    return _firestoreService.getNotes();
  }

  // void delete(NotesModel notesModel) {
  //   notesModel.delete();
  // }


   logout() async {
    await FirebaseAuth.instance.signOut().then((value) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      _navigationService.clearStackAndShowView(const LoginView());
    });
  }
}
