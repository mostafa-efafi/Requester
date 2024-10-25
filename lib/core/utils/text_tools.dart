import 'dart:convert';

class TextTools {
  /// If the address was without [http] or [https], it adds the word [https] to it
  static String makestandardUrl(String url) {
    if (url.startsWith('http://') || url.startsWith('https://')) {
      return url;
    } else {
      return 'https://$url';
    }
  }

  static String stringToBase64(String text) {
    return base64.encode(utf8.encode(text));
  }
}
