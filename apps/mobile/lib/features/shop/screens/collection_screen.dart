import 'product_list_screen.dart';

export 'product_list_screen.dart';

class CollectionScreen extends ProductListScreen {
  const CollectionScreen({super.key, required String collectionId})
      : super(collectionId: collectionId);
}

class OccasionScreen extends ProductListScreen {
  const OccasionScreen({super.key, required String occasionId})
      : super(occasionId: occasionId);
}
