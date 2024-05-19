part of 'tab_index_bloc.dart';

@immutable
sealed class TabIndexState {}

class TabChangeIndexState extends TabIndexState {
  final int? index;

  TabChangeIndexState(this.index);
}
