import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/search_screen_module.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  int screenIndex = 0;
  List<Widget> currentScreen =[
    SearchScreenModule(),
  ];

  static AppCubit get(context) => BlocProvider.of(context);

  void changeScreenIndex({required int index})
  {
    this.screenIndex=index;
    emit(ChangeScreenState());
  }
}
