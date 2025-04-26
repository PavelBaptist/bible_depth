// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:bible_depth/library.dart' as _i8;
import 'package:bible_depth/ui/analysis/analysis_page.dart' as _i1;
import 'package:bible_depth/ui/choice_fragment/choice_fragment/choice_fragment.dart'
    as _i3;
import 'package:bible_depth/ui/choice_fragment/choise_book/choice_book.dart'
    as _i2;
import 'package:bible_depth/ui/fragments/fragments_page.dart' as _i4;
import 'package:bible_depth/ui/main/main_page.dart' as _i5;
import 'package:bible_depth/ui/start/splash.dart' as _i6;
import 'package:domain/domain.dart' as _i9;

/// generated route for
/// [_i1.AnalysisPage]
class AnalysisRoute extends _i7.PageRouteInfo<AnalysisRouteArgs> {
  AnalysisRoute({
    _i8.Key? key,
    required _i9.Fragment fragment,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         AnalysisRoute.name,
         args: AnalysisRouteArgs(key: key, fragment: fragment),
         initialChildren: children,
       );

  static const String name = 'AnalysisRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AnalysisRouteArgs>();
      return _i1.AnalysisPage(key: args.key, fragment: args.fragment);
    },
  );
}

class AnalysisRouteArgs {
  const AnalysisRouteArgs({this.key, required this.fragment});

  final _i8.Key? key;

  final _i9.Fragment fragment;

  @override
  String toString() {
    return 'AnalysisRouteArgs{key: $key, fragment: $fragment}';
  }
}

/// generated route for
/// [_i2.ChoiceBookPage]
class ChoiceBookRoute extends _i7.PageRouteInfo<ChoiceBookRouteArgs> {
  ChoiceBookRoute({
    _i8.Key? key,
    required List<_i9.Folder> folders,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         ChoiceBookRoute.name,
         args: ChoiceBookRouteArgs(key: key, folders: folders),
         initialChildren: children,
       );

  static const String name = 'ChoiceBookRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChoiceBookRouteArgs>();
      return _i2.ChoiceBookPage(key: args.key, folders: args.folders);
    },
  );
}

class ChoiceBookRouteArgs {
  const ChoiceBookRouteArgs({this.key, required this.folders});

  final _i8.Key? key;

  final List<_i9.Folder> folders;

  @override
  String toString() {
    return 'ChoiceBookRouteArgs{key: $key, folders: $folders}';
  }
}

/// generated route for
/// [_i3.ChoiceFragmentPage]
class ChoiceFragmentRoute extends _i7.PageRouteInfo<ChoiceFragmentRouteArgs> {
  ChoiceFragmentRoute({
    _i8.Key? key,
    required _i9.Book book,
    required List<_i9.Folder> folders,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         ChoiceFragmentRoute.name,
         args: ChoiceFragmentRouteArgs(key: key, book: book, folders: folders),
         initialChildren: children,
       );

  static const String name = 'ChoiceFragmentRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChoiceFragmentRouteArgs>();
      return _i3.ChoiceFragmentPage(
        key: args.key,
        book: args.book,
        folders: args.folders,
      );
    },
  );
}

class ChoiceFragmentRouteArgs {
  const ChoiceFragmentRouteArgs({
    this.key,
    required this.book,
    required this.folders,
  });

  final _i8.Key? key;

  final _i9.Book book;

  final List<_i9.Folder> folders;

  @override
  String toString() {
    return 'ChoiceFragmentRouteArgs{key: $key, book: $book, folders: $folders}';
  }
}

/// generated route for
/// [_i4.FragmentPage]
class FragmentRoute extends _i7.PageRouteInfo<FragmentRouteArgs> {
  FragmentRoute({
    _i8.Key? key,
    required _i9.Folder folder,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         FragmentRoute.name,
         args: FragmentRouteArgs(key: key, folder: folder),
         initialChildren: children,
       );

  static const String name = 'FragmentRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FragmentRouteArgs>();
      return _i4.FragmentPage(key: args.key, folder: args.folder);
    },
  );
}

class FragmentRouteArgs {
  const FragmentRouteArgs({this.key, required this.folder});

  final _i8.Key? key;

  final _i9.Folder folder;

  @override
  String toString() {
    return 'FragmentRouteArgs{key: $key, folder: $folder}';
  }
}

/// generated route for
/// [_i5.MainPage]
class MainRoute extends _i7.PageRouteInfo<void> {
  const MainRoute({List<_i7.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.MainPage();
    },
  );
}

/// generated route for
/// [_i6.SplashScreen]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.SplashScreen();
    },
  );
}
