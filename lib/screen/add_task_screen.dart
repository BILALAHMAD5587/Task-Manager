import 'dart:math';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mangemant/screen/home_screen.dart';
import 'package:tuple/tuple.dart';
import '../controller/add_task_controller.dart';

final today = DateUtils.dateOnly(DateTime.now());

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final AddTaskController addTaskController = Get.put(AddTaskController());

  TextEditingController title = TextEditingController();
  TextEditingController task1 = TextEditingController();
  TextEditingController task2 = TextEditingController();
  TextEditingController task3 = TextEditingController();
  TextEditingController task4 = TextEditingController();
  TextEditingController task5 = TextEditingController();
  TextEditingController desc = TextEditingController();

  List<DateTime?> _rangeDatePickerValueWithDefaultValue = [
    DateTime(1999, 5, 6),
    DateTime(1999, 5, 21),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDefaultRangeDatePickerWithValue(),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Task Title",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      controller: title,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.10))),
                          hintText: "Enter Title",
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.10),
                              fontSize: 14)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Task One",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      controller: task1,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.10))),
                          hintText: "Enter Task One",
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.10),
                              fontSize: 14)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Task Two",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      controller: task2,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.10))),
                          hintText: "Enter Task Two",
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.10),
                              fontSize: 14)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Task Three",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      controller: task3,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.10))),
                          hintText: "Enter Task Three",
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.10),
                              fontSize: 14)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Task Four",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      controller: task4,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.10))),
                          hintText: "Enter Task Four",
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.10),
                              fontSize: 14)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Task Five",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      controller: task5,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.10))),
                          hintText: "Enter Task Five",
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.10),
                              fontSize: 14)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Description",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    controller: desc,
                    maxLines: 4,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.10))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.10))),
                        hintText: "Description",
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.10),
                            fontSize: 14)),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue)),
                      child: const Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        CalendarDatePicker2Type datePickerTypee =
                            CalendarDatePicker2Type.range;
                        List<DateTime?> valuese = [
                          DateTime(2024, 1, 25),
                          DateTime(2024, 1, 30),
                        ];

                        String result1 =
                            _getValueText(datePickerTypee, valuese);
                        print(result1);

                        var Title = title.text.trim();
                        var Task1 = task1.text.trim();
                        var Task2 = task2.text.trim();
                        var Task3 = task3.text.trim();
                        var Task4 = task4.text.trim();
                        var Task5 = task5.text.trim();
                        var Desc = desc.text.trim();

                        CalendarDatePicker2Type datePickerType =
                            CalendarDatePicker2Type.range;

                        List<DateTime?> values = [
                          DateTime.now(),
                          DateTime.now().add(const Duration(days: 7))
                        ];

                        final result =
                            _getStartAndEndDate(datePickerType, values);
                        final startDate = result.item1;
                        final endDate = result.item2;

                        if (Title.isEmpty ||
                            Task1.isEmpty ||
                            Task2.isEmpty ||
                            Task3.isEmpty ||
                            Task4.isEmpty ||
                            Task5.isEmpty ||
                            Desc.isEmpty) {
                          Get.snackbar("Error", "Please Enter All Tasks",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.blue,
                              colorText: Colors.white);
                        } else {
                          String generateRandomCode() {
                            Random random = Random();

                            String randomDigits = '';
                            for (int i = 0; i < 15; i++) {
                              randomDigits += random.nextInt(10).toString();
                            }

                            String randomCode = "Task$randomDigits";

                            return randomCode;
                          }

                          addTaskController
                              .addTask(
                                  0.00,
                                  Title,
                                  Task1,
                                  Task2,
                                  Task3,
                                  Task4,
                                  Task5,
                                  Desc,
                                  startDate!,
                                  endDate!,
                                  result1,
                                  generateRandomCode())
                              .then((value) {
                            Get.snackbar("Success", "Task Added",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.blue,
                                colorText: Colors.white);
                            Get.to(() => const HomeScreen());
                          });
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 130,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blue)),
                        child: const Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Tuple2<String?, String?> _getStartAndEndDate(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();

    if (datePickerType == CalendarDatePicker2Type.multi) {
      // For multi type, return the first and last non-null dates
      final startDate = values.isNotEmpty ? values.first : null;
      final endDate = values.isNotEmpty ? values.last : null;
      return Tuple2(startDate?.toString(), endDate?.toString());
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      // For range type, return the start and end dates
      final startDate = values.isNotEmpty ? values[0] : null;
      final endDate = values.length > 1 ? values[1] : null;
      return Tuple2(startDate?.toString(), endDate?.toString());
    }

    // Handle other types or empty list
    return const Tuple2(null, null);
  }

  String _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
              .map((v) => v.toString().replaceAll('00:00:00.000', ''))
              .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }

  Widget _buildDefaultRangeDatePickerWithValue() {
    final config = CalendarDatePicker2Config(
      calendarType: CalendarDatePicker2Type.range,
      selectedDayHighlightColor: Colors.blue,
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CalendarDatePicker2(
          config: config,
          value: _rangeDatePickerValueWithDefaultValue,
          onValueChanged: (dates) =>
              setState(() => _rangeDatePickerValueWithDefaultValue = dates),
        ),
        const SizedBox(height: 10),
        Container(
          height: 60,
          width: double.infinity,
          color: Colors.blue.shade50,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Task starting at',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                const SizedBox(width: 5),
                Text(
                  _getValueText(
                    config.calendarType,
                    _rangeDatePickerValueWithDefaultValue,
                  ),
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
