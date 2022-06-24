import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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
                  : Container()
            ],
          )
        ],
      ),
    );
  }

  changeFilter(String filter) {
    filterType = filter;
    setState(() {});
  }
}
