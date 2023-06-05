import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'is_first_time_state.dart';

class IsFirstTimeCubit extends Cubit<IsFirstTimeState> {
  IsFirstTimeCubit() : super(IsFirstTimeState(isFirstTime: true));

  void isFirstTime () => emit(IsFirstTimeState(isFirstTime: true));
  @override
  void onChange(Change<IsFirstTimeState> change) {
    super.onChange(change);
    print(change);
  }
}
