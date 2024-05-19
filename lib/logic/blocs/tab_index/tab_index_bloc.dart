import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tab_index_event.dart';
part 'tab_index_state.dart';

class TabIndexBloc extends Bloc<TabIndexEvent, TabIndexState> {
  TabIndexBloc() : super(TabChangeIndexState(0)) {
    on<TabIndexNewIndexEvent>((event, emit) async {
      emit(TabChangeIndexState(event.index));
    });
  }
}
