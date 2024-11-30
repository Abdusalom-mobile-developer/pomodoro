import 'package:flutter/material.dart';
import 'package:pomodoro/customs/custom_completed_task_maker.dart';
import 'package:pomodoro/customs/custom_size.dart';
import 'package:pomodoro/providers/home_screen_all.dart';
import 'package:pomodoro/providers/to_do_tasks.dart';
import 'package:pomodoro/utils/colors.dart';
import 'package:provider/provider.dart';

class MyBottomSheet {
  static void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: UtilsColors.bg,
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.4,
        maxChildSize: 1,
        minChildSize: 0.2,
        builder: (context, scrollController) => Consumer<ToDoTasks>(
          builder: (context, provider, child) => Padding(
            padding:
                EdgeInsets.symmetric(vertical: CustomSize.height(context, 20)),
            child: ListView.builder(
              controller: scrollController,
              itemCount: provider.tasks.length,
              itemBuilder: (context, index) => GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Provider.of<HomeScreenAll>(context, listen: false)
                      .changeCurrentTask(provider.tasks[index].task, index);
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: CustomSize.width(context, 13),
                  ),
                  child: CustomCompletedTaskMaker(
                    provider.tasks[index].task,
                    index == provider.tasks.length - 1,
                    provider.tasks[index].time,
                    false,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
