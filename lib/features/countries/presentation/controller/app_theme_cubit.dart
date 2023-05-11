import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/network/local/cache_helper.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppInitial());

  static AppThemeCubit get(context) => BlocProvider.of(context);


  bool isDark = false;


  void changeAppTheme({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeAppThemeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(ChangeAppThemeState());
      });
    }
  }
}
