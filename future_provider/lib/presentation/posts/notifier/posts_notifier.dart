import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider/domain/models/posts_model.dart';
import 'package:future_provider/repository/posts_repository.dart';

final postsNotifier = FutureProvider<List<PostsModel>>((ref) async{
  PostsRepository postRepository = PostsRepository();
  return await postRepository.get();
});