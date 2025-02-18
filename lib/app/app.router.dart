// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i9;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i11;
import 'package:todo_app/ui/models/notes_model.dart' as _i10;
import 'package:todo_app/ui/views/add_notes/add_notes_view.dart' as _i4;
import 'package:todo_app/ui/views/edit_screen/edit_screen_view.dart' as _i5;
import 'package:todo_app/ui/views/home/home_view.dart' as _i2;
import 'package:todo_app/ui/views/login/login_view.dart' as _i6;
import 'package:todo_app/ui/views/reset_password/reset_password_view.dart'
    as _i8;
import 'package:todo_app/ui/views/sign_up/sign_up_view.dart' as _i7;
import 'package:todo_app/ui/views/startup/startup_view.dart' as _i3;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const addNotesView = '/add-notes-view';

  static const editScreenView = '/edit-screen-view';

  static const loginView = '/login-view';

  static const signUpView = '/sign-up-view';

  static const resetPasswordView = '/reset-password-view';

  static const all = <String>{
    homeView,
    startupView,
    addNotesView,
    editScreenView,
    loginView,
    signUpView,
    resetPasswordView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.addNotesView,
      page: _i4.AddNotesView,
    ),
    _i1.RouteDef(
      Routes.editScreenView,
      page: _i5.EditScreenView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i6.LoginView,
    ),
    _i1.RouteDef(
      Routes.signUpView,
      page: _i7.SignUpView,
    ),
    _i1.RouteDef(
      Routes.resetPasswordView,
      page: _i8.ResetPasswordView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.AddNotesView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.AddNotesView(),
        settings: data,
      );
    },
    _i5.EditScreenView: (data) {
      final args = data.getArgs<EditScreenViewArguments>(nullOk: false);
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.EditScreenView(
            key: args.key,
            title: args.title,
            descrip: args.descrip,
            notesModel: args.notesModel),
        settings: data,
      );
    },
    _i6.LoginView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.LoginView(),
        settings: data,
      );
    },
    _i7.SignUpView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.SignUpView(),
        settings: data,
      );
    },
    _i8.ResetPasswordView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.ResetPasswordView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class EditScreenViewArguments {
  const EditScreenViewArguments({
    this.key,
    required this.title,
    required this.descrip,
    required this.notesModel,
  });

  final _i9.Key? key;

  final String title;

  final String descrip;

  final _i10.NotesModel notesModel;

  @override
  String toString() {
    return '{"key": "$key", "title": "$title", "descrip": "$descrip", "notesModel": "$notesModel"}';
  }

  @override
  bool operator ==(covariant EditScreenViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.title == title &&
        other.descrip == descrip &&
        other.notesModel == notesModel;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        title.hashCode ^
        descrip.hashCode ^
        notesModel.hashCode;
  }
}

extension NavigatorStateExtension on _i11.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddNotesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addNotesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditScreenView({
    _i9.Key? key,
    required String title,
    required String descrip,
    required _i10.NotesModel notesModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.editScreenView,
        arguments: EditScreenViewArguments(
            key: key, title: title, descrip: descrip, notesModel: notesModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToResetPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.resetPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddNotesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.addNotesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditScreenView({
    _i9.Key? key,
    required String title,
    required String descrip,
    required _i10.NotesModel notesModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.editScreenView,
        arguments: EditScreenViewArguments(
            key: key, title: title, descrip: descrip, notesModel: notesModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithResetPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.resetPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
