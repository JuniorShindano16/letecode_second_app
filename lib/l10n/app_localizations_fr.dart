// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get title => 'Bonjour le monde !';

  @override
  String get archived => 'Archivées';

  @override
  String get recentUpdates => 'Ajoutés récemment';

  @override
  String get newCommunity => 'Nouvelle communauté';

  @override
  String get filterAll => 'Tous';

  @override
  String get filterUnread => 'Non lus';

  @override
  String get filterFavourites => 'Favoris';

  @override
  String get filterGroups => 'Groupes';

  @override
  String get chats => 'Discussions';

  @override
  String get updates => 'Mises à jour';

  @override
  String get communities => 'Communautés';

  @override
  String get calls => 'Appels';

  @override
  String get myStatus => 'Mon statut';

  @override
  String get justNow => 'À l’instant';

  @override
  String get minutesAgo => 'il y a quelques minutes';

  @override
  String get announcement => 'Annonce';

  @override
  String get viewAll => 'Tout voir';

  @override
  String get addFavourite => 'Ajouter aux favoris';

  @override
  String get recent => 'Récent';

  @override
  String get today => 'Aujourd’hui';

  @override
  String get yesterday => 'Hier';

  @override
  String get month => 'Mois';

  @override
  String notificationCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count notifications',
      one: '1 notification',
      zero: 'Aucune notification',
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
