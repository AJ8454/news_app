String endPoint(String endPoint) => "/v2/$endPoint";

Map<String, String> headerBearerOption({String? token}) => {
      "Content-Type": "application/json",
      // "Authorization": "Bearer $token",
    };
