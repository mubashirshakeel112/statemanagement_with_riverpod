import 'package:future_provider/domain/models/posts_model.dart';
import 'package:future_provider/services/posts_service.dart';

class PostsRepository extends PostsService{
  final WCPostsService _wcPostsService = WCPostsService();
  @override
  Future<List<PostsModel>> get() async{
    return await _wcPostsService.get();
  }
}