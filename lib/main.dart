import 'package:flutter/material.dart';
import 'brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Appbrain appbrain = Appbrain();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            centerTitle: true,
            title: Text(
              'صح او خطاء',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ExamPage(),
          ),
        ));
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({Key? key}) : super(key: key);

  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Widget> resualt = [];
  int rightanswers = 0;

  void check(bool useranswer) {
    bool ansower = appbrain.getanswer();
    setState(() {
      if (useranswer == ansower) {
        resualt.add(
          Icon(
            Icons.check,
            color: Colors.green,
            size: 30,
          ),
        );
        rightanswers++;
      } else {
        resualt.add(
          Icon(
            Icons.close,
            color: Colors.red,
            size: 30,
          ),
        );
      }
      if (appbrain.isfinished() == true) {
        Alert(
          context: context,
          title: "انتهاء الاختبار",
          desc: "لقد اجبت على $rightanswers سؤال من 10",
          buttons: [
            DialogButton(
              child: Text(
                "ابدأ من جديد",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();

        appbrain.reset();
        resualt = [];
        rightanswers = 0;
      } else
        appbrain.getnextquestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: resualt,
        ),
        Expanded(
          flex: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(appbrain.getimage()),
              SizedBox(
                height: 30.0,
              ),
              Text(
                appbrain.gettextquestion(),
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton(
              onPressed: () {
                check(true);
              },
              child: Text(
                'صح',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: () {
                check(false);
              },
              child: Text(
                'خطاء',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
