class AddTaskModel {
  final String taskID;
  final String taskTitle;
  final String task1;
  final String task2;
  final String task3;
  final String task4;
  final String task5;
  final String desc;
  final String startDate;
  final String endDate;
  final String calnderDate;
  final double taskProg;
  final bool bTask1;
  final bool bTask2;
  final bool bTask3;
  final bool bTask4;
  final bool bTask5;

  AddTaskModel(
      {required this.calnderDate,
      required this.desc,
      required this.endDate,
      required this.startDate,
      required this.task1,
      required this.task2,
      required this.task3,
      required this.task4,
      required this.task5,
      required this.taskID,
      required this.taskTitle,
      required this.taskProg,
      required this.bTask1,
      required this.bTask2,
      required this.bTask3,
      required this.bTask4,
      required this.bTask5});

  Map<String, dynamic> toMap() {
    return {
      'calnderDate': calnderDate,
      'desc': desc,
      'endDate': endDate,
      'startDate': startDate,
      'task1': task1,
      'task2': task2,
      'task3': task3,
      'task4': task4,
      'task5': task5,
      'taskID': taskID,
      'taskTitle': taskTitle,
      'taskProg': taskProg,
      'bTask1': bTask1,
      'bTask2': bTask2,
      'bTask3': bTask3,
      'bTask4': bTask4,
      'bTask5': bTask5,
    };
  }

  factory AddTaskModel.fromMap(Map<String, dynamic> json) {
    return AddTaskModel(
      calnderDate: json['calnderDate'],
      desc: json['desc'],
      endDate: json['endDate'],
      startDate: json['startDate'],
      task1: json['task1'],
      task2: json['task2'],
      task3: json['task3'],
      task4: json['task4'],
      task5: json['task5'],
      taskID: json['taskID'],
      taskTitle: json['taskTitle'],
      taskProg: json['taskProg'],
      bTask1: json['bTask1'],
      bTask2: json['bTask2'],
      bTask3: json['bTask3'],
      bTask4: json['bTask4'],
      bTask5: json['bTask5'],
    );
  }
}
