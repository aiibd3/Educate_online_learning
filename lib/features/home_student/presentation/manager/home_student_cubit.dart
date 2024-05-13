import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_student_state.dart';

class HomeStudentCubit extends Cubit<HomeStudentState> {
  HomeStudentCubit() : super(HomeStudentInitial());
}
