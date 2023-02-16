class ManageStatusCode {
  HttpStatusCodeModel findError({int sCode = 500}) {
    final error = _allContent.firstWhere(
        (element) => element.statusCode == sCode,
        orElse: () => HttpStatusCodeModel(
            statusCode: sCode, description: 'خطای ناشناخته'));
    return error;
  }
}

class HttpStatusCodeModel {
  late int statusCode;
  late String description;

  HttpStatusCodeModel({required this.statusCode, required this.description});
}

List<HttpStatusCodeModel> _allContent = [
  HttpStatusCodeModel(statusCode: 100, description: 'Continue'),
  HttpStatusCodeModel(statusCode: 101, description: 'Switching Protocols'),
  HttpStatusCodeModel(statusCode: 102, description: 'Processing'),
  HttpStatusCodeModel(statusCode: 200, description: 'OK'),
  HttpStatusCodeModel(statusCode: 201, description: 'Created'),
  HttpStatusCodeModel(statusCode: 202, description: 'Accepted'),
  HttpStatusCodeModel(
      statusCode: 203, description: 'Non-Authoritative Information'),
  HttpStatusCodeModel(statusCode: 204, description: 'No Content'),
  HttpStatusCodeModel(statusCode: 205, description: 'Reset Content'),
  HttpStatusCodeModel(statusCode: 206, description: 'Partial Content'),
  HttpStatusCodeModel(statusCode: 207, description: 'Multi-Status'),
  HttpStatusCodeModel(statusCode: 300, description: 'Multiple Choices'),
  HttpStatusCodeModel(statusCode: 301, description: 'Moved Permanently'),
  HttpStatusCodeModel(statusCode: 302, description: 'Found'),
  HttpStatusCodeModel(statusCode: 303, description: 'See Other'),
  HttpStatusCodeModel(statusCode: 304, description: 'Not Modified'),
  HttpStatusCodeModel(statusCode: 305, description: 'Use Proxy'),
  HttpStatusCodeModel(statusCode: 307, description: 'Temporary Redirect'),
  HttpStatusCodeModel(statusCode: 308, description: 'Permanent Redirect'),
  HttpStatusCodeModel(statusCode: 400, description: 'Bad Request'),
  HttpStatusCodeModel(statusCode: 401, description: 'Unauthorized'),
  HttpStatusCodeModel(statusCode: 402, description: 'Payment Required'),
  HttpStatusCodeModel(statusCode: 403, description: 'Forbidden'),
  HttpStatusCodeModel(statusCode: 404, description: 'Not Found'),
  HttpStatusCodeModel(statusCode: 405, description: 'Method Not Allowed'),
  HttpStatusCodeModel(statusCode: 406, description: 'Not Acceptable'),
  HttpStatusCodeModel(
      statusCode: 407, description: 'Proxy Authentication Required'),
  HttpStatusCodeModel(statusCode: 408, description: 'Request Time-out'),
  HttpStatusCodeModel(statusCode: 409, description: 'Conflict'),
  HttpStatusCodeModel(statusCode: 410, description: 'Gone'),
  HttpStatusCodeModel(statusCode: 411, description: 'Length Required'),
  HttpStatusCodeModel(statusCode: 412, description: 'Precondition Failed'),
  HttpStatusCodeModel(statusCode: 413, description: 'Request Entity Too Large'),
  HttpStatusCodeModel(statusCode: 414, description: 'Request-URI Too Large'),
  HttpStatusCodeModel(statusCode: 415, description: 'Unsupported Media Type'),
  HttpStatusCodeModel(
      statusCode: 416, description: 'Request Range Not Satisfiable'),
  HttpStatusCodeModel(statusCode: 417, description: 'Expectation Failed'),
  HttpStatusCodeModel(statusCode: 421, description: 'Misdirected Request'),
  HttpStatusCodeModel(statusCode: 422, description: 'Unprocessable Entity'),
  HttpStatusCodeModel(statusCode: 423, description: 'Locked'),
  HttpStatusCodeModel(statusCode: 424, description: 'Failed Dependency'),
  HttpStatusCodeModel(statusCode: 425, description: 'Unordered Collection'),
  HttpStatusCodeModel(statusCode: 426, description: 'Upgrade Required'),
  HttpStatusCodeModel(statusCode: 428, description: 'Precondition Required'),
  HttpStatusCodeModel(statusCode: 429, description: 'Too Many Requests'),
  HttpStatusCodeModel(
      statusCode: 431, description: 'Request Header Fields Too Large'),
  HttpStatusCodeModel(
      statusCode: 451, description: 'Unavailable For Legal Reasons'),
  HttpStatusCodeModel(statusCode: 500, description: 'Internal Server Error'),
  HttpStatusCodeModel(statusCode: 501, description: 'Not Implemented'),
  HttpStatusCodeModel(statusCode: 502, description: 'Bad Gateway'),
  HttpStatusCodeModel(statusCode: 503, description: 'Service Unavailable'),
  HttpStatusCodeModel(statusCode: 504, description: 'Gateway Time-out'),
  HttpStatusCodeModel(
      statusCode: 505, description: 'HTTP Version Not Supported'),
  HttpStatusCodeModel(statusCode: 506, description: 'Variant Also Negotiates'),
  HttpStatusCodeModel(statusCode: 507, description: 'Insufficient Storage'),
  HttpStatusCodeModel(statusCode: 508, description: 'Loop Detected'),
  HttpStatusCodeModel(statusCode: 510, description: 'Not Extended'),
  HttpStatusCodeModel(
      statusCode: 511, description: 'Network Authentication Required'),
];
