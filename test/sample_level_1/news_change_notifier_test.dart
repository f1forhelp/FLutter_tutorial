import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tutorial/sample_level_1/article.dart';
import 'package:flutter_tutorial/sample_level_1/news_change_notifier.dart';
import 'package:flutter_tutorial/sample_level_1/news_service.dart';
import 'package:mocktail/mocktail.dart';

//Avoid This Kind of Mocks...

// class BadMockNewsService implements NewsService {
//   bool getArticleCalled = false;

//   @override
//   Future<List<Article>> getArticles() async {
//     getArticleCalled = true;

//     return [
//       Article(title: "Test 1", content: "Test 1 content"),
//       Article(title: "Test 2", content: "Test 2 content"),
//       Article(title: "Test 3", content: "Test 3 content"),
//     ];
//   }
// }

class MockNewsService extends Mock implements NewsService {}

void main() {
  late NewsChangeNotifier sut;
  late MockNewsService mockNewsService;
  //As you can see we can pass our dependency from the constructor which helps us to pass moc services.
  //And depending upon the use we can change it. from real implementation to moced one .
  setUp(() {
    mockNewsService = MockNewsService();
    sut = NewsChangeNotifier(mockNewsService);
  });

  test(
    "Inital Vlalues Are Correct",
    () {
      expect(sut.articles, []);
      expect(sut.isLoading, false);
    },
  );

  group(
    "Get Articles :\n",
    () {
      final articleFromService = [
        Article(title: "Test 1", content: "Test 1 content"),
        Article(title: "Test 2", content: "Test 2 content"),
        Article(title: "Test 3", content: "Test 3 content"),
      ];

      void arrangeNewsServiceReturn3Articles() {
        when(() => mockNewsService.getArticles()).thenAnswer(
          (invocation) async => articleFromService,
        );
      }

      test(
        "Gets Article Using NewsService",
        () async {
          //Arrange:  Arranging The mocs
          when(() => mockNewsService.getArticles())
              .thenAnswer((invocation) async => []);

          //Act : here the action is call getArticles() on system under test.
          await sut.getArticles();

          //Assert : Verify that a particular method is called.
          verify(
            () => mockNewsService.getArticles(),
          ).called(1);
        },
      );

      test(
        """Indicates Loading Of data ,
        sets articles to the ones from the service,
        Indicates that data is not being loaded anymore
        """,
        () async {
          arrangeNewsServiceReturn3Articles();
          final future = sut
              .getArticles(); //We cant await it here as is loading will be false if we move to other statement.
          expect(sut.isLoading, true);
          await future;
          expect(
            sut.articles,
            articleFromService,
          );
          expect(sut.isLoading, false);
        },
      );
    },
  );
}
