import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:FlutterLocalizations/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,

        /// 下面两个不配置，iOS端会报错
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter 国际化 intl_utils'),
      localeResolutionCallback:
          (Locale _locale, Iterable<Locale> supportedLocales) {
        print(_locale.languageCode + "===" + _locale.countryCode);
        print(supportedLocales);
        Locale locale;
        if (S.delegate.isSupported(_locale)) {
          locale = _locale;
          print("1111111");
        } else {
          print("22222");
          locale = Locale("zh", 'CH');
        }
        return locale;
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    /// 语言的切换
    print("当前语言环境：" + Intl.getCurrentLocale());
    if (Intl.getCurrentLocale().contains("en")) {
      // 目前不区分各种英文
      S.load(Locale("zh"));
    } else {
      S.load(Locale("en"));
    }
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /// 多语言不带参数使用
            Text(
              S.of(context).home,
            ),

            /// 多语言带参数字符的使用
            Text(
              S.of(context).num_index(3),
            ),
            Text(
              S.of(context).word("Jack", S.of(context).man),
            ),
            Text(
              S.of(context).word("Rose", S.of(context).woman),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
