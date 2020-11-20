import 'package:flutter/material.dart';
import "package:TodoApp/models/global.dart";
import "package:TodoApp/models/widgets/intray_todo_widget.dart";
import "package:TodoApp/models/classes/task.dart";


class IntrayPage extends StatefulWidget {
  @override
  _IntrayPageState createState() => _IntrayPageState();
}

List<Task> getList() {
  List<Task> taskList = [];
  for (int i = 0; i < 25; i++){
    taskList.add(Task("My First Todo"+i.toString(), false, i.toString()));
  }
  return taskList;
}

class _IntrayPageState extends State<IntrayPage> {
  List<Task> taskList = getList();

  @override
  Widget build(BuildContext context){
      return Container(
          color: darkGreyColor,
          child: _buildReorderableListSimple(context)
      );
  }


  Widget _buildListTile(BuildContext context, Task item) {
    return ListTile(
        key: ValueKey(item.taskId),
        title: IntrayTodo(
          title: item.title
        ),
    );
  }


  Widget _buildReorderableListSimple(BuildContext context) {
    print(taskList.length);
    print(taskList);
    return Theme(
        data: ThemeData(
          canvasColor: Colors.transparent,
        ),
        child: ReorderableListView(
          padding: EdgeInsets.only(top: 300.0),
          onReorder: (oldIndex, newIndex) => _onReorder(oldIndex, newIndex),
          children: [
            for (final i in taskList) _buildListTile(context, i)
        ],
      ),
    );
  }

  void _onReorder(oldIndex, newIndex) {
    setState(() {
      Task item = taskList[oldIndex];
      if (newIndex > oldIndex){
        taskList.remove(item);
        taskList.insert(newIndex - 1, item);
      }else{
        taskList.remove(item);
        taskList.insert(newIndex, item);
      }
    },
    );
  }


}



