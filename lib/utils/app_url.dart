class AppUrl {
  static const String liveBaseURL = "https://app.messerand.com/api/auth";
  // static const String localBaseURL = "http://10.0.2.2:4000/api/v1";

  static const String baseURL = liveBaseURL;
  static const String login = baseURL + "/login";
  static const String register = baseURL +"/register";
  static const String forgotPassword = baseURL + "/forgot-password";
}