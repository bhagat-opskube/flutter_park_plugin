
part of "apis.dart";

/// Dio Http Api client to handle api request
class DioHttpApiClient implements HttpApiClient{

  Dio? dio;

  DioHttpApiClient({int timeOut=HttpApiClient.DEFAULT_TIMEOUT}){
    dio=getDioInstance(timeOut: timeOut);
  }
  /// Get dio instance
  Dio getDioInstance({int timeOut=HttpApiClient.DEFAULT_TIMEOUT})
  {
    BaseOptions options = new BaseOptions(
      baseUrl: ApiConstant.apiBaseUrl,
      connectTimeout: timeOut,
      receiveTimeout: timeOut,
    );
    var dio = Dio(options);
    dio.interceptors.add(LogInterceptor(responseBody: false));/// To log response
    // dio.interceptors.add(InterceptorsWrapper(
    //     onRequest:(RequestOptions options)  {
    //       return options; //continue
    //     },
    //     onResponse:(Response response)  {
    //       /// Close dio instance
    //       // dio.close();
    //       return response; // continue
    //     },
    //     onError: (DioError e)  {
    //       // dio.close();
    //       return  e;//continue
    //     }
    // ));
    return dio;
  }

  ///Function to handle dio error
  handleError(DioError e,{List? acceptedErrorResponse})
  {
    print("Dio error ${e.type} , ${e.response} , ${e.response?.statusCode} , ${e.message} , ${e.error} , ");
    ApiException apiException=ApiException(errorMessage:"Oh! Something below is broken!",isDisplay: true,);
    switch(e.type){
      case DioErrorType.CONNECT_TIMEOUT:
        apiException.errorMessage="It looks like the backend is taking too long for your request!";
        apiException.displayMessage="It looks like the backend is taking too long for your request!";
        break;
      case DioErrorType.SEND_TIMEOUT:
        apiException.errorMessage="It looks like the backend is taking too long for your request!";
        apiException.displayMessage="It looks like the backend is taking too long for your request!";

        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        apiException.errorMessage="It looks like the backend is taking too long for your request!";
        apiException.displayMessage="It looks like the backend is taking too long for your request!";

        break;
      case DioErrorType.RESPONSE:
        if(e.response!=null) {
          if(acceptedErrorResponse!=null && acceptedErrorResponse.contains(e.response?.statusCode))
          {
            return e.response;
          }
          switch (e.response?.statusCode) {
            case 400:
              if(acceptedErrorResponse!=null && acceptedErrorResponse.contains(400)) {
                apiException.errorMessage=e.response?.toString()??"Oh! Something below is broken!";
                apiException.displayMessage="Oh! Something below is broken!";
                return e.response;/// bad request and system want to a response for it then return error response
              }
              apiException.errorMessage=e.response?.toString()??"Oh! Something below is broken!";
              apiException.displayMessage="Oh! Something below is broken!";
              break;

            case 401:
              if(acceptedErrorResponse!=null && acceptedErrorResponse.contains(401)) {
                apiException.errorMessage=e.response?.toString()??"Oh! Something below is broken!";
                apiException.displayMessage="Oh! Something below is broken!";
                return e.response;/// bad request and system want to a response for it then return error response
              }
              apiException.errorMessage=e.response?.toString()??"Oh! Something below is broken!";
              apiException.displayMessage="Oh! Something below is broken!";
              break;

            case 404:
            // apiException.errorMessage= e.response?.toString()??"Похоже, что система не может найти запрошенный вами ресурс!";
              apiException.errorMessage= e.response?.toString()??"It looks like the system cannot find the resource you requested!";
              apiException.displayMessage= "It looks like the system cannot find the resource you requested!";
              break;
            case 500:
              apiException.errorMessage= e.response?.toString()??"Oh! Something below is broken1!";
              apiException.displayMessage= "Internal server error";
          }
        }
        break;

      case DioErrorType.DEFAULT:
        if (e.message.contains('SocketException')) {
          apiException.errorMessage="Bad Network! Unable to contact servers!";
          apiException.displayMessage="Bad Network! Unable to contact servers!";
        }
        else
        {
          apiException.errorMessage="Oh! Something below is broken!";
          apiException.displayMessage="Oh! Something below is broken!";
        }
        break;
      default:
    }
    return {"status":0,"message":apiException};
  }

  /// Function to request for get api
  dynamic get(String url,{Map<String,dynamic>? header,List? acceptedErrorResponse}) async {
    setDefaultHeaders(header);
    try {
      return await dio!.get(url,options: Options(headers: header));
    } on DioError catch(e){
      // ApiException apiException=ApiException(errorMessage:"Ой! Что-то внизу сломано! test",isDisplay: true,);
      // return apiException;
      return handleError(e,acceptedErrorResponse: acceptedErrorResponse);
    }
  }


  /// Function to request for post api
  dynamic post(String url,var payload,{Map<String,dynamic>? header,List? acceptedErrorResponse}) async {
    setDefaultHeaders(header);
    try {
      return await dio!.post(url,data: payload, options: Options(headers: header));
    } on DioError catch(e){
      return handleError(e,acceptedErrorResponse: acceptedErrorResponse);
    }
  }

  /// Function to request for put api
  dynamic put(String url,var payload,{Map<String,dynamic>? header,List? acceptedErrorResponse}) async {
    setDefaultHeaders(header);
    try {
      return await dio!.put(url,data: payload, options: Options(headers: header));
    } on DioError catch(e){
      return handleError(e,acceptedErrorResponse: acceptedErrorResponse);
    }
  }

  dynamic delete(String url,var payload,{Map<String,dynamic>? header,List? acceptedErrorResponse}) async {
    setDefaultHeaders(header);
    try {
      return await dio!.delete(url,data: payload, options: Options(headers: header));
    } on DioError catch(e){
      return handleError(e,acceptedErrorResponse: acceptedErrorResponse);
    }
  }

  /// Function to get default header
  setDefaultHeaders(header)
  {
    if(header==null) {
      header = {
        "Content-Type": "application/json",
      };
    }
  }

}
