class Constants {
  static final String TOP_HEADLINES_URL =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=100052baaaa54bafaa232309ec9f5996";
  static String headlinesFor(String keyword) {
    return "http://newsapi.org/v2/everything?q=$keyword&from=2020-11-06&sortBy=publishedAt&apiKey=100052baaaa54bafaa232309ec9f5996";
  }
}
