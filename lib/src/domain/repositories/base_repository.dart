import 'package:translator/translator.dart';

mixin BaseRepository {
  Future<String> getErrorMessage(String message) async {
    final GoogleTranslator translator = GoogleTranslator();
    String errorMessage = '';
    switch (message) {
      case "Connection timeout":
        errorMessage = 'Время соединения вышло';
        break;
      case "Something wrong":
        errorMessage =
            'Что-то не так. Проверьте свое интернет-соединение, несмотря ни на что.';
        break;
      default:
        try {
          await translator
              .translate(
                message,
                from: 'en',
                to: "ru",
              )
              .then((value) => errorMessage = value.text);
        } catch (e) {
          errorMessage = message;
        }
    }
    return errorMessage;
  }

  @override
  List<Object?> get props => [];
}
