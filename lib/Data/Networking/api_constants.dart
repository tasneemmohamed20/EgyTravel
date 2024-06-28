class ApiStrings {
  static const baseUrl = 'https://egytravel.codepeak.live/api/v1/';

  static const baseUrlRecommended =
      'https://recomend.codepeak.live/recommend/';

  static const signup = 'auth/signup';

  static const signin = 'auth/signin';

  static const forgotPassword = 'users/forgot-password';

  static const resetPassword = 'users/reset-password';

  static const endPointUserData = 'users/get-profile';

  static const endPointEditProfile = 'users/edit-profile';

  static const endPointUpdatePassword = 'users/change-password';

  static const endPointDeleteAccount = 'users/delete-account';

  static const endPointGetAllEvent = 'event';

  static const endPointGetAllPlaces = 'place';

  static const endPointGetAllTrips = 'trips';

  static const endPointGetAllSearch = 'place/search?search';

  static const endPointGetAllRecomended = 'place/recomended';

  static const endPointReview = 'reviews';

  static const endPointArticles = 'articles';

  static const endPointGetFavorite = 'favorite';

  static const endPointUserTips = 'usertips';
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
