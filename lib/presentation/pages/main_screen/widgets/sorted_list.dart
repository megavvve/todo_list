
import 'package:todo_list_hw2/data/database.dart';

List<Todo> sortedList(
    String sortType, List<Todo> todoList, bool isHideCompleted) {
  List<Todo> todoListNew = isHideCompleted
      ? todoList
      : todoList.where((x) => x.isDone == false).toList();
  if (sortType == "sortAlphabetically") {
    return List<Todo>.from(todoListNew)
      ..sort(
        (a, b) => a.name.compareTo(
          b.name,
        ),
      );
  } else if (sortType == "sortAlphabeticallyInReverseOrder") {
    return (List<Todo>.from(todoListNew)
          ..sort((a, b) => a.name.compareTo(b.name)))
        .reversed
        .toList();
  } else if (sortType == "sortingByCreationDate") {
    return (List<Todo>.from(todoListNew)
          ..sort(
            (a, b) {
              final dateComparison = a.date.compareTo(b.date);
              if (dateComparison != 0) {
                return dateComparison;
              }
              return a.time.compareTo(b.time);
            },
          ))
        .reversed
        .toList();
  } 
    return todoListNew;
  
}
