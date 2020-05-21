import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/home_page.dart';

enum NavBlocEvents { HomePageClick, AccountPageClick, OrdersPageClick }

abstract class NavBlocStates {}

class NavBloc extends Bloc<NavBlocEvents, NavBlocStates> {
  @override
  get initialState => HomePage();

  @override
  Stream<NavBlocStates> mapEventToState(NavBlocEvents event) async* {
    switch (event) {
      case NavBlocEvents.HomePageClick:
        yield HomePage();
        break;
      case NavBlocEvents.AccountPageClick:
        yield HomePage();
        break;
      case NavBlocEvents.OrdersPageClick:
        yield HomePage();
        break;
    }
  }
}
