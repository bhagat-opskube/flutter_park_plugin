
part of "apis.dart";

/// An abstract class to interfere b/w dio client and app request
abstract class HttpApiClient{
  static const int DEFAULT_TIMEOUT=20000;
  /// To get dio http client instance
  static HttpApiClient getInstance({int timeOut=DEFAULT_TIMEOUT})
  {
    if (Config.API_BASE_URL == null) {
    throw 'The API Base Url is not set';
  }
    return new DioHttpApiClient(timeOut: timeOut);
  }

  /// Function to handle error
  handleError(DioError e,{List acceptedErrorResponse});

  /// Function to request for get api
  get(String url,{Map<String,dynamic>? header,List? acceptedErrorResponse});

  /// Function to request for post api
  post(String url,var payload,{Map<String,dynamic>? header,List? acceptedErrorResponse});

  /// Function to request for put api
  put(String url,var payload,{Map<String,dynamic>? header,List? acceptedErrorResponse});


  delete(String url,var payload,{Map<String,dynamic>? header,List? acceptedErrorResponse});

}