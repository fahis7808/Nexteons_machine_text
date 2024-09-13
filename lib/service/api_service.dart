import 'package:dio/dio.dart';

class ApiService{
  static const url ="https://ajcjewel.com:4000/api/global-gallery/list";
  static const token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjYzMDI2ZjIxNWE5ZDVjNDY1NzQ3MTMxYSIsIl9lbXBsb3llZUlkXyI6IjYzMDI2ZjIxYTI1MTZhMTU0YTUxY2YxOSIsIl91c2VyUm9sZV8iOiJzdXBlcl9hZG1pbiIsImlhdCI6MTcyNjIwMTgxNiwiZXhwIjoxNzU3NzM3ODE2fQ.7ddHkTJekMT6ibaML0pprf3ZsdYhneFFv1Rubrx2VtM";


  static Future fetchData(
      Map<String,dynamic> data
      ) async {
    Dio dio = Dio();
    dio.options.headers['Authorization'] = token;  // Fix: added 'Bearer ' before the token
    try {
      Response response = await dio.post(url,
          data: data
      );
      if (response.statusCode == 201) {
        return response.data;
      } else {
        print('Error: ${response.statusCode}');
        return response.statusCode;
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}