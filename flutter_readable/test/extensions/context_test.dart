import 'package:flutter/material.dart';
import 'package:flutter_readable/flutter_readable.dart';
import 'package:flutter_test/flutter_test.dart';

class TestXPage extends StatelessWidget {
  const TestXPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text('readable is package from queen'),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            key: const Key('FAB'),
            onPressed: () {
              final extensions = <String, bool Function(BuildContext)>{
                /// * MediaQuery
                'mediaQuery': (ctx) =>
                    identical(ctx.mediaQuery, MediaQuery.of(ctx)),
                'width': (ctx) =>
                    identical(ctx.width, MediaQuery.of(ctx).size.width),
                'height': (ctx) =>
                    identical(ctx.height, MediaQuery.of(ctx).size.height),
                'aspectRation': (ctx) => identical(
                      ctx.aspectRatio,
                      MediaQuery.of(ctx).size.aspectRatio,
                    ),
                'mediaQueryPadding': (ctx) => identical(
                      ctx.mediaQueryPadding,
                      MediaQuery.of(ctx).padding,
                    ),
                'orientation': (ctx) =>
                    identical(ctx.orientation, MediaQuery.of(ctx).orientation),

                /// * context
                'overlay': (ctx) => identical(ctx.overlay, Overlay.of(ctx)),
                'scaffold': (ctx) => identical(ctx.scaffold, Scaffold.of(ctx)),
                'scaffoldMessenger': (ctx) =>
                    identical(ctx.scaffoldMessenger, ScaffoldMessenger.of(ctx)),

                /// * Localization

                'isRtl': (ctx) =>
                    ctx.isRtl == (Directionality.of(ctx) == TextDirection.rtl),
                'isLtr': (ctx) =>
                    ctx.isLtr == (Directionality.of(ctx) == TextDirection.ltr),

                /// * Navigator
                'canPop': (ctx) =>
                    identical(ctx.canPop, Navigator.of(ctx).canPop()),

                /// * text theme
                'bodyText1': (ctx) => identical(
                      ctx.bodyText1,
                      Theme.of(ctx).textTheme.bodyText1,
                    ),
                'bodyText2': (ctx) => identical(
                      ctx.bodyText2,
                      Theme.of(ctx).textTheme.bodyText2,
                    ),
                'button': (ctx) =>
                    identical(ctx.button, Theme.of(ctx).textTheme.button),
                'caption': (ctx) => identical(
                      ctx.caption,
                      Theme.of(ctx).textTheme.caption,
                    ),
                'overline': (ctx) => identical(
                      ctx.overline,
                      Theme.of(ctx).textTheme.overline,
                    ),
                'subtitle1': (ctx) => identical(
                      ctx.subtitle1,
                      Theme.of(ctx).textTheme.subtitle1,
                    ),
                'subtitle2': (ctx) => identical(
                      ctx.subtitle2,
                      Theme.of(ctx).textTheme.subtitle2,
                    ),
                'headline1': (ctx) => identical(
                      ctx.headline1,
                      Theme.of(ctx).textTheme.headline1,
                    ),
                'headline2': (ctx) => identical(
                      ctx.headline2,
                      Theme.of(ctx).textTheme.headline2,
                    ),
                'headline3': (ctx) => identical(
                      ctx.headline3,
                      Theme.of(ctx).textTheme.headline3,
                    ),
                'headline4': (ctx) => identical(
                      ctx.headline4,
                      Theme.of(ctx).textTheme.headline4,
                    ),
                'headline5': (ctx) => identical(
                      ctx.headline5,
                      Theme.of(ctx).textTheme.headline5,
                    ),
                'headline6': (ctx) => identical(
                      ctx.headline6,
                      Theme.of(ctx).textTheme.headline6,
                    ),

                'h1': (ctx) => identical(
                      ctx.h1,
                      Theme.of(ctx).textTheme.headline1,
                    ),
                'h2': (ctx) => identical(
                      ctx.h2,
                      Theme.of(ctx).textTheme.headline2,
                    ),
                'h3': (ctx) => identical(
                      ctx.h3,
                      Theme.of(ctx).textTheme.headline3,
                    ),
                'h4': (ctx) => identical(
                      ctx.h4,
                      Theme.of(ctx).textTheme.headline4,
                    ),
                'h5': (ctx) => identical(
                      ctx.h5,
                      Theme.of(ctx).textTheme.headline5,
                    ),
                'h6': (ctx) => identical(
                      ctx.h6,
                      Theme.of(ctx).textTheme.headline6,
                    ),

                /// * theme
                'theme': (ctx) => identical(ctx.theme, Theme.of(ctx)),
                'textTheme': (ctx) =>
                    identical(ctx.textTheme, Theme.of(ctx).textTheme),
                'isDark': (ctx) => identical(
                      ctx.isDark,
                      Theme.of(ctx).brightness == Brightness.dark,
                    ),
                'isLight': (ctx) => identical(
                      ctx.isLight,
                      Theme.of(ctx).brightness == Brightness.light,
                    ),
              };
              for (final ext in extensions.entries) {
                final result = ext.value(context);
                if (!result) throw '${ext.key} is not valid shortcut';
              }
            },
            child: const Icon(Icons.refresh),
          );
        },
      ),
    );
  }
}

void main() {
  testWidgets(
    'extensions on BuildContext',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: TestXPage()));
      await tester.pumpAndSettle();
      tester.tap(find.byKey(const Key('FAB')));
      // expect(find.text('false'), findsNothing);
    },
  );
}
