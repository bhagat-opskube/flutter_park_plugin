
part of 'apis.dart';
class ApiConstant {

   ApiConstant();

   static final String apiBaseUrl =  Config.API_BASE_URL!;
   // static final String apiAccountUrl =  Config.API_ACCOUNT_URL;
   static final String login  =apiBaseUrl + "auth/login/";
   static final String getProgram  =apiBaseUrl + "program/get-program/";
   static final String getSubscribeProgram = apiBaseUrl + "program/my-program/";
   static final String getExpert = apiBaseUrl + "user/get-experts/";
   static final String createUser = apiBaseUrl + "user/create-user";
   static final String getUserInterest = apiBaseUrl + "user/get-user-intersts/";
   static final String getProgramDetails = apiBaseUrl + "program/program-details/%d";
   static final String getMokeAPI = apiBaseUrl + "user/dummy";
   static final String createProgramUser = apiBaseUrl + "program/create-program-user/";
   static final String editAccount = apiBaseUrl + "user/update-user";
   static final String addFavoriteExpert = apiBaseUrl + "user/add-favorite-expert";
   static final String removeFavoriteExpert = apiBaseUrl + "user/remove-favorite-expert";


}
