# Flutter 语言国际化 intl_utils简单使用
## flutter pub run intl_utils:generate 初始化生成目录以及arb文件后需要调用
## 初始化
### pubspec.yaml 文件添加intl_utils依赖后 运行 flutter pub run intl_utils:generate 
### 会自动生成 两个文件夹
#### -generated 
####  --intl
####   ---message_all.dart 获取某个字符的时候的入口，通过这个文件前往不同语言的messages_(lang)文件并返回内容
####   ---message_(lang).dart文件，根据对应的intl_(lang).dart文件生成的dart文件，arb文件中字典的处理结果
#### --I10n.dart文件：每次运行后自动生成支持的语言以及支持国际化的内容
#### -I10n 文件夹，默认生成 en 文件

## 使用
#### 1、初始化arb文件：在每个arb文件中首先添加 @@locale(例："@@locale": "ch"),以免生成文件时候提醒： No @@locale or _locale field found in intl_ch, assuming 'ch' based on the file name.
#### 2、更新arb文件内容：在arb文件中分别添加需要国际化处理的内容，以字典的形式添加，最后一个不需要加逗号；
#### 3、生成新的dart文件：添加完后再运行 flutter pub run intl_utils:generate; 在generated-I10n.dart文件中的 S 类中能自动生成该国际化对应的get方法；
## 4、国际化的使用：
#### MaterialApp添加两个属性 
#### -localizationsDelegates: [S.delegate],
#### -supportedLocales: S.delegate.supportedLocales,
#### 调用使用的地方使用S.of(context).home


