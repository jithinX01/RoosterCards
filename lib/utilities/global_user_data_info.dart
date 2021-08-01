import 'package:flutter/widgets.dart';
import 'package:rooster_cards/proto/user_data.pbserver.dart';

class UserDataInfo extends InheritedWidget {
  const UserDataInfo({
    Key? key,
    required this.userInfo,
    required Widget child,
  }) : super(key: key, child: child);

  final UserData userInfo;

  static UserDataInfo of(BuildContext context) {
    final UserDataInfo? result =
        context.dependOnInheritedWidgetOfExactType<UserDataInfo>();
    assert(result != null, 'No  UserInfo found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(UserDataInfo old) => userInfo != old.userInfo;
}
