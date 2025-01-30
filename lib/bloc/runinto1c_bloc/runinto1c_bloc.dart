import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row1218.dart';
import 'package:mtwin_1c_app/entities/run1c/query_types_1c.dart';
import 'package:mtwin_1c_app/entities/ticket/ticket_data_to_make_files.dart';
import 'package:mtwin_1c_app/repositories/run1C_repository.dart';

part 'runinto1c_event.dart';
part 'runinto1c_state.dart';

class RunInto1cBloc extends Bloc<RunInto1cEvent, RunInto1cState> {
  final Run1cRepository run1cRepository;
  late List<QueryType1C> queriesToRun = [];
  late List<QueryType1C> taskList = [];

  RunInto1cBloc({required this.run1cRepository}) : super(RunInto1cInitial()) {
    on<RunInto1CInitialEvent>((event, emit) {
      queriesToRun = [];
      taskList = run1cRepository.initializeQueryList();
      emit(RunInto1CInitializedState(queryTypes: taskList));
    });

    on<Got1CRunQueryListEvent>((event, emit) {
      queriesToRun = event.queriesToRun;
      emit(RunInto1CGotQueriesState());
      //print(event.run1CParam);
    });

    on<RunInto1CDoReportsEvent>((event, emit) async {
      //var ticketDataToMakeFiles = event.ticketDataToMakeFiles;
      emit(RunInto1CMakeFilesRequestState());
      bool allRanGood = true;
      for (var c in event.ticketDataToMakeFiles) {
        if (c.id == 12) {
          var givenQuery =
              taskList.where((element) => element.id == c.id).first;
          var ticketData = c.ticketData;
          var result = await run1cRepository.do12(ticketData, givenQuery.name);
          allRanGood = result;
          if (!result) {
            emit(RunInto1CMakeFilesRanAndFailedState());
            break;
          }
        }
        if (c.id == 18) {
          var givenQuery =
              taskList.where((element) => element.id == c.id).first;
          var ticketData = c.ticketData;
          var result = await run1cRepository.do12(ticketData, givenQuery.name);
          allRanGood = result;
          if (!result) {
            emit(RunInto1CMakeFilesRanAndFailedState());
            break;
          }
        }

        if (c.id == 14) {
          var givenQuery =
              taskList.where((element) => element.id == c.id).first;
          var ticketData = c.ticketData;
          var result = await run1cRepository.do14(ticketData, givenQuery.name);
          allRanGood = result;
          if (!result) {
            emit(RunInto1CMakeFilesRanAndFailedState());
            break;
          }
        }
      }
      if (allRanGood) emit(RunInto1CMakeFilesRanWithSuccessState());
      // // // // var result = await run1cRepository.doOpening(ticketOpeningList);
      // // // // if (result) {
      // // // //   emit(RunInto1CMakeFilesRanWithSuccessState());
      // // // // } else {
      // // // //   emit(RunInto1CMakeFilesRanAndFailedState());
      // // // // }
    });
  }
}
