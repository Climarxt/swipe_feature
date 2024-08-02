import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_feature/config/configs.dart';
import 'package:new_feature/models/models.dart';

class SwipeRepository {
  final FirebaseFirestore _firebaseFirestore;
  final ContextualLogger logger;

  SwipeRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance,
        logger = ContextualLogger('SwipeRepository');

  Future<List<Post>> getSwipeMan({
    required String userId,
    String? lastPostId,
  }) async {
    const String functionName = 'getSwipeMan';
    logger.logInfo(
        functionName,
        'Début de la récupération des posts pour hommes de la base de données Firestore',
        {
          'userId': userId,
          'lastPostId': lastPostId,
        });

    try {
      QuerySnapshot postsSnap;
      if (lastPostId == null) {
        postsSnap = await _firebaseFirestore
            .collection('swipe_man')
            .doc('France')
            .collection('posts')
            .limit(50)
            .get();
      } else {
        final lastPostDoc = await _firebaseFirestore
            .collection('swipe_man')
            .doc('France')
            .collection('posts')
            .doc(lastPostId)
            .get();

        if (!lastPostDoc.exists) {
          logger.logInfo(functionName,
              'Aucun document postérieur trouvé, retourne une liste vide', {
            'lastPostId': lastPostId,
          });
          return [];
        }

        postsSnap = await _firebaseFirestore
            .collection('swipe_man')
            .doc('France')
            .collection('posts')
            .startAfterDocument(lastPostDoc)
            .limit(50)
            .get();
      }

      final postIds = postsSnap.docs.map((doc) => doc.id).toList();
      logger.logInfo(functionName, 'Posts fetched', {
        'docs': postIds,
      });

      List<Future<Post?>> postFutures = postsSnap.docs.map((doc) async {
        DocumentReference postRef = doc['post_ref'];
        logger.logInfo(
            functionName, 'Fetching postRef', {'postRef': postRef.path});
        DocumentSnapshot postSnap = await postRef.get();
        if (postSnap.exists) {
          final post = await Post.fromDocument(postSnap);
          if (post != null) {
            return post.copyWith(
                id: doc.id); // Associer l'ID du document source
          }
        } else {
          logger.logInfo(functionName, 'Post reference does not exist',
              {'postRef': postRef.path});
        }
        return null;
      }).toList();

      List<Post?> posts = await Future.wait(postFutures);

      // Filtrer les éléments null et retourner la liste des posts
      return posts.whereType<Post>().toList();
    } catch (e, stackTrace) {
      logger.logError(
          functionName, 'Erreur lors du chargement des posts pour hommes', {
        'error': e.toString(),
        'stackTrace': stackTrace.toString(),
      });
      rethrow;
    }
  }
}
