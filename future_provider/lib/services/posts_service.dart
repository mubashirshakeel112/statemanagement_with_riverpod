import 'package:future_provider/constants/endpoints.dart';
import 'package:future_provider/domain/models/posts_model.dart';
import 'package:http/http.dart' as http;

abstract class PostsService{
  Future<List<PostsModel>> get();
}

class WCPostsService extends PostsService{
  @override
  Future<List<PostsModel>> get() async{
    try{
      Uri endpoints = Uri.parse(Endpoints.postsUrl);
      http.Response response = await http.get(endpoints, headers: {
        'User-Agent': 'Mozilla/5.0',
      },);
      if(response.statusCode >= 200 && response.statusCode <= 299){
        return postsFromJson(response.body);
      }else{
        throw Exception('Bad Request');
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }

}