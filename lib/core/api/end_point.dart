class EndPoint {
  static String baseUrl = "https://newsapi.org/v2/";

  static String newsTopHeadlines(String category) {
    return "top-headlines?category=$category";
  }

  static String newsEverything(String searchAnything) {
    return "everything?q=$searchAnything";
  }
}

class ApiKeys {
  static String status = "status";
  static String code = "code";
  static String message = "message";
  static String xApiKey = 'X-Api-Key';
  static String apiKey = '105471a21a7a4ee0b96037a979117311';
}
