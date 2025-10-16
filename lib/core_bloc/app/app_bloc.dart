import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobdi/core/utils/storage_util.dart'
    show StorageKey, StorageUtil;
import 'package:jobdi/domain/entities/role_entity.dart' show RoleEntity;

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const _Initial()) {
    on<_Started>(_onStarted);
  }

  RoleEntity? _role;

  RoleEntity? get role => _role;

  Future<void> _onStarted(_Started event, Emitter<AppState> emit) async {
    final roleStr = StorageUtil.getString(StorageKey.ROLE_CODE);
    if (roleStr != null && roleStr.isNotEmpty) {
      try {
        _role = RoleEntity.values.firstWhere((r) => r.name == roleStr);
      } on Exception catch (_) {
        _role = null;
      }
    }
    emit(const AppState.initial());
  }

  Future<void> setRole(RoleEntity role) async {
    _role = role;
    await StorageUtil.putString(StorageKey.ROLE_CODE, role.name);
  }
}
