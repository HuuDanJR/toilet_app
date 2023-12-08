import 'package:dio/dio.dart';
const CREATE_FEEDBACK = 'http://localhost:8080/create_feedback';
const LIST_FEEDBACK = 'http://localhost:8080/list_feedback';

class MyAPIService {
  Dio dio = Dio();
  
  

  Future createFeedBack({driver, star, content, experience, }) async {
    Map<String, dynamic> body = {
      "driver": "$driver",
      "star": star,
      "content": "$content",
      "experience": experience,
      "createdAt": DateTime.now().toString()
    };
    final response = await dio.post(
      '$CREATE_FEEDBACK',
      data: body,
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    return response.data;
  }


  Future<dynamic> fetchFeedBack() async {
    final response = await dio.get(
      '$LIST_FEEDBACK',
      options: Options(
        contentType: Headers.jsonContentType,
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      ),
    );
    return (response.data);
  }
}