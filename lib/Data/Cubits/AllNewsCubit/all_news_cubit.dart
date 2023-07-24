import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/Data/Repositories/all_news_repo.dart';

import '../../Models/all_news/all_news.dart';

part 'all_news_state.dart';

class AllNewsCubit extends Cubit<AllNewsState> {
  AllNewsCubit() : super(AllNewsInitial());

  getAllNews() {
    emit(AllNewsLoading());

    AllNewsRepo().getAllNews().then((value) {
      if (value != null) {
        emit(AllNewsSuccess(ourResponse: value));
      } else {
        emit(AllNewsError());
      }
    });
  }
}
