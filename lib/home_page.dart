import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/new_checklist.dart';
import 'package:todo_app/new_note.dart';
import 'package:todo_app/new_task.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'avenir'),
        home: homePage());
  }
}

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  String filterType = 'today';
  String taskPop = 'close';
  DateTime today = DateTime.now();
  var monthNames = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEPT',
    'OCT',
    'NOV',
    'DEC'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: const Color(0xfff96060),
                elevation: 0,
                title: const Text(
                  'Work List',
                  style: TextStyle(fontSize: 30),
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.short_text,
                        color: Colors.white,
                        size: 30,
                      ))
                ],
              ),
              Container(
                height: 70,
                color: const Color(0xfff96060),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                      InkWell(
                        onTap: () {
                          changeFilter('today');
                        },
                        child: const Text(
                          'Today',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 4,
                        width: 120,
                        color: (filterType == 'today')
                            ? Colors.white
                            : Colors.transparent,
                      )
                    ]),
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                      InkWell(
                        onTap: () {
                          changeFilter('monthly');
                        },
                        child: const Text(
                          'Monthly',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 4,
                        width: 120,
                        color: (filterType == 'monthly')
                            ? Colors.white
                            : Colors.transparent,
                      )
                    ])
                  ],
                ),
              ),
              (filterType == 'monthly')
                  ? TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 10, 16),
                      focusedDay: DateTime.now(),
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      calendarFormat: CalendarFormat.week,
                    )
                  : Container(),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Today ${monthNames[today.month - 1]}, ${today.day}/${today.year}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        )),
                    taskWidget(const Color(0xfff96060), 'Meeting with someone',
                        '9:00 AM'),
                    taskWidget(Colors.blue, 'Meeting with someone', '9:00 AM'),
                    taskWidget(Colors.green, 'Take your medicine', '9:00 AM'),
                  ],
                )),
              ),
              Container(
                  height: 110,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Container(
                            height: 90,
                            width: MediaQuery.of(context).size.width,
                            color: const Color(0xff292e4e),
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: Column(
                                    children: const [
                                      Icon(
                                        Icons.check_circle,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'My Task',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: const [
                                      Icon(
                                        Icons.menu,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Menu',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      )
                                    ],
                                  ),
                                ),
                                Container(width: 80),
                                Container(
                                  child: Column(
                                    children: const [
                                      Icon(
                                        Icons.content_paste,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Quick',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: const [
                                      Icon(
                                        Icons.account_circle,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Profile',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Positioned(
                          bottom: 25,
                          left: 0,
                          right: 0,
                          child: InkWell(
                            onTap: openTaskPop,
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [Color(0xfff96060), Colors.red]),
                                  shape: BoxShape.circle),
                              child: const Center(
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      fontSize: 40, color: Colors.white),
                                ),
                              ),
                            ),
                          ))
                    ],
                  ))
            ],
          ),
          Container(
              child: (taskPop == 'open')
                  ? Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black.withOpacity(0.3),
                      child: Center(
                        child: InkWell(
                            onTap: closeTaskPop,
                            child: Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white),
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const SizedBox(
                                      height: 1,
                                    ),
                                    InkWell(
                                      onTap: openNewTask,
                                      child: Container(
                                        child: const Text(
                                          'Add Task',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 1,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      color: Colors.black.withOpacity(0.2),
                                    ),
                                    const SizedBox(
                                      height: 1,
                                    ),
                                    InkWell(
                                      onTap: openNewNote,
                                      child: Container(
                                        child: const Text(
                                          'Add Quick Note',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 1,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      color: Colors.black.withOpacity(0.2),
                                    ),
                                    const SizedBox(
                                      height: 1,
                                    ),
                                    InkWell(
                                      onTap: openNewChecklist,
                                      child: Container(
                                        child: const Text(
                                          'Add Checklist',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 1,
                                    )
                                  ],
                                ))),
                      ),
                    )
                  : Container())
        ],
      ),
    );
  }

  openNewTask() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const NewTask()));
  }

  openNewNote() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const NewNote()));
  }

  openNewChecklist() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const NewChecklist()));
  }

  openTaskPop() {
    taskPop = 'open';
    setState(() {});
  }

  closeTaskPop() {
    taskPop = 'close';
    setState(() {});
  }

  changeFilter(String filter) {
    filterType = filter;
    setState(() {});
  }

  Slidable taskWidget(Color color, String title, String time) {
    return Slidable(
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              flex: 2,
              onPressed: doNothing,
              backgroundColor: color,
              foregroundColor: Colors.black,
              icon: Icons.edit,
              label: 'Edit',
            ),
            SlidableAction(
              onPressed: doNothing,
              backgroundColor: color,
              foregroundColor: Colors.black,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          height: 80,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.03),
                offset: const Offset(0, 9),
                blurRadius: 20,
                spreadRadius: 1)
          ]),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: color, width: 4)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  )
                ],
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                height: 50,
                width: 5,
                color: color,
              )
            ],
          ),
        ));
  }

  void doNothing(BuildContext context) {}
}
