import 'package:flutter_test/flutter_test.dart';
import 'package:photo_gallery/app/app.dart';
import 'package:photo_gallery/photo_gallery/view/photo_list_screen/photo_list_screen.dart';

void main() {
  group('App', () {
    testWidgets('renders Page', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(PhotoListScreen), findsOneWidget);
    });
  });
}
