class TextTools {
  /// If the address was without [http] or [https], it adds the word [https] to it
  static String makestandardUrl(String url) {
    if (url.startsWith('http://') || url.startsWith('https://')) {
      return url;
    } else {
      return 'https://$url';
    }
  }
}
