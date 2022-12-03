import 'qustions.dart';

class Appbrain {
  int _qustionNumber;
  List<Questions> _questionsList = [
    Questions(
      t: 'عدد الوان قوس المطر 7 الوان',
      i: 'images/colors.jpg',
      a: true,
    ),
    Questions(
      t: 'عدد الاحرف الانجليزية 24 حرف',
      i: 'images/english.jpg',
      a: false,
    ),
    Questions(
      t: 'عدد سور القران 104',
      i: 'images/quran.jpg',
      a: false,
    ),
    Questions(
      t: '7 X 9 = 64',
      i: 'images/math.jpg',
      a: false,
    ),
    Questions(
      t: 'توفي الرسول وعمره 64',
      i: 'images/relagen.jfif',
      a: false,
    ),
    Questions(
      t: 'عدد الاعبين داخل الملعب 12 لكل فريق',
      i: 'images/stidum.jfif',
      a: false,
    ),
    Questions(
      t: 'يسمى كوكب المريخ بالكوكب الاخضر',
      i: 'images/merkh.jfif',
      a: false,
    ),
    Questions(
      t: 'الخبز هو غذاء ثلث سكان الارض',
      i: 'images/bread.jpg',
      a: false,
    ),
    Questions(
      t: 'تعني قمر moon كلمة ',
      i: 'images/moon.jfif',
      a: true,
    ),
    Questions(
      t: 'تتحول اليرقه الى حلزون',
      i: 'images/حلزون.jfif',
      a: false,
    ),
  ];

  void getnextquestion() {
    if (_qustionNumber < _questionsList.length - 1) _qustionNumber++;
  }

  String gettextquestion() {
    return _questionsList[_qustionNumber].text_question;
  }

  String getimage() {
    return _questionsList[_qustionNumber].image;
  }

  bool getanswer() {
    return _questionsList[_qustionNumber].answare;
  }

  bool isfinished() {
    if (_qustionNumber >= _questionsList.length - 1)
      return true;
    else
      return false;
  }

  void reset() {
    _qustionNumber = 0;
  }
}
