import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider/presentation/posts/notifier/posts_notifier.dart';

class PostsView extends ConsumerStatefulWidget {
  static const String id = '/posts_view';

  const PostsView({super.key});

  @override
  ConsumerState<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends ConsumerState<PostsView> {
  @override
  Widget build(BuildContext context) {
    final posts = ref.watch(postsNotifier);
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
      ),
      body: posts.when(
        skipLoadingOnRefresh: false,
        data: (postsList) => ListView.builder(
          itemCount: postsList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(child: Image.network(postsList[index].image)),
                  SizedBox(height: 10,),
                  Text(postsList[index].title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                ],
              ),
              subtitle: Text(postsList[index].content),
            );
          },
        ),
        error: (e, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Something went wrong 😢"),
              Text(e.toString(), style: TextStyle(color: Colors.red)),
              ElevatedButton(onPressed: () => ref.refresh(postsNotifier), child: Text("Retry")),
            ],
          ),
        ),
        loading: () => Center(child: CircularProgressIndicator(color: Colors.deepPurple)),
      ),
    );
  }
}
