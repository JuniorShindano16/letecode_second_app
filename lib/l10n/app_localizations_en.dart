// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Hello World!';

  @override
  String get archived => 'Archived';

  @override
  String get recentUpdates => 'Recent Updates';

  @override
  String get newCommunity => 'New community';

  @override
  String get filterAll => 'All';

  @override
  String get filterUnread => 'Unread';

  @override
  String get filterFavourites => 'Favourites';

  @override
  String get filterGroups => 'Groups';

  @override
  String get chats => 'Chats';

  @override
  String get updates => 'Updates';

  @override
  String get communities => 'Communities';

  @override
  String get calls => 'Calls';

  @override
  String get myStatus => 'My Status';

  @override
  String get justNow => 'Just now';

  @override
  String get minutesAgo => 'minutes ago';

  @override
  String get announcement => 'Announcement';

  @override
  String get viewAll => 'View all';

  @override
  String get addFavourite => 'Add favourite';

  @override
  String get recent => 'Recent';

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get month => 'Month';

  @override
  String notificationCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count notifications',
      one: '1 notification',
      zero: 'No notifications',
    );
    return '$_temp0';
  }

  @override
  String minutesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes',
      one: '1 minute',
      zero: 'No minutes',
    );
    return '$_temp0';
  }
}
