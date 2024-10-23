// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:drift/drift.dart' as _i500;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:open_learning_smart_tv/core/database/app_database.dart'
    as _i318;
import 'package:open_learning_smart_tv/core/database/tables/local_notifications/local_notifications_dao.dart'
    as _i460;
import 'package:open_learning_smart_tv/core/database/tables/offline_player_tracking/offline_statements_dao.dart'
    as _i539;
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart'
    as _i495;
import 'package:open_learning_smart_tv/core/env/env.dart' as _i1001;
import 'package:open_learning_smart_tv/core/web_client_config/web_client_config.dart'
    as _i180;
import 'package:open_learning_smart_tv/data/data_sources/assets/app_resource_data_source.dart'
    as _i439;
import 'package:open_learning_smart_tv/data/data_sources/assets/app_resource_data_source_impl.dart'
    as _i675;
import 'package:open_learning_smart_tv/data/data_sources/auto_enrollment/auto_enrollment_data_source.dart'
    as _i417;
import 'package:open_learning_smart_tv/data/data_sources/auto_enrollment/auto_enrollment_data_source_impl.dart'
    as _i878;
import 'package:open_learning_smart_tv/data/data_sources/community/community_data_source.dart'
    as _i883;
import 'package:open_learning_smart_tv/data/data_sources/community/community_data_source_impl.dart'
    as _i876;
import 'package:open_learning_smart_tv/data/data_sources/corporate_code/corporate_code_data_source.dart'
    as _i563;
import 'package:open_learning_smart_tv/data/data_sources/corporate_code/corporate_code_data_source_impl.dart'
    as _i392;
import 'package:open_learning_smart_tv/data/data_sources/detail/detail_data_source.dart'
    as _i923;
import 'package:open_learning_smart_tv/data/data_sources/detail/detail_data_source_impl.dart'
    as _i400;
import 'package:open_learning_smart_tv/data/data_sources/download/download_data_source.dart'
    as _i744;
import 'package:open_learning_smart_tv/data/data_sources/download/download_data_source_impl.dart'
    as _i477;
import 'package:open_learning_smart_tv/data/data_sources/download_ics/download_ics_data_source.dart'
    as _i625;
import 'package:open_learning_smart_tv/data/data_sources/download_ics/download_ics_data_source_impl.dart'
    as _i515;
import 'package:open_learning_smart_tv/data/data_sources/ecm/ecm_data_source.dart'
    as _i939;
import 'package:open_learning_smart_tv/data/data_sources/ecm/ecm_data_source_impl.dart'
    as _i618;
import 'package:open_learning_smart_tv/data/data_sources/edition/edition_data_source.dart'
    as _i902;
import 'package:open_learning_smart_tv/data/data_sources/edition/edition_data_source_impl.dart'
    as _i400;
import 'package:open_learning_smart_tv/data/data_sources/language/language_data_source.dart'
    as _i814;
import 'package:open_learning_smart_tv/data/data_sources/language/language_data_source_impl.dart'
    as _i458;
import 'package:open_learning_smart_tv/data/data_sources/menu/menu_data_source.dart'
    as _i102;
import 'package:open_learning_smart_tv/data/data_sources/menu/menu_data_source_impl.dart'
    as _i105;
import 'package:open_learning_smart_tv/data/data_sources/openid_config/openid_config_data_source.dart'
    as _i1064;
import 'package:open_learning_smart_tv/data/data_sources/openid_config/openid_config_data_source_impl.dart'
    as _i260;
import 'package:open_learning_smart_tv/data/data_sources/page/page_data_source.dart'
    as _i216;
import 'package:open_learning_smart_tv/data/data_sources/page/page_data_source_impl.dart'
    as _i697;
import 'package:open_learning_smart_tv/data/data_sources/post/post_data_source.dart'
    as _i719;
import 'package:open_learning_smart_tv/data/data_sources/post/post_data_source_impl.dart'
    as _i888;
import 'package:open_learning_smart_tv/data/data_sources/progress/learner_progress_data_source.dart'
    as _i520;
import 'package:open_learning_smart_tv/data/data_sources/progress/learner_progress_data_source_impl.dart'
    as _i568;
import 'package:open_learning_smart_tv/data/data_sources/rating/rating_data_source.dart'
    as _i430;
import 'package:open_learning_smart_tv/data/data_sources/rating/rating_data_source_impl.dart'
    as _i139;
import 'package:open_learning_smart_tv/data/data_sources/search/search_data_source.dart'
    as _i637;
import 'package:open_learning_smart_tv/data/data_sources/search/search_data_source_impl.dart'
    as _i182;
import 'package:open_learning_smart_tv/data/data_sources/session/session_data_source.dart'
    as _i188;
import 'package:open_learning_smart_tv/data/data_sources/session/session_data_source_impl.dart'
    as _i547;
import 'package:open_learning_smart_tv/data/data_sources/smart_configurator/smart_configurator_data_source.dart'
    as _i229;
import 'package:open_learning_smart_tv/data/data_sources/smart_configurator/smart_configurator_data_source_impl.dart'
    as _i96;
import 'package:open_learning_smart_tv/data/data_sources/smart_learning/smart_learning_data_source.dart'
    as _i885;
import 'package:open_learning_smart_tv/data/data_sources/smart_learning/smart_learning_data_source_impl.dart'
    as _i309;
import 'package:open_learning_smart_tv/data/data_sources/start_resume/start_resume_data_source.dart'
    as _i1012;
import 'package:open_learning_smart_tv/data/data_sources/start_resume/start_resume_data_source_impl.dart'
    as _i1025;
import 'package:open_learning_smart_tv/data/data_sources/statements/statements_data_source.dart'
    as _i25;
import 'package:open_learning_smart_tv/data/data_sources/statements/statements_data_source_impl.dart'
    as _i182;
import 'package:open_learning_smart_tv/data/data_sources/strip/strip_data_source.dart'
    as _i576;
import 'package:open_learning_smart_tv/data/data_sources/strip/strip_data_source_impl.dart'
    as _i123;
import 'package:open_learning_smart_tv/data/data_sources/topic/topics_data_source.dart'
    as _i896;
import 'package:open_learning_smart_tv/data/data_sources/topic/topics_data_source_impl.dart'
    as _i1045;
import 'package:open_learning_smart_tv/data/data_sources/user/auth_data_source.dart'
    as _i516;
import 'package:open_learning_smart_tv/data/data_sources/user/auth_data_source_impl.dart'
    as _i853;
import 'package:open_learning_smart_tv/data/data_sources/user/user_data_source.dart'
    as _i760;
import 'package:open_learning_smart_tv/data/data_sources/user/user_data_source_impl.dart'
    as _i804;
import 'package:open_learning_smart_tv/data/data_sources/user_image/user_image_data_source.dart'
    as _i300;
import 'package:open_learning_smart_tv/data/data_sources/user_image/user_image_data_source_impl.dart'
    as _i1027;
import 'package:open_learning_smart_tv/data/data_sources/web_player/web_player_data_source.dart'
    as _i615;
import 'package:open_learning_smart_tv/data/data_sources/web_player/web_player_data_source_impl.dart'
    as _i782;
import 'package:open_learning_smart_tv/data/repositories/assets/app_resource_repository_impl.dart'
    as _i502;
import 'package:open_learning_smart_tv/data/repositories/auto_enrollment/auto_enrollment_repository_impl.dart'
    as _i839;
import 'package:open_learning_smart_tv/data/repositories/community/community_repository_impl.dart'
    as _i926;
import 'package:open_learning_smart_tv/data/repositories/corporate_code/corporate_code_repository_impl.dart'
    as _i931;
import 'package:open_learning_smart_tv/data/repositories/detail/detail_repository_impl.dart'
    as _i155;
import 'package:open_learning_smart_tv/data/repositories/download/download_repository_impl.dart'
    as _i882;
import 'package:open_learning_smart_tv/data/repositories/download_ics/download_ics_repository_impl.dart'
    as _i1004;
import 'package:open_learning_smart_tv/data/repositories/ecm/ecm_repository_impl.dart'
    as _i1060;
import 'package:open_learning_smart_tv/data/repositories/edition/edition_repository_impl.dart'
    as _i814;
import 'package:open_learning_smart_tv/data/repositories/menu/menu_repository_impl.dart'
    as _i979;
import 'package:open_learning_smart_tv/data/repositories/openid_config/openid_config_repository_impl.dart'
    as _i495;
import 'package:open_learning_smart_tv/data/repositories/page/page_repository_impl.dart'
    as _i1004;
import 'package:open_learning_smart_tv/data/repositories/post/post_repository_impl.dart'
    as _i862;
import 'package:open_learning_smart_tv/data/repositories/progress/learner_progress_repository_impl.dart'
    as _i1041;
import 'package:open_learning_smart_tv/data/repositories/rating/rating_repository_impl.dart'
    as _i85;
import 'package:open_learning_smart_tv/data/repositories/search/search_repository_impl.dart'
    as _i1030;
import 'package:open_learning_smart_tv/data/repositories/session/session_repository_impl.dart'
    as _i522;
import 'package:open_learning_smart_tv/data/repositories/smart_configurator/smart_configurator_repository_impl.dart'
    as _i307;
import 'package:open_learning_smart_tv/data/repositories/smart_learning/smart_learning_repository_impl.dart'
    as _i842;
import 'package:open_learning_smart_tv/data/repositories/start_resume/start_resume_repository_impl.dart'
    as _i39;
import 'package:open_learning_smart_tv/data/repositories/statements/statements_repository_impl.dart'
    as _i244;
import 'package:open_learning_smart_tv/data/repositories/strip/strip_repository_impl.dart'
    as _i351;
import 'package:open_learning_smart_tv/data/repositories/topics/topics_repository_impl.dart'
    as _i393;
import 'package:open_learning_smart_tv/data/repositories/user/auth_repository_impl.dart'
    as _i19;
import 'package:open_learning_smart_tv/data/repositories/user/user_repository_impl.dart'
    as _i836;
import 'package:open_learning_smart_tv/data/repositories/user_image/user_image_repository_impl.dart'
    as _i350;
import 'package:open_learning_smart_tv/data/repositories/wall/wall_repository_impl.dart'
    as _i646;
import 'package:open_learning_smart_tv/data/repositories/web_player/web_player_repository_impl.dart'
    as _i311;
import 'package:open_learning_smart_tv/domain/repositories/assets/app_resource_repository.dart'
    as _i329;
import 'package:open_learning_smart_tv/domain/repositories/auto_enrollment/auto_enrollment_repository.dart'
    as _i8;
import 'package:open_learning_smart_tv/domain/repositories/community/community_repository.dart'
    as _i261;
import 'package:open_learning_smart_tv/domain/repositories/corporate_code/corporate_code_repository.dart'
    as _i771;
import 'package:open_learning_smart_tv/domain/repositories/detail/detail_repository.dart'
    as _i179;
import 'package:open_learning_smart_tv/domain/repositories/download/download_repository.dart'
    as _i582;
import 'package:open_learning_smart_tv/domain/repositories/download_ics/download_ics_repository.dart'
    as _i252;
import 'package:open_learning_smart_tv/domain/repositories/ecm/ecm_repository.dart'
    as _i267;
import 'package:open_learning_smart_tv/domain/repositories/edition/edition_repository.dart'
    as _i522;
import 'package:open_learning_smart_tv/domain/repositories/menu/menu_repository.dart'
    as _i859;
import 'package:open_learning_smart_tv/domain/repositories/openid_config/openid_config_repository.dart'
    as _i297;
import 'package:open_learning_smart_tv/domain/repositories/page/page_repository.dart'
    as _i406;
import 'package:open_learning_smart_tv/domain/repositories/post/post_repository.dart'
    as _i983;
import 'package:open_learning_smart_tv/domain/repositories/progress/learner_progress_repository.dart'
    as _i127;
import 'package:open_learning_smart_tv/domain/repositories/rating/rating_repository.dart'
    as _i137;
import 'package:open_learning_smart_tv/domain/repositories/search/search_repository.dart'
    as _i719;
import 'package:open_learning_smart_tv/domain/repositories/session/session_repository.dart'
    as _i55;
import 'package:open_learning_smart_tv/domain/repositories/smart_configurator/smart_configurator_repository.dart'
    as _i143;
import 'package:open_learning_smart_tv/domain/repositories/smart_learning/smart_learning_repository.dart'
    as _i964;
import 'package:open_learning_smart_tv/domain/repositories/start_resume/start_resume_repository.dart'
    as _i433;
import 'package:open_learning_smart_tv/domain/repositories/statements/statements_repository.dart'
    as _i669;
import 'package:open_learning_smart_tv/domain/repositories/strip/strip_repository.dart'
    as _i508;
import 'package:open_learning_smart_tv/domain/repositories/topics/topics_repository.dart'
    as _i922;
import 'package:open_learning_smart_tv/domain/repositories/user/auth_repository.dart'
    as _i263;
import 'package:open_learning_smart_tv/domain/repositories/user/user_repository.dart'
    as _i755;
import 'package:open_learning_smart_tv/domain/repositories/user_image/user_image_repository.dart'
    as _i399;
import 'package:open_learning_smart_tv/domain/repositories/wall/wall_repository.dart'
    as _i52;
import 'package:open_learning_smart_tv/domain/repositories/web_view_player/web_view_player_repository.dart'
    as _i987;
import 'package:open_learning_smart_tv/domain/use_cases/assets/get_app_resource_use_case.dart'
    as _i869;
import 'package:open_learning_smart_tv/domain/use_cases/auto_enrollment/auto_enrollment_use_case.dart'
    as _i26;
import 'package:open_learning_smart_tv/domain/use_cases/auto_enrollment/bottom_enrollment_use_case.dart'
    as _i1056;
import 'package:open_learning_smart_tv/domain/use_cases/clean_local_datatbase_use_case.dart'
    as _i788;
import 'package:open_learning_smart_tv/domain/use_cases/clear_secure_stored_info_use_case.dart'
    as _i350;
import 'package:open_learning_smart_tv/domain/use_cases/clear_secure_stored_use_case.dart'
    as _i456;
import 'package:open_learning_smart_tv/domain/use_cases/community/add_answer_use_case.dart'
    as _i586;
import 'package:open_learning_smart_tv/domain/use_cases/community/add_comment_use_case.dart'
    as _i943;
import 'package:open_learning_smart_tv/domain/use_cases/community/delete_comment_use_case.dart'
    as _i678;
import 'package:open_learning_smart_tv/domain/use_cases/community/edit_comment_use_case.dart'
    as _i449;
import 'package:open_learning_smart_tv/domain/use_cases/community/get_answers_use_case.dart'
    as _i130;
import 'package:open_learning_smart_tv/domain/use_cases/community/get_comments_use_case.dart'
    as _i125;
import 'package:open_learning_smart_tv/domain/use_cases/community/get_community_post_likes_use_case.dart'
    as _i437;
import 'package:open_learning_smart_tv/domain/use_cases/community/get_community_post_use_case.dart'
    as _i848;
import 'package:open_learning_smart_tv/domain/use_cases/community/get_community_posts_use_case.dart'
    as _i294;
import 'package:open_learning_smart_tv/domain/use_cases/community/get_shared_post_use_case.dart'
    as _i546;
import 'package:open_learning_smart_tv/domain/use_cases/community/like_post_use_case.dart'
    as _i502;
import 'package:open_learning_smart_tv/domain/use_cases/community/start_community_tracking_use_case.dart'
    as _i523;
import 'package:open_learning_smart_tv/domain/use_cases/community/stop_community_tracking_use_case.dart'
    as _i227;
import 'package:open_learning_smart_tv/domain/use_cases/community/unlike_post_use_case.dart'
    as _i891;
import 'package:open_learning_smart_tv/domain/use_cases/detail/add_favourites_use_case.dart'
    as _i934;
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_detail_page_use_case.dart'
    as _i807;
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_editions_use_case.dart'
    as _i16;
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_rating_use_case.dart'
    as _i926;
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_related_activities_use_case.dart'
    as _i238;
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_shared_posts_use_case.dart'
    as _i688;
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_teacher_detail_use_case.dart'
    as _i581;
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_tool_url_use_case.dart'
    as _i649;
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_tools_use_case.dart'
    as _i144;
import 'package:open_learning_smart_tv/domain/use_cases/detail/remove_favourite_use_case.dart'
    as _i487;
import 'package:open_learning_smart_tv/domain/use_cases/download/cancel_download_use_case.dart'
    as _i831;
import 'package:open_learning_smart_tv/domain/use_cases/download/delete_download_use_case.dart'
    as _i316;
import 'package:open_learning_smart_tv/domain/use_cases/download/get_stored_download_content_info_use_case.dart'
    as _i25;
import 'package:open_learning_smart_tv/domain/use_cases/download/query_download_manager_use_case.dart'
    as _i381;
import 'package:open_learning_smart_tv/domain/use_cases/download/remove_stored_download_content_info_use_case.dart'
    as _i256;
import 'package:open_learning_smart_tv/domain/use_cases/download/retrieve_download_info_use_case.dart'
    as _i121;
import 'package:open_learning_smart_tv/domain/use_cases/download/schedule_download_use_case.dart'
    as _i178;
import 'package:open_learning_smart_tv/domain/use_cases/download/store_download_content_info_use_case.dart'
    as _i989;
import 'package:open_learning_smart_tv/domain/use_cases/download_ics/download_events_use_case.dart'
    as _i1063;
import 'package:open_learning_smart_tv/domain/use_cases/download_ics/get_events_use_case.dart'
    as _i336;
import 'package:open_learning_smart_tv/domain/use_cases/ecm/ecm_register_use_case.dart'
    as _i890;
import 'package:open_learning_smart_tv/domain/use_cases/ecm/get_ecm_disciplines_use_case.dart'
    as _i402;
import 'package:open_learning_smart_tv/domain/use_cases/ecm/get_ecm_professions_use_case.dart'
    as _i1018;
import 'package:open_learning_smart_tv/domain/use_cases/edition/edition_register_use_case.dart'
    as _i325;
import 'package:open_learning_smart_tv/domain/use_cases/get_corporate_id_use_case.dart'
    as _i690;
import 'package:open_learning_smart_tv/domain/use_cases/get_menu_structure_use_case.dart'
    as _i449;
import 'package:open_learning_smart_tv/domain/use_cases/get_page_size_strip_use_case.dart'
    as _i1037;
import 'package:open_learning_smart_tv/domain/use_cases/get_secure_stored_user_info_ss_use_case.dart'
    as _i224;
import 'package:open_learning_smart_tv/domain/use_cases/get_secure_stored_user_info_use_case.dart'
    as _i832;
import 'package:open_learning_smart_tv/domain/use_cases/get_skip_onboarding_use_case.dart'
    as _i838;
import 'package:open_learning_smart_tv/domain/use_cases/get_skip_tutorial_use_case.dart'
    as _i959;
import 'package:open_learning_smart_tv/domain/use_cases/get_stored_user_self_use_case.dart'
    as _i492;
import 'package:open_learning_smart_tv/domain/use_cases/get_stored_username_use_case.dart'
    as _i681;
import 'package:open_learning_smart_tv/domain/use_cases/get_user_self.dart'
    as _i480;
import 'package:open_learning_smart_tv/domain/use_cases/handler_stored_username_use_case.dart'
    as _i330;
import 'package:open_learning_smart_tv/domain/use_cases/oauth_token_use_case.dart'
    as _i490;
import 'package:open_learning_smart_tv/domain/use_cases/openid_config/get_openid_config_use_case.dart'
    as _i844;
import 'package:open_learning_smart_tv/domain/use_cases/openid_config/get_stored_openid_config_use_case.dart'
    as _i584;
import 'package:open_learning_smart_tv/domain/use_cases/openid_config/set_stored_openid_config_use_case.dart'
    as _i829;
import 'package:open_learning_smart_tv/domain/use_cases/page/get_page_structure_use_case.dart'
    as _i531;
import 'package:open_learning_smart_tv/domain/use_cases/post/create_post_use_case.dart'
    as _i144;
import 'package:open_learning_smart_tv/domain/use_cases/post/delete_post_use_case.dart'
    as _i54;
import 'package:open_learning_smart_tv/domain/use_cases/post/edit_post_use_case.dart'
    as _i471;
import 'package:open_learning_smart_tv/domain/use_cases/progress/get_learner_goals_use_case.dart'
    as _i730;
import 'package:open_learning_smart_tv/domain/use_cases/progress/get_learner_progress_use_case.dart'
    as _i361;
import 'package:open_learning_smart_tv/domain/use_cases/progress/get_progress_goals_config_use_case.dart'
    as _i485;
import 'package:open_learning_smart_tv/domain/use_cases/rating/rating_use_case.dart'
    as _i26;
import 'package:open_learning_smart_tv/domain/use_cases/search/get_search_results_use_case.dart'
    as _i664;
import 'package:open_learning_smart_tv/domain/use_cases/search/get_suggestions_use_case.dart'
    as _i1003;
import 'package:open_learning_smart_tv/domain/use_cases/self/set_privacyconsent_use_case.dart'
    as _i596;
import 'package:open_learning_smart_tv/domain/use_cases/session/check_session_use_case.dart'
    as _i140;
import 'package:open_learning_smart_tv/domain/use_cases/session/create_session_use_case.dart'
    as _i205;
import 'package:open_learning_smart_tv/domain/use_cases/session/get_stored_corporate_id_ss_use_case.dart'
    as _i312;
import 'package:open_learning_smart_tv/domain/use_cases/session/get_stored_corporate_id_use_case.dart'
    as _i674;
import 'package:open_learning_smart_tv/domain/use_cases/session/set_initiative_use_case.dart'
    as _i381;
import 'package:open_learning_smart_tv/domain/use_cases/set_secure_stored_user_info_use_case.dart'
    as _i1009;
import 'package:open_learning_smart_tv/domain/use_cases/set_skip_onboarding_use_case.dart'
    as _i941;
import 'package:open_learning_smart_tv/domain/use_cases/set_skip_tutorial_use_case.dart'
    as _i623;
import 'package:open_learning_smart_tv/domain/use_cases/set_stored_corporate_id_use_case.dart'
    as _i1020;
import 'package:open_learning_smart_tv/domain/use_cases/set_stored_user_self_use_case.dart'
    as _i405;
import 'package:open_learning_smart_tv/domain/use_cases/smart_configurator/get_colors_use_case.dart'
    as _i413;
import 'package:open_learning_smart_tv/domain/use_cases/smart_configurator/get_labels_use_case.dart'
    as _i220;
import 'package:open_learning_smart_tv/domain/use_cases/smart_configurator/get_languages_use_case.dart'
    as _i946;
import 'package:open_learning_smart_tv/domain/use_cases/smart_configurator/get_smart_configuration_use_case.dart'
    as _i1049;
import 'package:open_learning_smart_tv/domain/use_cases/smart_configurator/get_stored_smart_configuration_use_case.dart'
    as _i306;
import 'package:open_learning_smart_tv/domain/use_cases/smart_configurator/set_stored_smart_configuration_use_case.dart'
    as _i7;
import 'package:open_learning_smart_tv/domain/use_cases/smart_learning/create_smart_learning_slot_use_case.dart'
    as _i828;
import 'package:open_learning_smart_tv/domain/use_cases/smart_learning/delete_smart_learning_slot_use_case.dart'
    as _i321;
import 'package:open_learning_smart_tv/domain/use_cases/smart_learning/get_smart_learning_slots_use_case.dart'
    as _i811;
import 'package:open_learning_smart_tv/domain/use_cases/smart_learning/update_smart_learning_slot_use_case.dart'
    as _i957;
import 'package:open_learning_smart_tv/domain/use_cases/start_resume_use_case/start_resume_use_case.dart'
    as _i801;
import 'package:open_learning_smart_tv/domain/use_cases/statements/get_state_use_case.dart'
    as _i740;
import 'package:open_learning_smart_tv/domain/use_cases/statements/set_state_use_case.dart'
    as _i1003;
import 'package:open_learning_smart_tv/domain/use_cases/statements/statements_use_case.dart'
    as _i615;
import 'package:open_learning_smart_tv/domain/use_cases/strip/get_calendar_strip_use_case.dart'
    as _i276;
import 'package:open_learning_smart_tv/domain/use_cases/strip/get_continue_learning_strip_use_case.dart'
    as _i427;
import 'package:open_learning_smart_tv/domain/use_cases/strip/get_standard_strip_use_case.dart'
    as _i783;
import 'package:open_learning_smart_tv/domain/use_cases/strip/get_wall_strip_content_use_case.dart'
    as _i931;
import 'package:open_learning_smart_tv/domain/use_cases/topics/get_topics_use_case.dart'
    as _i351;
import 'package:open_learning_smart_tv/domain/use_cases/user_profile_image/get_user_image_use_case.dart'
    as _i552;
import 'package:open_learning_smart_tv/domain/use_cases/webview/web_view_player_linkedin_use_case.dart'
    as _i341;
import 'package:open_learning_smart_tv/domain/use_cases/webview/web_view_player_use_case.dart'
    as _i493;
import 'package:open_learning_smart_tv/presentation/app_state/cubit/app_cubit.dart'
    as _i1020;
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/calendar/cubit/ol_calendar_dialog_cubit.dart'
    as _i715;
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/cubit/ol_download_dialog_cubit.dart'
    as _i192;
import 'package:open_learning_smart_tv/presentation/common/widgets/logo_app_header/cubit/app_logo_cubit.dart'
    as _i999;
import 'package:open_learning_smart_tv/presentation/common/widgets/logo_app_header/logo_header_cubit.dart'
    as _i389;
import 'package:open_learning_smart_tv/presentation/common/widgets/rating/ratings_dialog_cubit.dart'
    as _i493;
import 'package:open_learning_smart_tv/presentation/common/widgets/smart_learning_bottom_sheet/cubit/smart_learning_bottom_sheet_cubit.dart'
    as _i675;
import 'package:open_learning_smart_tv/presentation/common/widgets/topics_filter/cubit/topics_filter_cubit.dart'
    as _i872;
import 'package:open_learning_smart_tv/presentation/common/widgets/user_avatar/cubit/user_avatar_cubit.dart'
    as _i735;
import 'package:open_learning_smart_tv/presentation/corporate_code/cubit/corporate_code_cubit.dart'
    as _i424;
import 'package:open_learning_smart_tv/presentation/course_detail/cubit/detail_page_cubit.dart'
    as _i723;
import 'package:open_learning_smart_tv/presentation/course_detail/ecm/registration/cubit/ecm_registration_cubit.dart'
    as _i516;
import 'package:open_learning_smart_tv/presentation/course_detail/ecm/registration/steps/first_step/cubit/ecm_first_step_cubit.dart'
    as _i469;
import 'package:open_learning_smart_tv/presentation/course_detail/ecm/registration/steps/second_step/cubit/ecm_second_step_cubit.dart'
    as _i590;
import 'package:open_learning_smart_tv/presentation/course_detail/editions/edition_cubit.dart'
    as _i381;
import 'package:open_learning_smart_tv/presentation/course_detail/favorites/cubit/favourite_cubit.dart'
    as _i919;
import 'package:open_learning_smart_tv/presentation/course_detail/rating/rating_cubit.dart'
    as _i102;
import 'package:open_learning_smart_tv/presentation/course_detail/widgets/teachers_sheet/cubit/teacher_detail_sheet_cubit.dart'
    as _i393;
import 'package:open_learning_smart_tv/presentation/course_detail/widgets/tools/tool_item/cubit/tool_item_cubit.dart'
    as _i269;
import 'package:open_learning_smart_tv/presentation/dynamic_content/cubit/dynamic_all_content_cubit.dart'
    as _i692;
import 'package:open_learning_smart_tv/presentation/dynamic_content/cubit/dynamic_content_cubit.dart'
    as _i913;
import 'package:open_learning_smart_tv/presentation/dynamic_content/cubit/favorites_content_cubit.dart'
    as _i110;
import 'package:open_learning_smart_tv/presentation/dynamic_content/onboarding/cubit/onboarding_manager_cubit.dart'
    as _i2;
import 'package:open_learning_smart_tv/presentation/dynamic_content/onboarding/cubit/onboarding_sheet_cubit.dart'
    as _i935;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/calendar/cubit/calendar_month_strip_cubit.dart'
    as _i581;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/calendar/cubit/calendar_strip_cubit.dart'
    as _i120;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/continue_learning/cubit/continue_learning_strip_cubit.dart'
    as _i664;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/favourites/cubit/favourites_strip_cubit.dart'
    as _i976;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/standard/cubit/standard_strip_cubit.dart'
    as _i450;
import 'package:open_learning_smart_tv/presentation/initiatives/cubit/initiatives_cubit.dart'
    as _i1027;
import 'package:open_learning_smart_tv/presentation/languages/cubit/languages_cubit.dart'
    as _i638;
import 'package:open_learning_smart_tv/presentation/login/cubit/login_cubit.dart'
    as _i173;
import 'package:open_learning_smart_tv/presentation/login/mfa/cubit/mfa_cubit.dart'
    as _i718;
import 'package:open_learning_smart_tv/presentation/login/sso/cubit/sso_cubit.dart'
    as _i5;
import 'package:open_learning_smart_tv/presentation/privacy/cubit/privacy_cubit.dart'
    as _i76;
import 'package:open_learning_smart_tv/presentation/profile/cubit/profile_page_cubit.dart'
    as _i882;
import 'package:open_learning_smart_tv/presentation/pwd_recover/cubit/pwd_confirm_page_cubit.dart'
    as _i617;
import 'package:open_learning_smart_tv/presentation/pwd_recover/cubit/pwd_recover_page_cubit.dart'
    as _i930;
import 'package:open_learning_smart_tv/presentation/pwd_reset/cubit/pwd_reset_page_cubit.dart'
    as _i1023;
import 'package:open_learning_smart_tv/presentation/pwd_reset/cubit/pwd_set_old_page_cubit.dart'
    as _i114;
import 'package:open_learning_smart_tv/presentation/search/cubit/best_rating_strip_cubit.dart'
    as _i409;
import 'package:open_learning_smart_tv/presentation/search/cubit/search_cubit.dart'
    as _i131;
import 'package:open_learning_smart_tv/presentation/settings/cubit/settings_cubit.dart'
    as _i810;
import 'package:open_learning_smart_tv/presentation/splashscreen/cubit/splash_screen_cubit.dart'
    as _i138;
import 'package:open_learning_smart_tv/presentation/video_player/cubit/video_player_cubit.dart'
    as _i544;
import 'package:open_learning_smart_tv/presentation/wall/cubit/wall_cubit.dart'
    as _i531;
import 'package:open_learning_smart_tv/presentation/web_player/cubit/web_view_page_cubit.dart'
    as _i455;
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels.dart'
    as _i740;
import 'package:open_learning_smart_tv/wrappers/cognito_auth.dart' as _i82;
import 'package:open_learning_smart_tv/wrappers/ol_cognito_storage.dart'
    as _i421;
import 'package:open_learning_smart_tv/wrappers/ol_secure_storage.dart'
    as _i129;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

const String _dev = 'dev';
const String _production = 'production';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final externalModule = _$ExternalModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => externalModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i500.LazyDatabase>(() => externalModule.lazyDatabase);
    gh.factory<_i114.PwdSetOldPageCubit>(() => _i114.PwdSetOldPageCubit());
    gh.factory<_i999.AppLogoCubit>(() => _i999.AppLogoCubit());
    gh.factory<_i381.EditionCubit>(() => _i381.EditionCubit());
    gh.factory<_i516.EcmRegistrationCubit>(() => _i516.EcmRegistrationCubit());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => externalModule.secureStorage);
    gh.lazySingleton<_i528.PrettyDioLogger>(
        () => externalModule.logInterceptor);
    gh.lazySingleton<_i7.SetStoredSmartConfigurationUseCase>(
        () => _i7.SetStoredSmartConfigurationUseCase());
    gh.lazySingleton<_i1037.GetPageSizeStripUseCase>(
        () => _i1037.GetPageSizeStripUseCase());
    gh.lazySingleton<_i381.QueryDownloadManagerUseCase>(
        () => _i381.QueryDownloadManagerUseCase());
    gh.lazySingleton<_i832.GetSecureStoredUserInfoUseCase>(
        () => _i832.GetSecureStoredUserInfoUseCase());
    gh.lazySingleton<_i674.GetStoredCorporateIdUseCase>(
        () => _i674.GetStoredCorporateIdUseCase());
    gh.factory<_i129.OlSecureStorage>(
        () => _i129.OlSecureStorage(gh<_i558.FlutterSecureStorage>()));
    gh.lazySingleton<_i1001.Env>(
      () => _i1001.Test(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i1009.SetSecureStoredUserInfoUseCase>(
        () => _i1009.SetSecureStoredUserInfoUseCase(
              gh<_i129.OlSecureStorage>(),
              gh<_i460.SharedPreferences>(),
            ));
    gh.lazySingleton<_i941.SetSkipOnboardingUseCase>(
        () => _i941.SetSkipOnboardingUseCase(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i681.GetStoredUsernameUseCase>(
        () => _i681.GetStoredUsernameUseCase(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i623.SetSkipTutorialUseCase>(
        () => _i623.SetSkipTutorialUseCase(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i959.GetSkipTutorialUseCase>(
        () => _i959.GetSkipTutorialUseCase(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i256.RemoveStoredDownloadContentInfoUseCase>(() =>
        _i256.RemoveStoredDownloadContentInfoUseCase(
            gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i25.GetStoredDownloadContentInfoUseCase>(() =>
        _i25.GetStoredDownloadContentInfoUseCase(
            gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i989.StoreDownloadContentInfoUseCase>(() =>
        _i989.StoreDownloadContentInfoUseCase(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i838.GetSkipOnboardingUseCase>(
        () => _i838.GetSkipOnboardingUseCase(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i330.HandlerStoredUsernameUseCase>(() =>
        _i330.HandlerStoredUsernameUseCase(gh<_i460.SharedPreferences>()));
    gh.factory<_i421.OlCognitoStorage>(
        () => _i421.OlCognitoStorage(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i318.AppDatabase>(
        () => _i318.AppDatabase(gh<_i500.LazyDatabase>()));
    gh.lazySingleton<_i306.GetStoredSmartConfigurationUseCase>(
        () => _i306.GetStoredSmartConfigurationUseCase(gh<_i1001.Env>()));
    gh.lazySingleton<_i456.ClearSecureStoredUseCase>(
        () => _i456.ClearSecureStoredUseCase(gh<_i129.OlSecureStorage>()));
    gh.lazySingleton<_i224.GetSecureStoredUserInfoSsUseCase>(() =>
        _i224.GetSecureStoredUserInfoSsUseCase(gh<_i129.OlSecureStorage>()));
    gh.lazySingleton<_i829.SetStoredOpenidConfigUseCase>(
        () => _i829.SetStoredOpenidConfigUseCase(gh<_i129.OlSecureStorage>()));
    gh.lazySingleton<_i584.GetStoredOpenidConfigUseCase>(
        () => _i584.GetStoredOpenidConfigUseCase(gh<_i129.OlSecureStorage>()));
    gh.lazySingleton<_i492.GetStoredUserSelfUseCase>(
        () => _i492.GetStoredUserSelfUseCase(gh<_i129.OlSecureStorage>()));
    gh.lazySingleton<_i1020.SetStoredCorporateIdUseCase>(
        () => _i1020.SetStoredCorporateIdUseCase(gh<_i129.OlSecureStorage>()));
    gh.lazySingleton<_i405.SetStoredUserSelfUseCase>(
        () => _i405.SetStoredUserSelfUseCase(gh<_i129.OlSecureStorage>()));
    gh.lazySingleton<_i350.ClearSecureStoredUserInfoUseCase>(() =>
        _i350.ClearSecureStoredUserInfoUseCase(gh<_i129.OlSecureStorage>()));
    gh.lazySingleton<_i350.ClearSecureStoredInitiativeUseCase>(() =>
        _i350.ClearSecureStoredInitiativeUseCase(gh<_i129.OlSecureStorage>()));
    gh.lazySingleton<_i312.GetStoredCorporateIdSsUseCase>(
        () => _i312.GetStoredCorporateIdSsUseCase(gh<_i129.OlSecureStorage>()));
    gh.lazySingleton<_i1001.Env>(
      () => _i1001.Prod(),
      registerFor: {_production},
    );
    gh.factory<_i361.Dio>(
      () => externalModule.dioDynamic(
        gh<_i528.PrettyDioLogger>(),
        gh<_i1001.Env>(),
      ),
      instanceName: 'dynamicUrlClient',
    );
    gh.factory<_i361.Dio>(
      () => externalModule.dioCognito(
        gh<_i528.PrettyDioLogger>(),
        gh<_i1001.Env>(),
      ),
      instanceName: 'cognitoAuthClient',
    );
    gh.lazySingleton<_i516.AuthDataSource>(() => _i853.AuthDataSourceImpl(
        gh<_i361.Dio>(instanceName: 'cognitoAuthClient')));
    gh.factory<_i361.Dio>(
      () => externalModule.dioDefault(
        gh<_i528.PrettyDioLogger>(),
        gh<_i1001.Env>(),
      ),
      instanceName: 'default',
    );
    gh.factory<_i138.SplashScreenCubit>(() =>
        _i138.SplashScreenCubit(gh<_i224.GetSecureStoredUserInfoSsUseCase>()));
    gh.lazySingleton<_i539.OfflineStatementsDao>(
        () => _i539.OfflineStatementsDao(gh<_i318.AppDatabase>()));
    gh.lazySingleton<_i460.LocalNotificationsDao>(
        () => _i460.LocalNotificationsDao(gh<_i318.AppDatabase>()));
    gh.factory<_i2.OnboardingManagerCubit>(() => _i2.OnboardingManagerCubit(
          gh<_i492.GetStoredUserSelfUseCase>(),
          gh<_i838.GetSkipOnboardingUseCase>(),
        ));
    gh.lazySingleton<_i1064.OpenidConfigDataSource>(() =>
        _i260.OpenidConfigDataSourceImpl(
            gh<_i361.Dio>(instanceName: 'default')));
    gh.lazySingleton<_i760.UserDataSource>(
        () => _i804.UserDataSourceImpl(gh<_i361.Dio>(instanceName: 'default')));
    gh.lazySingleton<_i744.DownloadDataSource>(() =>
        _i477.DownloadDataSourceImpl(
            gh<_i361.Dio>(instanceName: 'dynamicUrlClient')));
    gh.lazySingleton<_i755.UserRepository>(
        () => _i836.UserRepositoryImpl(gh<_i760.UserDataSource>()));
    gh.lazySingleton<_i297.OpenidConfigRepository>(() =>
        _i495.OpenidConfigRepositoryImpl(gh<_i1064.OpenidConfigDataSource>()));
    gh.lazySingleton<_i596.SetPrivacyConsentUseCase>(
        () => _i596.SetPrivacyConsentUseCase(gh<_i755.UserRepository>()));
    gh.lazySingleton<_i480.GetUserSelfUseCase>(
        () => _i480.GetUserSelfUseCase(gh<_i755.UserRepository>()));
    gh.lazySingleton<_i814.LanguageDataSource>(
        () => _i458.LanguageSourceImpl(gh<_i361.Dio>(instanceName: 'default')));
    gh.lazySingleton<_i188.SessionDataSource>(() =>
        _i547.SessionDataSourceImpl(gh<_i361.Dio>(instanceName: 'default')));
    gh.lazySingleton<_i263.AuthRepository>(() => _i19.AuthRepositoryImpl(
          gh<_i516.AuthDataSource>(),
          gh<_i584.GetStoredOpenidConfigUseCase>(),
        ));
    gh.lazySingleton<_i563.CorporateCodeDataSource>(() =>
        _i392.CorporateCodeDataSourceImpl(
            gh<_i361.Dio>(instanceName: 'default')));
    gh.lazySingleton<_i844.GetOpenidConfigUseCase>(
        () => _i844.GetOpenidConfigUseCase(gh<_i297.OpenidConfigRepository>()));
    gh.lazySingleton<_i771.CorporateCodeRepository>(() =>
        _i931.CorporateCodeRepositoryImpl(gh<_i563.CorporateCodeDataSource>()));
    gh.lazySingleton<_i690.GetCorporateIdUseCase>(
        () => _i690.GetCorporateIdUseCase(gh<_i771.CorporateCodeRepository>()));
    gh.lazySingleton<_i490.OauthTokenUseCase>(
        () => _i490.OauthTokenUseCase(gh<_i263.AuthRepository>()));
    gh.lazySingleton<_i582.DownloadlRepository>(
        () => _i882.DownloadlRepositoryImpl(
              gh<_i744.DownloadDataSource>(),
              gh<_i1001.Env>(),
            ));
    gh.lazySingleton<_i178.ScheduleDownloadUseCase>(
        () => _i178.ScheduleDownloadUseCase(gh<_i582.DownloadlRepository>()));
    gh.lazySingleton<_i831.CancelDownloadUseCase>(
        () => _i831.CancelDownloadUseCase(gh<_i582.DownloadlRepository>()));
    gh.lazySingleton<_i121.RetrieveDownloadInfoUseCase>(() =>
        _i121.RetrieveDownloadInfoUseCase(gh<_i582.DownloadlRepository>()));
    gh.lazySingleton<_i316.DeleteDownloadUseCase>(
        () => _i316.DeleteDownloadUseCase(gh<_i582.DownloadlRepository>()));
    gh.factory<_i76.PrivacyCubit>(
        () => _i76.PrivacyCubit(gh<_i596.SetPrivacyConsentUseCase>()));
    gh.lazySingleton<_i55.SessionRepository>(
        () => _i522.SessionRepositoryImpl(gh<_i188.SessionDataSource>()));
    gh.lazySingleton<_i788.CleanLocalDatabaseUseCase>(
        () => _i788.CleanLocalDatabaseUseCase(
              gh<_i318.AppDatabase>(),
              gh<_i460.SharedPreferences>(),
              gh<_i381.QueryDownloadManagerUseCase>(),
              gh<_i256.RemoveStoredDownloadContentInfoUseCase>(),
              gh<_i831.CancelDownloadUseCase>(),
              gh<_i316.DeleteDownloadUseCase>(),
            ));
    gh.lazySingleton<_i381.SetInitiativeUseCase>(
        () => _i381.SetInitiativeUseCase(gh<_i55.SessionRepository>()));
    gh.lazySingleton<_i140.CheckSessionUseCase>(
        () => _i140.CheckSessionUseCase(gh<_i55.SessionRepository>()));
    gh.lazySingleton<_i205.CreateSessionUseCase>(
        () => _i205.CreateSessionUseCase(gh<_i55.SessionRepository>()));
    gh.factory<_i5.SsoCubit>(() => _i5.SsoCubit(
          gh<_i421.OlCognitoStorage>(),
          gh<_i490.OauthTokenUseCase>(),
          gh<_i205.CreateSessionUseCase>(),
          gh<_i480.GetUserSelfUseCase>(),
          gh<_i674.GetStoredCorporateIdUseCase>(),
          gh<_i584.GetStoredOpenidConfigUseCase>(),
          gh<_i460.SharedPreferences>(),
          gh<_i1001.Env>(),
        ));
    gh.lazySingleton<_i82.CognitoAuthManager>(() => _i82.CognitoAuthManager(
          gh<_i421.OlCognitoStorage>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
          gh<_i381.SetInitiativeUseCase>(),
          gh<_i1009.SetSecureStoredUserInfoUseCase>(),
          gh<_i205.CreateSessionUseCase>(),
          gh<_i140.CheckSessionUseCase>(),
          gh<_i674.GetStoredCorporateIdUseCase>(),
        ));
    gh.factory<_i1023.PwdResetCubit>(
        () => _i1023.PwdResetCubit(gh<_i82.CognitoAuthManager>()));
    gh.factory<_i617.PwdConfirmCubit>(
        () => _i617.PwdConfirmCubit(gh<_i82.CognitoAuthManager>()));
    gh.singleton<_i1020.AppCubit>(() => _i1020.AppCubit(
          gh<_i82.CognitoAuthManager>(),
          gh<_i456.ClearSecureStoredUseCase>(),
          gh<_i460.SharedPreferences>(),
        ));
    gh.lazySingleton<_i180.AuthenticationInterceptor>(
        () => _i180.AuthenticationInterceptor(
              gh<_i82.CognitoAuthManager>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
              gh<_i1020.AppCubit>(),
              gh<_i361.Dio>(instanceName: 'default'),
            ));
    gh.factory<_i718.MfaCubit>(() => _i718.MfaCubit(
          gh<_i82.CognitoAuthManager>(),
          gh<_i330.HandlerStoredUsernameUseCase>(),
          gh<_i205.CreateSessionUseCase>(),
          gh<_i480.GetUserSelfUseCase>(),
        ));
    gh.factory<_i930.PwdRecoverCubit>(() => _i930.PwdRecoverCubit(
          gh<_i82.CognitoAuthManager>(),
          gh<_i681.GetStoredUsernameUseCase>(),
        ));
    gh.factory<_i810.SettingsCubit>(() => _i810.SettingsCubit(
          gh<_i306.GetStoredSmartConfigurationUseCase>(),
          gh<_i82.CognitoAuthManager>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
          gh<_i350.ClearSecureStoredInitiativeUseCase>(),
          gh<_i480.GetUserSelfUseCase>(),
          gh<_i460.SharedPreferences>(),
          gh<_i1001.Env>(),
        ));
    gh.factory<_i424.CorporateCodeCubit>(() => _i424.CorporateCodeCubit(
          gh<_i1001.Env>(),
          gh<_i1020.SetStoredCorporateIdUseCase>(),
          gh<_i690.GetCorporateIdUseCase>(),
          gh<_i82.CognitoAuthManager>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
          gh<_i140.CheckSessionUseCase>(),
          gh<_i1020.AppCubit>(),
          gh<_i480.GetUserSelfUseCase>(),
          gh<_i205.CreateSessionUseCase>(),
          gh<_i1009.SetSecureStoredUserInfoUseCase>(),
          gh<_i844.GetOpenidConfigUseCase>(),
          gh<_i829.SetStoredOpenidConfigUseCase>(),
          gh<_i456.ClearSecureStoredUseCase>(),
          gh<_i312.GetStoredCorporateIdSsUseCase>(),
          gh<_i224.GetSecureStoredUserInfoSsUseCase>(),
        ));
    gh.factory<_i361.Dio>(
      () => externalModule.dioAuthenticated(
        gh<_i180.AuthenticationInterceptor>(),
        gh<_i528.PrettyDioLogger>(),
        gh<_i1001.Env>(),
      ),
      instanceName: 'authenticated',
    );
    gh.factory<_i935.OnboardingSheetCubit>(() => _i935.OnboardingSheetCubit(
          gh<_i941.SetSkipOnboardingUseCase>(),
          gh<_i623.SetSkipTutorialUseCase>(),
          gh<_i1020.AppCubit>(),
        ));
    gh.lazySingleton<_i939.EcmDataSource>(() =>
        _i618.EcmDataSourceImpl(gh<_i361.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i902.EditionDataSource>(() => _i400.EditionDataSourceImpl(
        gh<_i361.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i216.PageDataSource>(() =>
        _i697.PageDataSourceImpl(gh<_i361.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i896.TopicsDataSource>(() => _i1045.TopicsDataSourceImpl(
        gh<_i361.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i229.SmartConfiguratorDataSource>(() =>
        _i96.SmartConfiguratorDataSourceImpl(
            gh<_i361.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i300.UserImageDataSource>(() =>
        _i1027.UserImageDataSourceImpl(
            gh<_i361.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i439.AppResourceDataSource>(() =>
        _i675.AppResourceDataSourceImpl(
            gh<_i361.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i522.EditionRepository>(
        () => _i814.EditionRepositoryImpl(gh<_i902.EditionDataSource>()));
    gh.lazySingleton<_i1012.StartResumeDataSource>(() =>
        _i1025.StartResumeDataSourceImpl(
            gh<_i361.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i885.SmartLearningDataSource>(() =>
        _i309.SmartLearningDataSourceImpl(
            gh<_i361.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i883.CommunityDataSource>(() =>
        _i876.CommunityDataSourceImpl(
            gh<_i361.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i25.StatementsDataSource>(() =>
        _i182.StatementsDataSourceImpl(
            gh<_i361.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i615.WebPlayerDataSource>(() =>
        _i782.WebPlayerDataSourceImpl(
            gh<_i361.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i520.LearnerProgressDataSource>(() =>
        _i568.LearnerProgressDataSourceImpl(
            gh<_i361.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i625.DownloadIcsDataSource>(() =>
        _i515.DownloadIcsDataSourceImpl(
            gh<_i361.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i637.SearchDataSource>(() => _i182.SearchDataSourceImpl(
        gh<_i361.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i430.RatingDataSource>(() => _i139.RatingDataSourceImpl(
        gh<_i361.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i102.MenuDataSource>(() =>
        _i105.MenuDataSourceImpl(gh<_i361.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i576.StripDataSource>(() => _i123.StripDataSourceImpl(
        gh<_i361.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i417.AutoEnrollmentDataSource>(() =>
        _i878.AutoEnrollmentDataSourceImpl(
            gh<_i361.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i987.WebViewPlayerRepository>(
        () => _i311.WebPlayerRepositoryImpl(gh<_i615.WebPlayerDataSource>()));
    gh.lazySingleton<_i719.PostDataSource>(() =>
        _i888.PostDataSourceImpl(gh<_i361.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i325.EditionRegisterUseCase>(
        () => _i325.EditionRegisterUseCase(
              gh<_i522.EditionRepository>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
              gh<_i674.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i127.LearnerProgressRepository>(() =>
        _i1041.LearnerProgressRepositoryImpl(
            gh<_i520.LearnerProgressDataSource>()));
    gh.lazySingleton<_i923.DetailDataSource>(() => _i400.DetailDataSourceImpl(
        gh<_i361.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i433.StartResumeRepository>(() =>
        _i39.StartResumeRepositoryImpl(gh<_i1012.StartResumeDataSource>()));
    gh.lazySingleton<_i859.MenuRepository>(
        () => _i979.MenuRepositoryImpl(gh<_i102.MenuDataSource>()));
    gh.lazySingleton<_i52.WallRepository>(
        () => _i646.WallRepositoryImpl(gh<_i576.StripDataSource>()));
    gh.lazySingleton<_i508.StripRepository>(
        () => _i351.StripRepositoryImpl(gh<_i576.StripDataSource>()));
    gh.lazySingleton<_i449.GetMenuStructureUseCase>(
        () => _i449.GetMenuStructureUseCase(gh<_i859.MenuRepository>()));
    gh.lazySingleton<_i261.CommunityRepository>(
        () => _i926.CommunityRepositoryImpl(gh<_i883.CommunityDataSource>()));
    gh.lazySingleton<_i267.EcmRepository>(
        () => _i1060.EcmRepositoryImpl(gh<_i939.EcmDataSource>()));
    gh.factory<_i890.EcmRegisterUseCase>(() => _i890.EcmRegisterUseCase(
          gh<_i267.EcmRepository>(),
          gh<_i674.GetStoredCorporateIdUseCase>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i8.AutoEnrollmentRepository>(() =>
        _i839.AutoEnrollmentRepositoryImpl(
            gh<_i417.AutoEnrollmentDataSource>()));
    gh.lazySingleton<_i406.PageRepository>(
        () => _i1004.PageRepositoryImpl(gh<_i216.PageDataSource>()));
    gh.lazySingleton<_i399.UserImageRepository>(
        () => _i350.UserImageRepositoryImpl(gh<_i300.UserImageDataSource>()));
    gh.lazySingleton<_i143.SmartConfiguratorRepository>(
        () => _i307.SmartConfiguratorRepositoryImpl(
              gh<_i229.SmartConfiguratorDataSource>(),
              gh<_i814.LanguageDataSource>(),
            ));
    gh.lazySingleton<_i485.GetProgressGoalsConfigUseCase>(
        () => _i485.GetProgressGoalsConfigUseCase(
              gh<_i127.LearnerProgressRepository>(),
              gh<_i674.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i922.TopicsRepository>(
        () => _i393.TopicsRepositoryImpl(gh<_i896.TopicsDataSource>()));
    gh.lazySingleton<_i801.StartResumeUseCase>(() => _i801.StartResumeUseCase(
          gh<_i433.StartResumeRepository>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
          gh<_i674.GetStoredCorporateIdUseCase>(),
        ));
    gh.lazySingleton<_i1049.GetSmartConfigurationUseCase>(() =>
        _i1049.GetSmartConfigurationUseCase(
            gh<_i143.SmartConfiguratorRepository>()));
    gh.lazySingleton<_i413.GetColorsUseCase>(
        () => _i413.GetColorsUseCase(gh<_i143.SmartConfiguratorRepository>()));
    gh.lazySingleton<_i946.GetLanguagesUseCase>(() =>
        _i946.GetLanguagesUseCase(gh<_i143.SmartConfiguratorRepository>()));
    gh.lazySingleton<_i730.GetLearnerGoalsUseCase>(
        () => _i730.GetLearnerGoalsUseCase(
              gh<_i127.LearnerProgressRepository>(),
              gh<_i674.GetStoredCorporateIdUseCase>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i361.GetLearnerProgressUseCase>(
        () => _i361.GetLearnerProgressUseCase(
              gh<_i127.LearnerProgressRepository>(),
              gh<_i674.GetStoredCorporateIdUseCase>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i964.SmartLearningRepository>(() =>
        _i842.SmartLearningRepositoryImpl(gh<_i885.SmartLearningDataSource>()));
    gh.lazySingleton<_i130.GetAnswersUseCase>(
        () => _i130.GetAnswersUseCase(gh<_i261.CommunityRepository>()));
    gh.lazySingleton<_i493.WebViewPlayerUseCase>(
        () => _i493.WebViewPlayerUseCase(
              gh<_i987.WebViewPlayerRepository>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
              gh<_i674.GetStoredCorporateIdUseCase>(),
              gh<_i306.GetStoredSmartConfigurationUseCase>(),
              gh<_i1001.Env>(),
            ));
    gh.factory<_i402.GetEcmDisciplinesUseCase>(
        () => _i402.GetEcmDisciplinesUseCase(gh<_i267.EcmRepository>()));
    gh.factory<_i1018.GetEcmProfessionsUseCase>(
        () => _i1018.GetEcmProfessionsUseCase(gh<_i267.EcmRepository>()));
    gh.lazySingleton<_i931.GetWallStripContentUseCase>(
        () => _i931.GetWallStripContentUseCase(
              gh<_i52.WallRepository>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
              gh<_i674.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i137.RatingRepository>(
        () => _i85.RatingRepositoryImpl(gh<_i430.RatingDataSource>()));
    gh.lazySingleton<_i828.CreateSmartLearningSlotUseCase>(() =>
        _i828.CreateSmartLearningSlotUseCase(
            gh<_i964.SmartLearningRepository>()));
    gh.lazySingleton<_i321.DeleteSmartLearningSlotUseCase>(() =>
        _i321.DeleteSmartLearningSlotUseCase(
            gh<_i964.SmartLearningRepository>()));
    gh.lazySingleton<_i811.GetSmartLearningSlotsUseCase>(() =>
        _i811.GetSmartLearningSlotsUseCase(
            gh<_i964.SmartLearningRepository>()));
    gh.lazySingleton<_i957.UpdateSmartLearningSlotUseCase>(() =>
        _i957.UpdateSmartLearningSlotUseCase(
            gh<_i964.SmartLearningRepository>()));
    gh.lazySingleton<_i220.GetLabelsUseCase>(() => _i220.GetLabelsUseCase(
          gh<_i143.SmartConfiguratorRepository>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
          gh<_i674.GetStoredCorporateIdUseCase>(),
        ));
    gh.lazySingleton<_i341.WebViewPlayerLinkedinUseCase>(
        () => _i341.WebViewPlayerLinkedinUseCase(
              gh<_i987.WebViewPlayerRepository>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
              gh<_i674.GetStoredCorporateIdUseCase>(),
              gh<_i1001.Env>(),
            ));
    gh.lazySingleton<_i329.AppResourceRepository>(() =>
        _i502.AppResourceRepositoryImpl(gh<_i439.AppResourceDataSource>()));
    gh.lazySingleton<_i669.StatementsRepository>(
        () => _i244.StatementsRepositoryImpl(gh<_i25.StatementsDataSource>()));
    gh.factory<_i469.EcmFirstStepCubit>(() => _i469.EcmFirstStepCubit(
          gh<_i1018.GetEcmProfessionsUseCase>(),
          gh<_i402.GetEcmDisciplinesUseCase>(),
        ));
    gh.factory<_i590.EcmSecondStepCubit>(
        () => _i590.EcmSecondStepCubit(gh<_i890.EcmRegisterUseCase>()));
    gh.lazySingleton<_i26.AutoEnrollmentUseCase>(
        () => _i26.AutoEnrollmentUseCase(
              gh<_i8.AutoEnrollmentRepository>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
              gh<_i674.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i1056.BottomEnrollmentUseCase>(
        () => _i1056.BottomEnrollmentUseCase(
              gh<_i8.AutoEnrollmentRepository>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
              gh<_i674.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i227.StopCommunityTrackingUseCase>(
        () => _i227.StopCommunityTrackingUseCase(
              gh<_i1001.Env>(),
              gh<_i674.GetStoredCorporateIdUseCase>(),
              gh<_i669.StatementsRepository>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i523.StartCommunityTrackingUseCase>(
        () => _i523.StartCommunityTrackingUseCase(
              gh<_i1001.Env>(),
              gh<_i674.GetStoredCorporateIdUseCase>(),
              gh<_i669.StatementsRepository>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i869.GetAppresourceUseCase>(
        () => _i869.GetAppresourceUseCase(gh<_i329.AppResourceRepository>()));
    gh.lazySingleton<_i179.DetailRepository>(
        () => _i155.DetailRepositoryImpl(gh<_i923.DetailDataSource>()));
    gh.lazySingleton<_i252.DownloadIcsRepository>(
        () => _i1004.DownloadIcsRepositoryImpl(
              gh<_i625.DownloadIcsDataSource>(),
              gh<_i674.GetStoredCorporateIdUseCase>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i983.PostRepository>(
        () => _i862.PostRepositoryRepositoryImpl(gh<_i719.PostDataSource>()));
    gh.lazySingleton<_i740.RemoteLabels>(() => _i740.RemoteLabels(
          gh<_i946.GetLanguagesUseCase>(),
          gh<_i220.GetLabelsUseCase>(),
          gh<_i460.SharedPreferences>(),
        ));
    gh.lazySingleton<_i552.GetUserImageUseCase>(
        () => _i552.GetUserImageUseCase(gh<_i399.UserImageRepository>()));
    gh.lazySingleton<_i719.SearchRepository>(
        () => _i1030.SearchRepositoryImpl(gh<_i637.SearchDataSource>()));
    gh.lazySingleton<_i336.GetEventsUseCase>(
        () => _i336.GetEventsUseCase(gh<_i252.DownloadIcsRepository>()));
    gh.lazySingleton<_i1063.DownloadEventsUseCase>(
        () => _i1063.DownloadEventsUseCase(gh<_i252.DownloadIcsRepository>()));
    gh.lazySingleton<_i502.LikePostUseCase>(() => _i502.LikePostUseCase(
          gh<_i261.CommunityRepository>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i294.GetCommunityPostsUseCase>(
        () => _i294.GetCommunityPostsUseCase(
              gh<_i261.CommunityRepository>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i546.GetSharedPostUseCase>(
        () => _i546.GetSharedPostUseCase(
              gh<_i261.CommunityRepository>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i586.AddAnswerUseCase>(() => _i586.AddAnswerUseCase(
          gh<_i261.CommunityRepository>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i125.GetCommentsUseCase>(() => _i125.GetCommentsUseCase(
          gh<_i261.CommunityRepository>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i449.EditCommentUseCase>(() => _i449.EditCommentUseCase(
          gh<_i261.CommunityRepository>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i848.GetCommunityPostUseCase>(
        () => _i848.GetCommunityPostUseCase(
              gh<_i261.CommunityRepository>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i891.UnlikePostUseCase>(() => _i891.UnlikePostUseCase(
          gh<_i261.CommunityRepository>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i437.GetCommunityPostLikesUseCase>(
        () => _i437.GetCommunityPostLikesUseCase(
              gh<_i261.CommunityRepository>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i943.AddCommentUseCase>(() => _i943.AddCommentUseCase(
          gh<_i261.CommunityRepository>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i678.DeleteCommentUseCase>(
        () => _i678.DeleteCommentUseCase(
              gh<_i261.CommunityRepository>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.factory<_i882.ProfilePageCubit>(() => _i882.ProfilePageCubit(
          gh<_i552.GetUserImageUseCase>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
          gh<_i485.GetProgressGoalsConfigUseCase>(),
          gh<_i730.GetLearnerGoalsUseCase>(),
          gh<_i361.GetLearnerProgressUseCase>(),
        ));
    gh.factory<_i715.OlCalendarDialogCubit>(
        () => _i715.OlCalendarDialogCubit(gh<_i336.GetEventsUseCase>()));
    gh.lazySingleton<_i783.GetStandardStripUseCase>(
        () => _i783.GetStandardStripUseCase(
              gh<_i508.StripRepository>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
              gh<_i674.GetStoredCorporateIdUseCase>(),
              gh<_i1037.GetPageSizeStripUseCase>(),
            ));
    gh.lazySingleton<_i427.GetContinueLearningStripUseCase>(
        () => _i427.GetContinueLearningStripUseCase(
              gh<_i508.StripRepository>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
              gh<_i674.GetStoredCorporateIdUseCase>(),
              gh<_i1037.GetPageSizeStripUseCase>(),
            ));
    gh.lazySingleton<_i276.GetCalendarStripUseCase>(
        () => _i276.GetCalendarStripUseCase(
              gh<_i508.StripRepository>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
              gh<_i674.GetStoredCorporateIdUseCase>(),
              gh<_i1037.GetPageSizeStripUseCase>(),
            ));
    gh.lazySingleton<_i471.EditPostUseCase>(() => _i471.EditPostUseCase(
          gh<_i983.PostRepository>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i54.DeletePostUseCase>(() => _i54.DeletePostUseCase(
          gh<_i983.PostRepository>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i144.CreatePostUseCase>(() => _i144.CreatePostUseCase(
          gh<_i983.PostRepository>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i1003.SetStateUseCase>(() => _i1003.SetStateUseCase(
          gh<_i1001.Env>(),
          gh<_i669.StatementsRepository>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
          gh<_i674.GetStoredCorporateIdUseCase>(),
        ));
    gh.lazySingleton<_i615.StatementsUseCase>(() => _i615.StatementsUseCase(
          gh<_i1001.Env>(),
          gh<_i669.StatementsRepository>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
          gh<_i674.GetStoredCorporateIdUseCase>(),
        ));
    gh.lazySingleton<_i740.GetStateUseCase>(() => _i740.GetStateUseCase(
          gh<_i1001.Env>(),
          gh<_i669.StatementsRepository>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
          gh<_i674.GetStoredCorporateIdUseCase>(),
        ));
    gh.factory<_i1027.InitiativesCubit>(() => _i1027.InitiativesCubit(
          gh<_i381.SetInitiativeUseCase>(),
          gh<_i405.SetStoredUserSelfUseCase>(),
          gh<_i1009.SetSecureStoredUserInfoUseCase>(),
          gh<_i449.GetMenuStructureUseCase>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
          gh<_i1049.GetSmartConfigurationUseCase>(),
          gh<_i674.GetStoredCorporateIdUseCase>(),
          gh<_i7.SetStoredSmartConfigurationUseCase>(),
          gh<_i788.CleanLocalDatabaseUseCase>(),
          gh<_i140.CheckSessionUseCase>(),
          gh<_i413.GetColorsUseCase>(),
          gh<_i740.RemoteLabels>(),
          gh<_i869.GetAppresourceUseCase>(),
        ));
    gh.lazySingleton<_i531.GetPageStructureUseCase>(
        () => _i531.GetPageStructureUseCase(
              gh<_i406.PageRepository>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
              gh<_i674.GetStoredCorporateIdUseCase>(),
            ));
    gh.factory<_i913.DynamicContentCubit>(() => _i913.DynamicContentCubit(
          gh<_i531.GetPageStructureUseCase>(),
          gh<_i306.GetStoredSmartConfigurationUseCase>(),
        ));
    gh.factory<_i455.WebViewPageCubit>(() => _i455.WebViewPageCubit(
          gh<_i1001.Env>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
          gh<_i82.CognitoAuthManager>(),
          gh<_i493.WebViewPlayerUseCase>(),
          gh<_i341.WebViewPlayerLinkedinUseCase>(),
        ));
    gh.lazySingleton<_i26.RatingUseCase>(() => _i26.RatingUseCase(
          gh<_i137.RatingRepository>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
          gh<_i674.GetStoredCorporateIdUseCase>(),
        ));
    gh.lazySingleton<_i351.GetTopicsUseCase>(
        () => _i351.GetTopicsUseCase(gh<_i922.TopicsRepository>()));
    gh.factory<_i638.LanguagesCubit>(
        () => _i638.LanguagesCubit(gh<_i740.RemoteLabels>()));
    gh.lazySingleton<_i664.GetSearchResultsUseCase>(
        () => _i664.GetSearchResultsUseCase(
              gh<_i719.SearchRepository>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
              gh<_i674.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i664.ContinueLearningStripCubit>(() =>
        _i664.ContinueLearningStripCubit(
            gh<_i427.GetContinueLearningStripUseCase>()));
    gh.lazySingleton<_i976.FavouritesStripCubit>(
        () => _i976.FavouritesStripCubit(gh<_i783.GetStandardStripUseCase>()));
    gh.lazySingleton<_i409.BestRatingStripCubit>(
        () => _i409.BestRatingStripCubit(gh<_i783.GetStandardStripUseCase>()));
    gh.lazySingleton<_i934.AddFavouritesUseCase>(
        () => _i934.AddFavouritesUseCase(
              gh<_i179.DetailRepository>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
              gh<_i674.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i238.GetRelatedActivitiesUseCase>(
        () => _i238.GetRelatedActivitiesUseCase(
              gh<_i179.DetailRepository>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
              gh<_i674.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i144.GetToolsUseCase>(() => _i144.GetToolsUseCase(
          gh<_i179.DetailRepository>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
          gh<_i674.GetStoredCorporateIdUseCase>(),
        ));
    gh.lazySingleton<_i688.GetSharedPostsUseCase>(
        () => _i688.GetSharedPostsUseCase(
              gh<_i179.DetailRepository>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
              gh<_i674.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i16.GetEditionsUseCase>(() => _i16.GetEditionsUseCase(
          gh<_i179.DetailRepository>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
          gh<_i674.GetStoredCorporateIdUseCase>(),
        ));
    gh.lazySingleton<_i807.GetDetailPageUseCase>(
        () => _i807.GetDetailPageUseCase(
              gh<_i179.DetailRepository>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
              gh<_i674.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i487.RemoveFavouritesUseCase>(
        () => _i487.RemoveFavouritesUseCase(
              gh<_i179.DetailRepository>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
              gh<_i674.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i649.GetToolUrlUseCase>(() => _i649.GetToolUrlUseCase(
          gh<_i179.DetailRepository>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
          gh<_i674.GetStoredCorporateIdUseCase>(),
        ));
    gh.lazySingleton<_i581.GetTeacherDetailUseCase>(
        () => _i581.GetTeacherDetailUseCase(
              gh<_i179.DetailRepository>(),
              gh<_i832.GetSecureStoredUserInfoUseCase>(),
              gh<_i674.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i926.GetRatingUseCase>(() => _i926.GetRatingUseCase(
          gh<_i179.DetailRepository>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
          gh<_i674.GetStoredCorporateIdUseCase>(),
        ));
    gh.factory<_i723.DetailPageCubit>(() => _i723.DetailPageCubit(
          gh<_i807.GetDetailPageUseCase>(),
          gh<_i144.GetToolsUseCase>(),
          gh<_i238.GetRelatedActivitiesUseCase>(),
          gh<_i16.GetEditionsUseCase>(),
          gh<_i688.GetSharedPostsUseCase>(),
          gh<_i26.AutoEnrollmentUseCase>(),
          gh<_i801.StartResumeUseCase>(),
          gh<_i306.GetStoredSmartConfigurationUseCase>(),
          gh<_i325.EditionRegisterUseCase>(),
          gh<_i1056.BottomEnrollmentUseCase>(),
          gh<_i664.ContinueLearningStripCubit>(),
          gh<_i54.DeletePostUseCase>(),
          gh<_i25.GetStoredDownloadContentInfoUseCase>(),
          gh<_i989.StoreDownloadContentInfoUseCase>(),
        ));
    gh.factory<_i192.OlDownloadDialogCubit>(
        () => _i192.OlDownloadDialogCubit(gh<_i1063.DownloadEventsUseCase>()));
    gh.factory<_i120.CalendarStripCubit>(
        () => _i120.CalendarStripCubit(gh<_i276.GetCalendarStripUseCase>()));
    gh.factory<_i581.CalendarMonthStripCubit>(() =>
        _i581.CalendarMonthStripCubit(gh<_i276.GetCalendarStripUseCase>()));
    gh.factory<_i675.SmartLearningBottomSheetCubit>(
        () => _i675.SmartLearningBottomSheetCubit(
              gh<_i811.GetSmartLearningSlotsUseCase>(),
              gh<_i828.CreateSmartLearningSlotUseCase>(),
              gh<_i957.UpdateSmartLearningSlotUseCase>(),
              gh<_i321.DeleteSmartLearningSlotUseCase>(),
              gh<_i276.GetCalendarStripUseCase>(),
            ));
    gh.lazySingleton<_i1003.GetSuggestionsUseCase>(
        () => _i1003.GetSuggestionsUseCase(gh<_i719.SearchRepository>()));
    gh.factory<_i173.LoginCubit>(() => _i173.LoginCubit(
          gh<_i82.CognitoAuthManager>(),
          gh<_i681.GetStoredUsernameUseCase>(),
          gh<_i330.HandlerStoredUsernameUseCase>(),
          gh<_i205.CreateSessionUseCase>(),
          gh<_i480.GetUserSelfUseCase>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
          gh<_i140.CheckSessionUseCase>(),
          gh<_i1009.SetSecureStoredUserInfoUseCase>(),
          gh<_i674.GetStoredCorporateIdUseCase>(),
          gh<_i1020.AppCubit>(),
          gh<_i460.SharedPreferences>(),
          gh<_i740.RemoteLabels>(),
        ));
    gh.factory<_i450.StandardStripCubit>(
        () => _i450.StandardStripCubit(gh<_i783.GetStandardStripUseCase>()));
    gh.factory<_i389.LogoHeaderCubit>(() => _i389.LogoHeaderCubit(
          gh<_i552.GetUserImageUseCase>(),
          gh<_i832.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.factory<_i131.SearchCubit>(() => _i131.SearchCubit(
          gh<_i664.GetSearchResultsUseCase>(),
          gh<_i1003.GetSuggestionsUseCase>(),
        ));
    gh.factory<_i735.UserAvatarCubit>(
        () => _i735.UserAvatarCubit(gh<_i552.GetUserImageUseCase>()));
    gh.factory<_i493.RatingsDialogCubit>(
        () => _i493.RatingsDialogCubit(gh<_i26.RatingUseCase>()));
    gh.factory<_i692.DynamicAllContentCubit>(() => _i692.DynamicAllContentCubit(
          gh<_i531.GetPageStructureUseCase>(),
          gh<_i306.GetStoredSmartConfigurationUseCase>(),
          gh<_i783.GetStandardStripUseCase>(),
        ));
    gh.factory<_i110.FavoritesContentCubit>(() => _i110.FavoritesContentCubit(
          gh<_i531.GetPageStructureUseCase>(),
          gh<_i306.GetStoredSmartConfigurationUseCase>(),
          gh<_i783.GetStandardStripUseCase>(),
        ));
    gh.factory<_i393.TeacherDetailSheetCubit>(() =>
        _i393.TeacherDetailSheetCubit(gh<_i581.GetTeacherDetailUseCase>()));
    gh.factory<_i544.VideoPlayerCubit>(() => _i544.VideoPlayerCubit(
          gh<_i615.StatementsUseCase>(),
          gh<_i1003.SetStateUseCase>(),
          gh<_i740.GetStateUseCase>(),
          gh<_i121.RetrieveDownloadInfoUseCase>(),
          gh<_i664.ContinueLearningStripCubit>(),
          gh<_i25.GetStoredDownloadContentInfoUseCase>(),
          gh<_i989.StoreDownloadContentInfoUseCase>(),
        ));
    gh.factory<_i102.RatingCubit>(() => _i102.RatingCubit(
          gh<_i926.GetRatingUseCase>(),
          gh<_i306.GetStoredSmartConfigurationUseCase>(),
        ));
    gh.factory<_i531.WallCubit>(() => _i531.WallCubit(
          gh<_i931.GetWallStripContentUseCase>(),
          gh<_i487.RemoveFavouritesUseCase>(),
          gh<_i976.FavouritesStripCubit>(),
        ));
    gh.factory<_i919.FavouriteCubit>(() => _i919.FavouriteCubit(
          gh<_i934.AddFavouritesUseCase>(),
          gh<_i487.RemoveFavouritesUseCase>(),
          gh<_i976.FavouritesStripCubit>(),
        ));
    gh.factory<_i872.TopicsFilterCubit>(
        () => _i872.TopicsFilterCubit(gh<_i351.GetTopicsUseCase>()));
    gh.factory<_i269.ToolItemCubit>(
        () => _i269.ToolItemCubit(gh<_i649.GetToolUrlUseCase>()));
    return this;
  }
}

class _$ExternalModule extends _i495.ExternalModule {}
