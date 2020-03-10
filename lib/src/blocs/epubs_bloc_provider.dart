import 'package:flutter/cupertino.dart';
import 'package:flutter_ebook_reader/src/blocs/epubs_bloc.dart';

class EpubsBlocProvider extends InheritedWidget {
  final bloc = EpubsBloc();

  EpubsBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static EpubsBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<EpubsBlocProvider>().bloc;
  }
}
