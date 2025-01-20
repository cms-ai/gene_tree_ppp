
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_clan_member_event.dart';
part 'create_clan_member_state.dart';
part 'create_clan_member_bloc.freezed.dart';

class CreateClanMemberBloc extends Bloc<CreateClanMemberEvent, CreateClanMemberState> {
  CreateClanMemberBloc() : super(CreateClanMemberState.initial()) {
    on<CreateClanMemberEvent>((event, emit) {
    });
  }
}
