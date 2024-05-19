part of 'tab_index_bloc.dart';

@immutable
sealed class TabIndexEvent {}

class TabIndexNewIndexEvent  extends TabIndexEvent{
  final int index;
 
  
  TabIndexNewIndexEvent(this.index);
}
