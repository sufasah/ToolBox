import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ToolboxLocalizations {
  final Locale locale;

  ToolboxLocalizations(this.locale);

  static ToolboxLocalizations of(BuildContext context) {
    return Localizations.of<ToolboxLocalizations>(
        context, ToolboxLocalizations);
  }

  static List<String> _supportedLocales = ['en', 'tr'];
  static get supportedLocales => supportedLocales;

  static Map<String, Map<String, String>> _values = {
    "en": {
      "menu-title": "Toolbox Menu",
      "menu-todo": "Todo List",
      "on-wrong-route-warning":
          "Given route 'kkreplacekk' is not an appropriate route url.",
      "todo-list-title": "Todo List",
      "create-todo-default-title": "Put Some Title Here",
      "create-todo-default-details": "Write What To Do Later Here...",
      "todo-item-page-title": "Let's Plan What To Do",
      "todo-item-page-title-label": "Title:",
      "todo-item-page-details-label": "Details:",
      "todo-item-page-save-button": "Save",
      "todo-item-page-delete-button": "Delete",
      "todo-item-page-cancel-button": "Cancel",
      "alert-dialog-delete-title": "DELETE",
      "alert-dialog-delete-message": "Are you sure to delete this Todo ?",
      "alert-dialog-yes": "Yes",
      "alert-dialog-no": "No",
      "menu-calculator": "Calculator",
      "calculator-title": "Calculator",
      "calculator-clear": "Clear",
      "calculator-calculate": "Calculate",
    },
    "tr": {
      "menu-title": "Araçlar Menüsü",
      "menu-todo": "Yapılacaklar Listesi",
      "on-wrong-route-warning":
          "Yönlendirilen rota 'kkreplacekk' uygun bir url bilgisine sahip değil.",
      "todo-list-title": "Yapılacaklar Listesi",
      "create-todo-default-title": "Buraya Bir Başlık Yaz",
      "create-todo-default-details": "Daha Sonra Neler Yapacağından Bahset...",
      "todo-item-page-title": "Yapacaklarını Planlamaya Başla",
      "todo-item-page-title-label": "Başlık:",
      "todo-item-page-details-label": "Detaylar:",
      "todo-item-page-save-button": "Kaydet",
      "todo-item-page-delete-button": "Sil",
      "todo-item-page-cancel-button": "İptal Et",
      "alert-dialog-delete-title": "SİL",
      "alert-dialog-delete-message":
          "Bu Yapılacaklar Kaydını Silmek İstediğinize Emin Misiniz?",
      "alert-dialog-yes": "Evet",
      "alert-dialog-no": "Hayır",
      "menu-calculator": "Hesap Makinesi",
      "calculator-title": "Hesap Makinesi",
      "calculator-clear": "Temizle",
      "calculator-calculate": "Hesapla",
    },
  };

  String get menuTitle {
    return _values[locale.languageCode]['menu-title'];
  }

  String get menuTodo {
    return _values[locale.languageCode]['menu-todo'];
  }

  String onWrongRouteWarning(String url) {
    return _values[locale.languageCode]['on-wrong-route-warning']
        .replaceFirst(RegExp('kkreplacekk'), url);
  }

  String get todoListTitle {
    return _values[locale.languageCode]['todo-list-title'];
  }

  String get createTodoDefaultTitle {
    return _values[locale.languageCode]['create-todo-default-title'];
  }

  String get createTodoDefaultDetails {
    return _values[locale.languageCode]['create-todo-default-details'];
  }

  String get todoItemPageTitle {
    return _values[locale.languageCode]['todo-item-page-title'];
  }

  String get todoItemPageTitleLabel {
    return _values[locale.languageCode]['todo-item-page-title-label'];
  }

  String get todoItemPageDetailsLabel {
    return _values[locale.languageCode]['todo-item-page-details-label'];
  }

  String get todoItemPageSaveButton {
    return _values[locale.languageCode]['todo-item-page-save-button'];
  }

  String get todoItemPageDeleteButton {
    return _values[locale.languageCode]['todo-item-page-delete-button'];
  }

  String get todoItemPageCancelButton {
    return _values[locale.languageCode]['todo-item-page-cancel-button'];
  }

  String get alertDialogDeleteMessage {
    return _values[locale.languageCode]['alert-dialog-delete-message'];
  }

  String get alertDialogYes {
    return _values[locale.languageCode]['alert-dialog-yes'];
  }

  String get alertDialogNo {
    return _values[locale.languageCode]['alert-dialog-no'];
  }

  String get alertDialogDeleteTitle {
    return _values[locale.languageCode]['alert-dialog-delete-title'];
  }

  String get menuCalculator {
    return _values[locale.languageCode]['menu-calculator'];
  }

  String get calculatorTitle {
    return _values[locale.languageCode]['calculator-title'];
  }

  String get calculatorClear {
    return _values[locale.languageCode]['calculator-clear'];
  }

  String get calculatorCalculate {
    return _values[locale.languageCode]['calculator-calculate'];
  }
}

class ToolboxLocalizationsDelegate
    extends LocalizationsDelegate<ToolboxLocalizations> {
  const ToolboxLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ToolboxLocalizations._supportedLocales.contains(locale.languageCode);

  @override
  Future<ToolboxLocalizations> load(Locale locale) {
    return SynchronousFuture<ToolboxLocalizations>(
        ToolboxLocalizations(locale));
  }

  @override
  bool shouldReload(
          covariant LocalizationsDelegate<ToolboxLocalizations> old) =>
      false;
}
