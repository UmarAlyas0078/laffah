import 'package:laffah/screens/main_page.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor as Constructor<Object>;
}

class ClassBuilder {
  static void registerClasses() {
    register<MainPage>(() => MainPage());
  }

  static dynamic fromString(String type) {
    if (_constructors[type] != null) return _constructors[type]!();
  }
}
