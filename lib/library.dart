library path;

export 'dart:async';

export 'package:flutter/material.dart';
export 'package:auto_route/auto_route.dart';
export 'package:get_it/get_it.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:bible_depth/generated/l10n.dart';
export 'package:flutter_localizations/flutter_localizations.dart';
export 'package:bible_depth/app_initializer.dart';
export 'package:bible_depth/config/app_config.dart';
export 'package:bible_depth/resources/ui_themes.dart';
export 'package:bible_depth/resources/icons_constants.dart';
export 'package:bible_depth/resources/image_constants.dart';
export 'package:flutter/services.dart';
export 'package:bible_depth/router/routers.gr.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:equatable/equatable.dart';
export 'package:injectable/injectable.dart';
export 'package:talker_flutter/talker_flutter.dart';
export 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';

export 'core/version_handler.dart';
export 'router/routers.dart';

//widgets
export 'ui/widgets/custom_button.dart';
export 'ui/widgets/two_buttons.dart';

//start
export 'ui/start/splash.dart';
export 'ui/start/start_service.dart';

//main
export 'ui/main/main_page.dart';
export 'ui/main/main_service.dart';
export 'ui/main/bloc/main_page_bloc.dart';

//choice Fragment
export 'ui/choice_fragment/bible_service.dart';
export 'ui/choice_fragment/choise_book/choice_book.dart';
export 'ui/choice_fragment/choise_book/bloc/choice_book_bloc.dart';
export 'ui/choice_fragment/choice_fragment/choice_fragment.dart';
export 'ui/choice_fragment/choice_fragment/bloc/choice_fragment_bloc.dart';
export 'ui/choice_fragment/choice_fragment/widgets/choice_folder.dart';
export 'ui/choice_fragment/choice_fragment/widgets/create_folder.dart';
export 'ui/choice_fragment/choice_fragment/widgets/chapter_widget.dart';

//fragments
export 'ui/fragments/fragments_page.dart';
export 'ui/fragments/bloc/fragment_bloc.dart';

//analysis
export 'ui/analysis/analysis_page.dart';
export 'ui/analysis/bloc/analysis_bloc.dart';
