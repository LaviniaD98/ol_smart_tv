// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i28;
import 'package:drift/drift.dart' as _i12;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:open_learning_smart_tv/core/database/app_database.dart' as _i23;
import 'package:open_learning_smart_tv/core/database/tables/local_notifications/local_notifications_dao.dart'
    as _i45;
import 'package:open_learning_smart_tv/core/database/tables/offline_player_tracking/offline_statements_dao.dart'
    as _i46;
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart'
    as _i308;
import 'package:open_learning_smart_tv/core/env/env.dart' as _i6;
import 'package:open_learning_smart_tv/core/web_client_config/web_client_config.dart'
    as _i102;
import 'package:open_learning_smart_tv/data/data_sources/assets/app_resource_data_source.dart'
    as _i192;
import 'package:open_learning_smart_tv/data/data_sources/assets/app_resource_data_source_impl.dart'
    as _i193;
import 'package:open_learning_smart_tv/data/data_sources/auto_enrollment/auto_enrollment_data_source.dart'
    as _i196;
import 'package:open_learning_smart_tv/data/data_sources/auto_enrollment/auto_enrollment_data_source_impl.dart'
    as _i197;
import 'package:open_learning_smart_tv/data/data_sources/community/community_data_source.dart'
    as _i202;
import 'package:open_learning_smart_tv/data/data_sources/community/community_data_source_impl.dart'
    as _i203;
import 'package:open_learning_smart_tv/data/data_sources/corporate_code/corporate_code_data_source.dart'
    as _i78;
import 'package:open_learning_smart_tv/data/data_sources/corporate_code/corporate_code_data_source_impl.dart'
    as _i79;
import 'package:open_learning_smart_tv/data/data_sources/detail/detail_data_source.dart'
    as _i211;
import 'package:open_learning_smart_tv/data/data_sources/detail/detail_data_source_impl.dart'
    as _i212;
import 'package:open_learning_smart_tv/data/data_sources/download/download_data_source.dart'
    as _i29;
import 'package:open_learning_smart_tv/data/data_sources/download/download_data_source_impl.dart'
    as _i30;
import 'package:open_learning_smart_tv/data/data_sources/download_ics/download_ics_data_source.dart'
    as _i104;
import 'package:open_learning_smart_tv/data/data_sources/download_ics/download_ics_data_source_impl.dart'
    as _i105;
import 'package:open_learning_smart_tv/data/data_sources/ecm/ecm_data_source.dart'
    as _i108;
import 'package:open_learning_smart_tv/data/data_sources/ecm/ecm_data_source_impl.dart'
    as _i109;
import 'package:open_learning_smart_tv/data/data_sources/edition/edition_data_source.dart'
    as _i112;
import 'package:open_learning_smart_tv/data/data_sources/edition/edition_data_source_impl.dart'
    as _i113;
import 'package:open_learning_smart_tv/data/data_sources/language/language_data_source.dart'
    as _i43;
import 'package:open_learning_smart_tv/data/data_sources/language/language_data_source_impl.dart'
    as _i44;
import 'package:open_learning_smart_tv/data/data_sources/menu/menu_data_source.dart'
    as _i123;
import 'package:open_learning_smart_tv/data/data_sources/menu/menu_data_source_impl.dart'
    as _i124;
import 'package:open_learning_smart_tv/data/data_sources/notification/notification_data_source.dart'
    as _i127;
import 'package:open_learning_smart_tv/data/data_sources/notification/notification_data_source_impl.dart'
    as _i128;
import 'package:open_learning_smart_tv/data/data_sources/openid_config/openid_config_data_source.dart'
    as _i49;
import 'package:open_learning_smart_tv/data/data_sources/openid_config/openid_config_data_source_impl.dart'
    as _i50;
import 'package:open_learning_smart_tv/data/data_sources/page/page_data_source.dart'
    as _i134;
import 'package:open_learning_smart_tv/data/data_sources/page/page_data_source_impl.dart'
    as _i135;
import 'package:open_learning_smart_tv/data/data_sources/post/post_data_source.dart'
    as _i138;
import 'package:open_learning_smart_tv/data/data_sources/post/post_data_source_impl.dart'
    as _i139;
import 'package:open_learning_smart_tv/data/data_sources/progress/learner_progress_data_source.dart'
    as _i119;
import 'package:open_learning_smart_tv/data/data_sources/progress/learner_progress_data_source_impl.dart'
    as _i120;
import 'package:open_learning_smart_tv/data/data_sources/rating/rating_data_source.dart'
    as _i142;
import 'package:open_learning_smart_tv/data/data_sources/rating/rating_data_source_impl.dart'
    as _i143;
import 'package:open_learning_smart_tv/data/data_sources/search/search_data_source.dart'
    as _i148;
import 'package:open_learning_smart_tv/data/data_sources/search/search_data_source_impl.dart'
    as _i149;
import 'package:open_learning_smart_tv/data/data_sources/session/session_data_source.dart'
    as _i56;
import 'package:open_learning_smart_tv/data/data_sources/session/session_data_source_impl.dart'
    as _i57;
import 'package:open_learning_smart_tv/data/data_sources/smart_configurator/smart_configurator_data_source.dart'
    as _i153;
import 'package:open_learning_smart_tv/data/data_sources/smart_configurator/smart_configurator_data_source_impl.dart'
    as _i154;
import 'package:open_learning_smart_tv/data/data_sources/smart_learning/smart_learning_data_source.dart'
    as _i157;
import 'package:open_learning_smart_tv/data/data_sources/smart_learning/smart_learning_data_source_impl.dart'
    as _i158;
import 'package:open_learning_smart_tv/data/data_sources/start_resume/start_resume_data_source.dart'
    as _i161;
import 'package:open_learning_smart_tv/data/data_sources/start_resume/start_resume_data_source_impl.dart'
    as _i162;
import 'package:open_learning_smart_tv/data/data_sources/statements/statements_data_source.dart'
    as _i166;
import 'package:open_learning_smart_tv/data/data_sources/statements/statements_data_source_impl.dart'
    as _i167;
import 'package:open_learning_smart_tv/data/data_sources/strip/strip_data_source.dart'
    as _i172;
import 'package:open_learning_smart_tv/data/data_sources/strip/strip_data_source_impl.dart'
    as _i173;
import 'package:open_learning_smart_tv/data/data_sources/topic/topics_data_source.dart'
    as _i176;
import 'package:open_learning_smart_tv/data/data_sources/topic/topics_data_source_impl.dart'
    as _i177;
import 'package:open_learning_smart_tv/data/data_sources/user/auth_data_source.dart'
    as _i72;
import 'package:open_learning_smart_tv/data/data_sources/user/auth_data_source_impl.dart'
    as _i73;
import 'package:open_learning_smart_tv/data/data_sources/user/user_data_source.dart'
    as _i67;
import 'package:open_learning_smart_tv/data/data_sources/user/user_data_source_impl.dart'
    as _i68;
import 'package:open_learning_smart_tv/data/data_sources/user_image/user_image_data_source.dart'
    as _i181;
import 'package:open_learning_smart_tv/data/data_sources/user_image/user_image_data_source_impl.dart'
    as _i182;
import 'package:open_learning_smart_tv/data/data_sources/web_player/web_player_data_source.dart'
    as _i187;
import 'package:open_learning_smart_tv/data/data_sources/web_player/web_player_data_source_impl.dart'
    as _i188;
import 'package:open_learning_smart_tv/data/repositories/assets/app_resource_repository_impl.dart'
    as _i195;
import 'package:open_learning_smart_tv/data/repositories/auto_enrollment/auto_enrollment_repository_impl.dart'
    as _i199;
import 'package:open_learning_smart_tv/data/repositories/community/community_repository_impl.dart'
    as _i205;
import 'package:open_learning_smart_tv/data/repositories/corporate_code/corporate_code_repository_impl.dart'
    as _i81;
import 'package:open_learning_smart_tv/data/repositories/detail/detail_repository_impl.dart'
    as _i214;
import 'package:open_learning_smart_tv/data/repositories/download/download_repository_impl.dart'
    as _i32;
import 'package:open_learning_smart_tv/data/repositories/download_ics/download_ics_repository_impl.dart'
    as _i107;
import 'package:open_learning_smart_tv/data/repositories/ecm/ecm_repository_impl.dart'
    as _i111;
import 'package:open_learning_smart_tv/data/repositories/edition/edition_repository_impl.dart'
    as _i115;
import 'package:open_learning_smart_tv/data/repositories/menu/menu_repository_impl.dart'
    as _i126;
import 'package:open_learning_smart_tv/data/repositories/notification/notification_repository_impl.dart'
    as _i130;
import 'package:open_learning_smart_tv/data/repositories/openid_config/openid_config_repository_impl.dart'
    as _i52;
import 'package:open_learning_smart_tv/data/repositories/page/page_repository_impl.dart'
    as _i137;
import 'package:open_learning_smart_tv/data/repositories/post/post_repository_impl.dart'
    as _i141;
import 'package:open_learning_smart_tv/data/repositories/progress/learner_progress_repository_impl.dart'
    as _i122;
import 'package:open_learning_smart_tv/data/repositories/rating/rating_repository_impl.dart'
    as _i145;
import 'package:open_learning_smart_tv/data/repositories/search/search_repository_impl.dart'
    as _i151;
import 'package:open_learning_smart_tv/data/repositories/session/session_repository_impl.dart'
    as _i59;
import 'package:open_learning_smart_tv/data/repositories/smart_configurator/smart_configurator_repository_impl.dart'
    as _i156;
import 'package:open_learning_smart_tv/data/repositories/smart_learning/smart_learning_repository_impl.dart'
    as _i160;
import 'package:open_learning_smart_tv/data/repositories/start_resume/start_resume_repository_impl.dart'
    as _i164;
import 'package:open_learning_smart_tv/data/repositories/statements/statements_repository_impl.dart'
    as _i169;
import 'package:open_learning_smart_tv/data/repositories/strip/strip_repository_impl.dart'
    as _i175;
import 'package:open_learning_smart_tv/data/repositories/topics/topics_repository_impl.dart'
    as _i179;
import 'package:open_learning_smart_tv/data/repositories/user/auth_repository_impl.dart'
    as _i75;
import 'package:open_learning_smart_tv/data/repositories/user/user_repository_impl.dart'
    as _i70;
import 'package:open_learning_smart_tv/data/repositories/user_image/user_image_repository_impl.dart'
    as _i184;
import 'package:open_learning_smart_tv/data/repositories/wall/wall_repository_impl.dart'
    as _i186;
import 'package:open_learning_smart_tv/data/repositories/web_player/web_player_repository_impl.dart'
    as _i190;
import 'package:open_learning_smart_tv/domain/repositories/assets/app_resource_repository.dart'
    as _i194;
import 'package:open_learning_smart_tv/domain/repositories/auto_enrollment/auto_enrollment_repository.dart'
    as _i198;
import 'package:open_learning_smart_tv/domain/repositories/community/community_repository.dart'
    as _i204;
import 'package:open_learning_smart_tv/domain/repositories/corporate_code/corporate_code_repository.dart'
    as _i80;
import 'package:open_learning_smart_tv/domain/repositories/detail/detail_repository.dart'
    as _i213;
import 'package:open_learning_smart_tv/domain/repositories/download/download_repository.dart'
    as _i31;
import 'package:open_learning_smart_tv/domain/repositories/download_ics/download_ics_repository.dart'
    as _i106;
import 'package:open_learning_smart_tv/domain/repositories/ecm/ecm_repository.dart'
    as _i110;
import 'package:open_learning_smart_tv/domain/repositories/edition/edition_repository.dart'
    as _i114;
import 'package:open_learning_smart_tv/domain/repositories/menu/menu_repository.dart'
    as _i125;
import 'package:open_learning_smart_tv/domain/repositories/notification/notification_repository.dart'
    as _i129;
import 'package:open_learning_smart_tv/domain/repositories/openid_config/openid_config_repository.dart'
    as _i51;
import 'package:open_learning_smart_tv/domain/repositories/page/page_repository.dart'
    as _i136;
import 'package:open_learning_smart_tv/domain/repositories/post/post_repository.dart'
    as _i140;
import 'package:open_learning_smart_tv/domain/repositories/progress/learner_progress_repository.dart'
    as _i121;
import 'package:open_learning_smart_tv/domain/repositories/rating/rating_repository.dart'
    as _i144;
import 'package:open_learning_smart_tv/domain/repositories/search/search_repository.dart'
    as _i150;
import 'package:open_learning_smart_tv/domain/repositories/session/session_repository.dart'
    as _i58;
import 'package:open_learning_smart_tv/domain/repositories/smart_configurator/smart_configurator_repository.dart'
    as _i155;
import 'package:open_learning_smart_tv/domain/repositories/smart_learning/smart_learning_repository.dart'
    as _i159;
import 'package:open_learning_smart_tv/domain/repositories/start_resume/start_resume_repository.dart'
    as _i163;
import 'package:open_learning_smart_tv/domain/repositories/statements/statements_repository.dart'
    as _i168;
import 'package:open_learning_smart_tv/domain/repositories/strip/strip_repository.dart'
    as _i174;
import 'package:open_learning_smart_tv/domain/repositories/topics/topics_repository.dart'
    as _i178;
import 'package:open_learning_smart_tv/domain/repositories/user/auth_repository.dart'
    as _i74;
import 'package:open_learning_smart_tv/domain/repositories/user/user_repository.dart'
    as _i69;
import 'package:open_learning_smart_tv/domain/repositories/user_image/user_image_repository.dart'
    as _i183;
import 'package:open_learning_smart_tv/domain/repositories/wall/wall_repository.dart'
    as _i185;
import 'package:open_learning_smart_tv/domain/repositories/web_view_player/web_view_player_repository.dart'
    as _i189;
import 'package:open_learning_smart_tv/domain/use_cases/assets/get_app_resource_use_case.dart'
    as _i223;
import 'package:open_learning_smart_tv/domain/use_cases/auto_enrollment/auto_enrollment_use_case.dart'
    as _i200;
import 'package:open_learning_smart_tv/domain/use_cases/auto_enrollment/bottom_enrollment_use_case.dart'
    as _i201;
import 'package:open_learning_smart_tv/domain/use_cases/clean_local_datatbase_use_case.dart'
    as _i93;
import 'package:open_learning_smart_tv/domain/use_cases/clear_secure_stored_info_use_case.dart'
    as _i25;
import 'package:open_learning_smart_tv/domain/use_cases/clear_secure_stored_use_case.dart'
    as _i26;
import 'package:open_learning_smart_tv/domain/use_cases/community/add_answer_use_case.dart'
    as _i280;
import 'package:open_learning_smart_tv/domain/use_cases/community/add_comment_use_case.dart'
    as _i281;
import 'package:open_learning_smart_tv/domain/use_cases/community/delete_comment_use_case.dart'
    as _i208;
import 'package:open_learning_smart_tv/domain/use_cases/community/edit_comment_use_case.dart'
    as _i219;
import 'package:open_learning_smart_tv/domain/use_cases/community/get_answers_use_case.dart'
    as _i222;
import 'package:open_learning_smart_tv/domain/use_cases/community/get_comments_use_case.dart'
    as _i226;
import 'package:open_learning_smart_tv/domain/use_cases/community/get_community_post_likes_use_case.dart'
    as _i227;
import 'package:open_learning_smart_tv/domain/use_cases/community/get_community_post_use_case.dart'
    as _i228;
import 'package:open_learning_smart_tv/domain/use_cases/community/get_community_posts_use_case.dart'
    as _i229;
import 'package:open_learning_smart_tv/domain/use_cases/community/get_shared_post_use_case.dart'
    as _i244;
import 'package:open_learning_smart_tv/domain/use_cases/community/like_post_use_case.dart'
    as _i257;
import 'package:open_learning_smart_tv/domain/use_cases/community/start_community_tracking_use_case.dart'
    as _i272;
import 'package:open_learning_smart_tv/domain/use_cases/community/stop_community_tracking_use_case.dart'
    as _i171;
import 'package:open_learning_smart_tv/domain/use_cases/community/unlike_post_use_case.dart'
    as _i277;
import 'package:open_learning_smart_tv/domain/use_cases/detail/add_favourites_use_case.dart'
    as _i282;
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_detail_page_use_case.dart'
    as _i231;
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_editions_use_case.dart'
    as _i232;
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_rating_use_case.dart'
    as _i241;
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_related_activities_use_case.dart'
    as _i242;
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_shared_posts_use_case.dart'
    as _i245;
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_teacher_detail_use_case.dart'
    as _i251;
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_tool_url_use_case.dart'
    as _i252;
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_tools_use_case.dart'
    as _i253;
import 'package:open_learning_smart_tv/domain/use_cases/detail/remove_favourite_use_case.dart'
    as _i267;
import 'package:open_learning_smart_tv/domain/use_cases/download/cancel_download_use_case.dart'
    as _i76;
import 'package:open_learning_smart_tv/domain/use_cases/download/delete_download_use_case.dart'
    as _i83;
import 'package:open_learning_smart_tv/domain/use_cases/download/get_stored_download_content_info_use_case.dart'
    as _i38;
import 'package:open_learning_smart_tv/domain/use_cases/download/query_download_manager_use_case.dart'
    as _i16;
import 'package:open_learning_smart_tv/domain/use_cases/download/remove_stored_download_content_info_use_case.dart'
    as _i53;
import 'package:open_learning_smart_tv/domain/use_cases/download/retrieve_download_info_use_case.dart'
    as _i54;
import 'package:open_learning_smart_tv/domain/use_cases/download/schedule_download_use_case.dart'
    as _i55;
import 'package:open_learning_smart_tv/domain/use_cases/download/store_download_content_info_use_case.dart'
    as _i22;
import 'package:open_learning_smart_tv/domain/use_cases/download_ics/download_events_use_case.dart'
    as _i215;
import 'package:open_learning_smart_tv/domain/use_cases/download_ics/get_events_use_case.dart'
    as _i118;
import 'package:open_learning_smart_tv/domain/use_cases/ecm/ecm_register_use_case.dart'
    as _i217;
import 'package:open_learning_smart_tv/domain/use_cases/ecm/get_ecm_disciplines_use_case.dart'
    as _i116;
import 'package:open_learning_smart_tv/domain/use_cases/ecm/get_ecm_professions_use_case.dart'
    as _i117;
import 'package:open_learning_smart_tv/domain/use_cases/edition/edition_register_use_case.dart'
    as _i221;
import 'package:open_learning_smart_tv/domain/use_cases/get_corporate_id_use_case.dart'
    as _i86;
import 'package:open_learning_smart_tv/domain/use_cases/get_menu_structure_use_case.dart'
    as _i237;
import 'package:open_learning_smart_tv/domain/use_cases/get_page_size_strip_use_case.dart'
    as _i8;
import 'package:open_learning_smart_tv/domain/use_cases/get_secure_stored_user_info_ss_use_case.dart'
    as _i34;
import 'package:open_learning_smart_tv/domain/use_cases/get_secure_stored_user_info_use_case.dart'
    as _i9;
import 'package:open_learning_smart_tv/domain/use_cases/get_skip_onboarding_use_case.dart'
    as _i35;
import 'package:open_learning_smart_tv/domain/use_cases/get_skip_tutorial_use_case.dart'
    as _i36;
import 'package:open_learning_smart_tv/domain/use_cases/get_stored_user_self_use_case.dart'
    as _i40;
import 'package:open_learning_smart_tv/domain/use_cases/get_stored_username_use_case.dart'
    as _i41;
import 'package:open_learning_smart_tv/domain/use_cases/get_user_self.dart'
    as _i89;
import 'package:open_learning_smart_tv/domain/use_cases/handler_stored_username_use_case.dart'
    as _i42;
import 'package:open_learning_smart_tv/domain/use_cases/notification/get_notifications_use_case.dart'
    as _i238;
import 'package:open_learning_smart_tv/domain/use_cases/notification/notification_use_case.dart'
    as _i131;
import 'package:open_learning_smart_tv/domain/use_cases/notification/set_notification_read_use_case.dart'
    as _i152;
import 'package:open_learning_smart_tv/domain/use_cases/oauth_token_use_case.dart'
    as _i90;
import 'package:open_learning_smart_tv/domain/use_cases/offline/delete_statement_use_case.dart'
    as _i84;
import 'package:open_learning_smart_tv/domain/use_cases/offline/get_statements_use_case.dart'
    as _i88;
import 'package:open_learning_smart_tv/domain/use_cases/offline/store_statement_use_case.dart'
    as _i66;
import 'package:open_learning_smart_tv/domain/use_cases/openid_config/get_openid_config_use_case.dart'
    as _i87;
import 'package:open_learning_smart_tv/domain/use_cases/openid_config/get_stored_openid_config_use_case.dart'
    as _i39;
import 'package:open_learning_smart_tv/domain/use_cases/openid_config/set_stored_openid_config_use_case.dart'
    as _i18;
import 'package:open_learning_smart_tv/domain/use_cases/page/get_page_structure_use_case.dart'
    as _i239;
import 'package:open_learning_smart_tv/domain/use_cases/post/create_post_use_case.dart'
    as _i206;
import 'package:open_learning_smart_tv/domain/use_cases/post/delete_post_use_case.dart'
    as _i209;
import 'package:open_learning_smart_tv/domain/use_cases/post/edit_post_use_case.dart'
    as _i220;
import 'package:open_learning_smart_tv/domain/use_cases/progress/get_learner_goals_use_case.dart'
    as _i235;
import 'package:open_learning_smart_tv/domain/use_cases/progress/get_learner_progress_use_case.dart'
    as _i236;
import 'package:open_learning_smart_tv/domain/use_cases/progress/get_progress_goals_config_use_case.dart'
    as _i240;
import 'package:open_learning_smart_tv/domain/use_cases/rating/rating_use_case.dart'
    as _i146;
import 'package:open_learning_smart_tv/domain/use_cases/search/clean_local_suggestions_use_case.dart'
    as _i24;
import 'package:open_learning_smart_tv/domain/use_cases/search/get_local_suggestions_use_case.dart'
    as _i33;
import 'package:open_learning_smart_tv/domain/use_cases/search/get_search_results_use_case.dart'
    as _i243;
import 'package:open_learning_smart_tv/domain/use_cases/search/get_suggestions_use_case.dart'
    as _i250;
import 'package:open_learning_smart_tv/domain/use_cases/search/set_local_suggestions_use_case.dart'
    as _i61;
import 'package:open_learning_smart_tv/domain/use_cases/self/set_privacyconsent_use_case.dart'
    as _i91;
import 'package:open_learning_smart_tv/domain/use_cases/session/check_session_use_case.dart'
    as _i77;
import 'package:open_learning_smart_tv/domain/use_cases/session/create_session_use_case.dart'
    as _i82;
import 'package:open_learning_smart_tv/domain/use_cases/session/get_stored_corporate_id_ss_use_case.dart'
    as _i37;
import 'package:open_learning_smart_tv/domain/use_cases/session/get_stored_corporate_id_use_case.dart'
    as _i10;
import 'package:open_learning_smart_tv/domain/use_cases/session/set_initiative_use_case.dart'
    as _i60;
import 'package:open_learning_smart_tv/domain/use_cases/set_secure_stored_user_info_use_case.dart'
    as _i62;
import 'package:open_learning_smart_tv/domain/use_cases/set_skip_onboarding_use_case.dart'
    as _i63;
import 'package:open_learning_smart_tv/domain/use_cases/set_skip_tutorial_use_case.dart'
    as _i64;
import 'package:open_learning_smart_tv/domain/use_cases/set_stored_corporate_id_use_case.dart'
    as _i17;
import 'package:open_learning_smart_tv/domain/use_cases/set_stored_user_self_use_case.dart'
    as _i20;
import 'package:open_learning_smart_tv/domain/use_cases/smart_configurator/get_colors_use_case.dart'
    as _i225;
import 'package:open_learning_smart_tv/domain/use_cases/smart_configurator/get_labels_use_case.dart'
    as _i233;
import 'package:open_learning_smart_tv/domain/use_cases/smart_configurator/get_languages_use_case.dart'
    as _i234;
import 'package:open_learning_smart_tv/domain/use_cases/smart_configurator/get_smart_configuration_use_case.dart'
    as _i246;
import 'package:open_learning_smart_tv/domain/use_cases/smart_configurator/get_stored_smart_configuration_use_case.dart'
    as _i11;
import 'package:open_learning_smart_tv/domain/use_cases/smart_configurator/set_stored_smart_configuration_use_case.dart'
    as _i19;
import 'package:open_learning_smart_tv/domain/use_cases/smart_learning/create_smart_learning_slot_use_case.dart'
    as _i207;
import 'package:open_learning_smart_tv/domain/use_cases/smart_learning/delete_smart_learning_slot_use_case.dart'
    as _i210;
import 'package:open_learning_smart_tv/domain/use_cases/smart_learning/get_smart_learning_slots_use_case.dart'
    as _i247;
import 'package:open_learning_smart_tv/domain/use_cases/smart_learning/update_smart_learning_slot_use_case.dart'
    as _i180;
import 'package:open_learning_smart_tv/domain/use_cases/start_resume_use_case/start_resume_use_case.dart'
    as _i165;
import 'package:open_learning_smart_tv/domain/use_cases/statements/get_state_use_case.dart'
    as _i249;
import 'package:open_learning_smart_tv/domain/use_cases/statements/set_state_use_case.dart'
    as _i269;
import 'package:open_learning_smart_tv/domain/use_cases/statements/statements_use_case.dart'
    as _i170;
import 'package:open_learning_smart_tv/domain/use_cases/strip/get_calendar_strip_use_case.dart'
    as _i224;
import 'package:open_learning_smart_tv/domain/use_cases/strip/get_continue_learning_strip_use_case.dart'
    as _i230;
import 'package:open_learning_smart_tv/domain/use_cases/strip/get_standard_strip_use_case.dart'
    as _i248;
import 'package:open_learning_smart_tv/domain/use_cases/strip/get_wall_strip_content_use_case.dart'
    as _i256;
import 'package:open_learning_smart_tv/domain/use_cases/topics/get_topics_use_case.dart'
    as _i254;
import 'package:open_learning_smart_tv/domain/use_cases/user_profile_image/get_user_image_use_case.dart'
    as _i255;
import 'package:open_learning_smart_tv/domain/use_cases/webview/web_view_player_linkedin_use_case.dart'
    as _i279;
import 'package:open_learning_smart_tv/domain/use_cases/webview/web_view_player_use_case.dart'
    as _i191;
import 'package:open_learning_smart_tv/presentation/app_state/cubit/app_cubit.dart'
    as _i101;
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/download/cubit/local_card_cubit.dart'
    as _i258;
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/download/download_card_status/cubit/local_card_status_cubit.dart'
    as _i259;
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/calendar/cubit/ol_calendar_dialog_cubit.dart'
    as _i132;
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/cubit/ol_download_dialog_cubit.dart'
    as _i263;
import 'package:open_learning_smart_tv/presentation/common/widgets/logo_app_header/cubit/app_logo_cubit.dart'
    as _i4;
import 'package:open_learning_smart_tv/presentation/common/widgets/logo_app_header/logo_header_cubit.dart'
    as _i260;
import 'package:open_learning_smart_tv/presentation/common/widgets/rating/ratings_dialog_cubit.dart'
    as _i147;
import 'package:open_learning_smart_tv/presentation/common/widgets/smart_learning_bottom_sheet/cubit/smart_learning_bottom_sheet_cubit.dart'
    as _i270;
import 'package:open_learning_smart_tv/presentation/common/widgets/topics_filter/cubit/topics_filter_cubit.dart'
    as _i275;
import 'package:open_learning_smart_tv/presentation/common/widgets/user_avatar/cubit/user_avatar_cubit.dart'
    as _i278;
import 'package:open_learning_smart_tv/presentation/community_webview/cubit/community_web_view_page_cubit.dart'
    as _i27;
import 'package:open_learning_smart_tv/presentation/corporate_code/cubit/corporate_code_cubit.dart'
    as _i103;
import 'package:open_learning_smart_tv/presentation/course_detail/cubit/detail_page_cubit.dart'
    as _i288;
import 'package:open_learning_smart_tv/presentation/course_detail/ecm/registration/cubit/ecm_registration_cubit.dart'
    as _i5;
import 'package:open_learning_smart_tv/presentation/course_detail/ecm/registration/steps/first_step/cubit/ecm_first_step_cubit.dart'
    as _i216;
import 'package:open_learning_smart_tv/presentation/course_detail/ecm/registration/steps/second_step/cubit/ecm_second_step_cubit.dart'
    as _i218;
import 'package:open_learning_smart_tv/presentation/course_detail/editions/edition_cubit.dart'
    as _i290;
import 'package:open_learning_smart_tv/presentation/course_detail/favorites/cubit/favourite_cubit.dart'
    as _i307;
import 'package:open_learning_smart_tv/presentation/course_detail/rating/rating_cubit.dart'
    as _i265;
import 'package:open_learning_smart_tv/presentation/course_detail/widgets/download_button/cubit/download_item_cubit.dart'
    as _i289;
import 'package:open_learning_smart_tv/presentation/course_detail/widgets/teachers_sheet/cubit/teacher_detail_sheet_cubit.dart'
    as _i273;
import 'package:open_learning_smart_tv/presentation/course_detail/widgets/tools/tool_item/cubit/tool_item_cubit.dart'
    as _i274;
import 'package:open_learning_smart_tv/presentation/dynamic_content/cubit/dynamic_content_cubit.dart'
    as _i306;
import 'package:open_learning_smart_tv/presentation/dynamic_content/onboarding/cubit/onboarding_manager_cubit.dart'
    as _i48;
import 'package:open_learning_smart_tv/presentation/dynamic_content/onboarding/cubit/onboarding_sheet_cubit.dart'
    as _i133;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/calendar/cubit/calendar_strip_cubit.dart'
    as _i284;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/comments/cubit/comments_cubit.dart'
    as _i285;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/comments/item/answers/cubit/answers_cubit.dart'
    as _i283;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/cubit/community_wall_cubit.dart'
    as _i286;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/detail/cubit/post_detail_cubit.dart'
    as _i298;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/detail/widgets/add_comment_widget/cubit/add_comment_widget_cubit.dart'
    as _i303;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/post/add_link/cubit/add_link_cubit.dart'
    as _i3;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/post/cubit/post_cubit.dart'
    as _i297;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/widgets/cubit/community_card_cubit.dart'
    as _i304;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/widgets/cubit/like_post_cubit.dart'
    as _i294;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/continue_learning/cubit/continue_learning_strip_cubit.dart'
    as _i287;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/favourites/cubit/favourites_strip_cubit.dart'
    as _i291;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/standard/cubit/standard_strip_cubit.dart'
    as _i271;
import 'package:open_learning_smart_tv/presentation/initiatives/cubit/initiatives_cubit.dart'
    as _i292;
import 'package:open_learning_smart_tv/presentation/languages/cubit/languages_cubit.dart'
    as _i293;
import 'package:open_learning_smart_tv/presentation/login/cubit/login_cubit.dart'
    as _i295;
import 'package:open_learning_smart_tv/presentation/login/mfa/cubit/mfa_cubit.dart'
    as _i95;
import 'package:open_learning_smart_tv/presentation/login/sso/cubit/sso_cubit.dart'
    as _i92;
import 'package:open_learning_smart_tv/presentation/notification/cubit/notification_cubit.dart'
    as _i261;
import 'package:open_learning_smart_tv/presentation/offline_state/offline_cubit.dart'
    as _i296;
import 'package:open_learning_smart_tv/presentation/privacy/cubit/privacy_cubit.dart'
    as _i96;
import 'package:open_learning_smart_tv/presentation/profile/cubit/profile_page_cubit.dart'
    as _i264;
import 'package:open_learning_smart_tv/presentation/profile/download/cubit/download_strip_cubit.dart'
    as _i85;
import 'package:open_learning_smart_tv/presentation/profile/download/wall/cubit/download_wall_cubit.dart'
    as _i305;
import 'package:open_learning_smart_tv/presentation/pwd_recover/cubit/pwd_confirm_page_cubit.dart'
    as _i97;
import 'package:open_learning_smart_tv/presentation/pwd_recover/cubit/pwd_recover_page_cubit.dart'
    as _i98;
import 'package:open_learning_smart_tv/presentation/pwd_reset/cubit/pwd_reset_page_cubit.dart'
    as _i99;
import 'package:open_learning_smart_tv/presentation/pwd_reset/cubit/pwd_set_old_page_cubit.dart'
    as _i15;
import 'package:open_learning_smart_tv/presentation/search/cubit/search_cubit.dart'
    as _i268;
import 'package:open_learning_smart_tv/presentation/settings/cubit/settings_cubit.dart'
    as _i100;
import 'package:open_learning_smart_tv/presentation/splashscreen/cubit/splash_screen_cubit.dart'
    as _i65;
import 'package:open_learning_smart_tv/presentation/video_player/community/cubit/video_player_thumbnail_cubit.dart'
    as _i71;
import 'package:open_learning_smart_tv/presentation/video_player/cubit/video_player_cubit.dart'
    as _i299;
import 'package:open_learning_smart_tv/presentation/video_player/offline/cubit/video_player_offline_cubit.dart'
    as _i300;
import 'package:open_learning_smart_tv/presentation/wall/cubit/wall_cubit.dart'
    as _i301;
import 'package:open_learning_smart_tv/presentation/web_player/cubit/web_view_page_cubit.dart'
    as _i302;
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels.dart'
    as _i266;
import 'package:open_learning_smart_tv/wrappers/cognito_auth.dart' as _i94;
import 'package:open_learning_smart_tv/wrappers/notification/notification_manager.dart'
    as _i262;
import 'package:open_learning_smart_tv/wrappers/ol_cognito_storage.dart'
    as _i47;
import 'package:open_learning_smart_tv/wrappers/ol_secure_storage.dart' as _i13;
import 'package:open_learning_smart_tv/wrappers/tracking/tracking_manager.dart'
    as _i276;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i14;
import 'package:shared_preferences/shared_preferences.dart' as _i21;

const String _dev = 'dev';
const String _production = 'production';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final externalModule = _$ExternalModule();
    gh.factory<_i3.AddLinkCubit>(() => _i3.AddLinkCubit());
    gh.factory<_i4.AppLogoCubit>(() => _i4.AppLogoCubit());
    gh.factory<_i5.EcmRegistrationCubit>(() => _i5.EcmRegistrationCubit());
    gh.lazySingleton<_i6.Env>(
      () => _i6.Prod(),
      registerFor: {_production},
    );
    gh.lazySingleton<_i6.Env>(
      () => _i6.Test(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i7.FlutterSecureStorage>(
        () => externalModule.secureStorage);
    gh.lazySingleton<_i8.GetPageSizeStripUseCase>(
        () => _i8.GetPageSizeStripUseCase());
    gh.lazySingleton<_i9.GetSecureStoredUserInfoUseCase>(
        () => _i9.GetSecureStoredUserInfoUseCase());
    gh.lazySingleton<_i10.GetStoredCorporateIdUseCase>(
        () => _i10.GetStoredCorporateIdUseCase());
    gh.lazySingleton<_i11.GetStoredSmartConfigurationUseCase>(
        () => _i11.GetStoredSmartConfigurationUseCase(gh<_i6.Env>()));
    gh.factory<_i12.LazyDatabase>(() => externalModule.lazyDatabase);
    gh.factory<_i13.OlSecureStorage>(
        () => _i13.OlSecureStorage(gh<_i7.FlutterSecureStorage>()));
    gh.lazySingleton<_i14.PrettyDioLogger>(() => externalModule.logInterceptor);
    gh.factory<_i15.PwdSetOldPageCubit>(() => _i15.PwdSetOldPageCubit());
    gh.lazySingleton<_i16.QueryDownloadManagerUseCase>(
        () => _i16.QueryDownloadManagerUseCase());
    gh.lazySingleton<_i17.SetStoredCorporateIdUseCase>(
        () => _i17.SetStoredCorporateIdUseCase(gh<_i13.OlSecureStorage>()));
    gh.lazySingleton<_i18.SetStoredOpenidConfigUseCase>(
        () => _i18.SetStoredOpenidConfigUseCase(gh<_i13.OlSecureStorage>()));
    gh.lazySingleton<_i19.SetStoredSmartConfigurationUseCase>(
        () => _i19.SetStoredSmartConfigurationUseCase());
    gh.lazySingleton<_i20.SetStoredUserSelfUseCase>(
        () => _i20.SetStoredUserSelfUseCase(gh<_i13.OlSecureStorage>()));
    await gh.factoryAsync<_i21.SharedPreferences>(
      () => externalModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i22.StoreDownloadContentInfoUseCase>(() =>
        _i22.StoreDownloadContentInfoUseCase(gh<_i21.SharedPreferences>()));
    gh.lazySingleton<_i23.AppDatabase>(
        () => _i23.AppDatabase(gh<_i12.LazyDatabase>()));
    gh.lazySingleton<_i24.CleanLocalSuggestionsUseCase>(
        () => _i24.CleanLocalSuggestionsUseCase(gh<_i21.SharedPreferences>()));
    gh.lazySingleton<_i25.ClearSecureStoredInitiativeUseCase>(() =>
        _i25.ClearSecureStoredInitiativeUseCase(gh<_i13.OlSecureStorage>()));
    gh.lazySingleton<_i26.ClearSecureStoredUseCase>(
        () => _i26.ClearSecureStoredUseCase(gh<_i13.OlSecureStorage>()));
    gh.lazySingleton<_i25.ClearSecureStoredUserInfoUseCase>(() =>
        _i25.ClearSecureStoredUserInfoUseCase(gh<_i13.OlSecureStorage>()));
    gh.factory<_i27.CommunityWebViewPageCubit>(
        () => _i27.CommunityWebViewPageCubit(
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
              gh<_i11.GetStoredSmartConfigurationUseCase>(),
            ));
    gh.factory<_i28.Dio>(
      () => externalModule.dioDynamic(
        gh<_i14.PrettyDioLogger>(),
        gh<_i6.Env>(),
      ),
      instanceName: 'dynamicUrlClient',
    );
    gh.factory<_i28.Dio>(
      () => externalModule.dioCognito(
        gh<_i14.PrettyDioLogger>(),
        gh<_i6.Env>(),
      ),
      instanceName: 'cognitoAuthClient',
    );
    gh.factory<_i28.Dio>(
      () => externalModule.dioDefault(
        gh<_i14.PrettyDioLogger>(),
        gh<_i6.Env>(),
      ),
      instanceName: 'default',
    );
    gh.lazySingleton<_i29.DownloadDataSource>(() => _i30.DownloadDataSourceImpl(
        gh<_i28.Dio>(instanceName: 'dynamicUrlClient')));
    gh.lazySingleton<_i31.DownloadlRepository>(
        () => _i32.DownloadlRepositoryImpl(
              gh<_i29.DownloadDataSource>(),
              gh<_i6.Env>(),
            ));
    gh.lazySingleton<_i33.GetLocalSuggestionsUseCase>(
        () => _i33.GetLocalSuggestionsUseCase(gh<_i21.SharedPreferences>()));
    gh.lazySingleton<_i34.GetSecureStoredUserInfoSsUseCase>(() =>
        _i34.GetSecureStoredUserInfoSsUseCase(gh<_i13.OlSecureStorage>()));
    gh.lazySingleton<_i35.GetSkipOnboardingUseCase>(
        () => _i35.GetSkipOnboardingUseCase(gh<_i21.SharedPreferences>()));
    gh.lazySingleton<_i36.GetSkipTutorialUseCase>(
        () => _i36.GetSkipTutorialUseCase(gh<_i21.SharedPreferences>()));
    gh.lazySingleton<_i37.GetStoredCorporateIdSsUseCase>(
        () => _i37.GetStoredCorporateIdSsUseCase(gh<_i13.OlSecureStorage>()));
    gh.lazySingleton<_i38.GetStoredDownloadContentInfoUseCase>(() =>
        _i38.GetStoredDownloadContentInfoUseCase(gh<_i21.SharedPreferences>()));
    gh.lazySingleton<_i39.GetStoredOpenidConfigUseCase>(
        () => _i39.GetStoredOpenidConfigUseCase(gh<_i13.OlSecureStorage>()));
    gh.lazySingleton<_i40.GetStoredUserSelfUseCase>(
        () => _i40.GetStoredUserSelfUseCase(gh<_i13.OlSecureStorage>()));
    gh.lazySingleton<_i41.GetStoredUsernameUseCase>(
        () => _i41.GetStoredUsernameUseCase(gh<_i21.SharedPreferences>()));
    gh.lazySingleton<_i42.HandlerStoredUsernameUseCase>(
        () => _i42.HandlerStoredUsernameUseCase(gh<_i21.SharedPreferences>()));
    gh.lazySingleton<_i43.LanguageDataSource>(
        () => _i44.LanguageSourceImpl(gh<_i28.Dio>(instanceName: 'default')));
    gh.lazySingleton<_i45.LocalNotificationsDao>(
        () => _i45.LocalNotificationsDao(gh<_i23.AppDatabase>()));
    gh.lazySingleton<_i46.OfflineStatementsDao>(
        () => _i46.OfflineStatementsDao(gh<_i23.AppDatabase>()));
    gh.factory<_i47.OlCognitoStorage>(
        () => _i47.OlCognitoStorage(gh<_i21.SharedPreferences>()));
    gh.factory<_i48.OnboardingManagerCubit>(() => _i48.OnboardingManagerCubit(
          gh<_i40.GetStoredUserSelfUseCase>(),
          gh<_i35.GetSkipOnboardingUseCase>(),
        ));
    gh.lazySingleton<_i49.OpenidConfigDataSource>(() =>
        _i50.OpenidConfigDataSourceImpl(gh<_i28.Dio>(instanceName: 'default')));
    gh.lazySingleton<_i51.OpenidConfigRepository>(() =>
        _i52.OpenidConfigRepositoryImpl(gh<_i49.OpenidConfigDataSource>()));
    gh.lazySingleton<_i53.RemoveStoredDownloadContentInfoUseCase>(() =>
        _i53.RemoveStoredDownloadContentInfoUseCase(
            gh<_i21.SharedPreferences>()));
    gh.lazySingleton<_i54.RetrieveDownloadInfoUseCase>(
        () => _i54.RetrieveDownloadInfoUseCase(gh<_i31.DownloadlRepository>()));
    gh.lazySingleton<_i55.ScheduleDownloadUseCase>(
        () => _i55.ScheduleDownloadUseCase(gh<_i31.DownloadlRepository>()));
    gh.lazySingleton<_i56.SessionDataSource>(() =>
        _i57.SessionDataSourceImpl(gh<_i28.Dio>(instanceName: 'default')));
    gh.lazySingleton<_i58.SessionRepository>(
        () => _i59.SessionRepositoryImpl(gh<_i56.SessionDataSource>()));
    gh.lazySingleton<_i60.SetInitiativeUseCase>(
        () => _i60.SetInitiativeUseCase(gh<_i58.SessionRepository>()));
    gh.lazySingleton<_i61.SetLocalSuggestionsUseCase>(
        () => _i61.SetLocalSuggestionsUseCase(gh<_i21.SharedPreferences>()));
    gh.lazySingleton<_i62.SetSecureStoredUserInfoUseCase>(
        () => _i62.SetSecureStoredUserInfoUseCase(
              gh<_i13.OlSecureStorage>(),
              gh<_i21.SharedPreferences>(),
            ));
    gh.lazySingleton<_i63.SetSkipOnboardingUseCase>(
        () => _i63.SetSkipOnboardingUseCase(gh<_i21.SharedPreferences>()));
    gh.lazySingleton<_i64.SetSkipTutorialUseCase>(
        () => _i64.SetSkipTutorialUseCase(gh<_i21.SharedPreferences>()));
    gh.factory<_i65.SplashScreenCubit>(() =>
        _i65.SplashScreenCubit(gh<_i34.GetSecureStoredUserInfoSsUseCase>()));
    gh.lazySingleton<_i66.StoreStatementUseCase>(
        () => _i66.StoreStatementUseCase(gh<_i46.OfflineStatementsDao>()));
    gh.lazySingleton<_i67.UserDataSource>(
        () => _i68.UserDataSourceImpl(gh<_i28.Dio>(instanceName: 'default')));
    gh.lazySingleton<_i69.UserRepository>(
        () => _i70.UserRepositoryImpl(gh<_i67.UserDataSource>()));
    gh.factory<_i71.VideoPlayerThumbnailCubit>(() =>
        _i71.VideoPlayerThumbnailCubit(gh<_i54.RetrieveDownloadInfoUseCase>()));
    gh.lazySingleton<_i72.AuthDataSource>(() => _i73.AuthDataSourceImpl(
        gh<_i28.Dio>(instanceName: 'cognitoAuthClient')));
    gh.lazySingleton<_i74.AuthRepository>(() => _i75.AuthRepositoryImpl(
          gh<_i72.AuthDataSource>(),
          gh<_i39.GetStoredOpenidConfigUseCase>(),
        ));
    gh.lazySingleton<_i76.CancelDownloadUseCase>(
        () => _i76.CancelDownloadUseCase(gh<_i31.DownloadlRepository>()));
    gh.lazySingleton<_i77.CheckSessionUseCase>(
        () => _i77.CheckSessionUseCase(gh<_i58.SessionRepository>()));
    gh.lazySingleton<_i78.CorporateCodeDataSource>(() =>
        _i79.CorporateCodeDataSourceImpl(
            gh<_i28.Dio>(instanceName: 'default')));
    gh.lazySingleton<_i80.CorporateCodeRepository>(() =>
        _i81.CorporateCodeRepositoryImpl(gh<_i78.CorporateCodeDataSource>()));
    gh.lazySingleton<_i82.CreateSessionUseCase>(
        () => _i82.CreateSessionUseCase(gh<_i58.SessionRepository>()));
    gh.lazySingleton<_i83.DeleteDownloadUseCase>(
        () => _i83.DeleteDownloadUseCase(gh<_i31.DownloadlRepository>()));
    gh.lazySingleton<_i84.DeleteStatementsUseCase>(
        () => _i84.DeleteStatementsUseCase(gh<_i46.OfflineStatementsDao>()));
    gh.lazySingleton<_i85.DownloadStripCubit>(() => _i85.DownloadStripCubit(
          gh<_i16.QueryDownloadManagerUseCase>(),
          gh<_i38.GetStoredDownloadContentInfoUseCase>(),
        ));
    gh.lazySingleton<_i86.GetCorporateIdUseCase>(
        () => _i86.GetCorporateIdUseCase(gh<_i80.CorporateCodeRepository>()));
    gh.lazySingleton<_i87.GetOpenidConfigUseCase>(
        () => _i87.GetOpenidConfigUseCase(gh<_i51.OpenidConfigRepository>()));
    gh.lazySingleton<_i88.GetStatementsUseCase>(
        () => _i88.GetStatementsUseCase(gh<_i46.OfflineStatementsDao>()));
    gh.lazySingleton<_i89.GetUserSelfUseCase>(
        () => _i89.GetUserSelfUseCase(gh<_i69.UserRepository>()));
    gh.lazySingleton<_i90.OauthTokenUseCase>(
        () => _i90.OauthTokenUseCase(gh<_i74.AuthRepository>()));
    gh.lazySingleton<_i91.SetPrivacyConsentUseCase>(
        () => _i91.SetPrivacyConsentUseCase(gh<_i69.UserRepository>()));
    gh.factory<_i92.SsoCubit>(() => _i92.SsoCubit(
          gh<_i47.OlCognitoStorage>(),
          gh<_i90.OauthTokenUseCase>(),
          gh<_i82.CreateSessionUseCase>(),
          gh<_i89.GetUserSelfUseCase>(),
          gh<_i10.GetStoredCorporateIdUseCase>(),
          gh<_i39.GetStoredOpenidConfigUseCase>(),
          gh<_i21.SharedPreferences>(),
          gh<_i6.Env>(),
        ));
    gh.lazySingleton<_i93.CleanLocalDatabaseUseCase>(
        () => _i93.CleanLocalDatabaseUseCase(
              gh<_i23.AppDatabase>(),
              gh<_i21.SharedPreferences>(),
              gh<_i16.QueryDownloadManagerUseCase>(),
              gh<_i53.RemoveStoredDownloadContentInfoUseCase>(),
              gh<_i76.CancelDownloadUseCase>(),
              gh<_i83.DeleteDownloadUseCase>(),
            ));
    gh.lazySingleton<_i94.CognitoAuthManager>(() => _i94.CognitoAuthManager(
          gh<_i47.OlCognitoStorage>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
          gh<_i60.SetInitiativeUseCase>(),
          gh<_i62.SetSecureStoredUserInfoUseCase>(),
          gh<_i82.CreateSessionUseCase>(),
          gh<_i77.CheckSessionUseCase>(),
          gh<_i10.GetStoredCorporateIdUseCase>(),
        ));
    gh.factory<_i95.MfaCubit>(() => _i95.MfaCubit(
          gh<_i94.CognitoAuthManager>(),
          gh<_i42.HandlerStoredUsernameUseCase>(),
          gh<_i82.CreateSessionUseCase>(),
          gh<_i89.GetUserSelfUseCase>(),
        ));
    gh.factory<_i96.PrivacyCubit>(
        () => _i96.PrivacyCubit(gh<_i91.SetPrivacyConsentUseCase>()));
    gh.factory<_i97.PwdConfirmCubit>(
        () => _i97.PwdConfirmCubit(gh<_i94.CognitoAuthManager>()));
    gh.factory<_i98.PwdRecoverCubit>(() => _i98.PwdRecoverCubit(
          gh<_i94.CognitoAuthManager>(),
          gh<_i41.GetStoredUsernameUseCase>(),
        ));
    gh.factory<_i99.PwdResetCubit>(
        () => _i99.PwdResetCubit(gh<_i94.CognitoAuthManager>()));
    gh.factory<_i100.SettingsCubit>(() => _i100.SettingsCubit(
          gh<_i11.GetStoredSmartConfigurationUseCase>(),
          gh<_i94.CognitoAuthManager>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
          gh<_i25.ClearSecureStoredInitiativeUseCase>(),
          gh<_i89.GetUserSelfUseCase>(),
          gh<_i21.SharedPreferences>(),
          gh<_i6.Env>(),
        ));
    gh.singleton<_i101.AppCubit>(() => _i101.AppCubit(
          gh<_i94.CognitoAuthManager>(),
          gh<_i26.ClearSecureStoredUseCase>(),
          gh<_i21.SharedPreferences>(),
        ));
    gh.lazySingleton<_i102.AuthenticationInterceptor>(
        () => _i102.AuthenticationInterceptor(
              gh<_i94.CognitoAuthManager>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
              gh<_i101.AppCubit>(),
              gh<_i28.Dio>(instanceName: 'default'),
            ));
    gh.factory<_i103.CorporateCodeCubit>(() => _i103.CorporateCodeCubit(
          gh<_i6.Env>(),
          gh<_i17.SetStoredCorporateIdUseCase>(),
          gh<_i86.GetCorporateIdUseCase>(),
          gh<_i94.CognitoAuthManager>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
          gh<_i77.CheckSessionUseCase>(),
          gh<_i101.AppCubit>(),
          gh<_i89.GetUserSelfUseCase>(),
          gh<_i82.CreateSessionUseCase>(),
          gh<_i62.SetSecureStoredUserInfoUseCase>(),
          gh<_i87.GetOpenidConfigUseCase>(),
          gh<_i18.SetStoredOpenidConfigUseCase>(),
          gh<_i26.ClearSecureStoredUseCase>(),
          gh<_i37.GetStoredCorporateIdSsUseCase>(),
          gh<_i34.GetSecureStoredUserInfoSsUseCase>(),
        ));
    gh.factory<_i28.Dio>(
      () => externalModule.dioAuthenticated(
        gh<_i102.AuthenticationInterceptor>(),
        gh<_i14.PrettyDioLogger>(),
        gh<_i6.Env>(),
      ),
      instanceName: 'authenticated',
    );
    gh.lazySingleton<_i104.DownloadIcsDataSource>(() =>
        _i105.DownloadIcsDataSourceImpl(
            gh<_i28.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i106.DownloadIcsRepository>(
        () => _i107.DownloadIcsRepositoryImpl(
              gh<_i104.DownloadIcsDataSource>(),
              gh<_i10.GetStoredCorporateIdUseCase>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i108.EcmDataSource>(() =>
        _i109.EcmDataSourceImpl(gh<_i28.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i110.EcmRepository>(
        () => _i111.EcmRepositoryImpl(gh<_i108.EcmDataSource>()));
    gh.lazySingleton<_i112.EditionDataSource>(() => _i113.EditionDataSourceImpl(
        gh<_i28.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i114.EditionRepository>(
        () => _i115.EditionRepositoryImpl(gh<_i112.EditionDataSource>()));
    gh.factory<_i116.GetEcmDisciplinesUseCase>(
        () => _i116.GetEcmDisciplinesUseCase(gh<_i110.EcmRepository>()));
    gh.factory<_i117.GetEcmProfessionsUseCase>(
        () => _i117.GetEcmProfessionsUseCase(gh<_i110.EcmRepository>()));
    gh.lazySingleton<_i118.GetEventsUseCase>(
        () => _i118.GetEventsUseCase(gh<_i106.DownloadIcsRepository>()));
    gh.lazySingleton<_i119.LearnerProgressDataSource>(() =>
        _i120.LearnerProgressDataSourceImpl(
            gh<_i28.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i121.LearnerProgressRepository>(() =>
        _i122.LearnerProgressRepositoryImpl(
            gh<_i119.LearnerProgressDataSource>()));
    gh.lazySingleton<_i123.MenuDataSource>(() =>
        _i124.MenuDataSourceImpl(gh<_i28.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i125.MenuRepository>(
        () => _i126.MenuRepositoryImpl(gh<_i123.MenuDataSource>()));
    gh.lazySingleton<_i127.NotificationDataSource>(() =>
        _i128.NotificationDataSourceImpl(
            gh<_i28.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i129.NotificationRepository>(() =>
        _i130.NotificationRepositoryImpl(gh<_i127.NotificationDataSource>()));
    gh.lazySingleton<_i131.NotificationUseCase>(() => _i131.NotificationUseCase(
          gh<_i129.NotificationRepository>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.factory<_i132.OlCalendarDialogCubit>(
        () => _i132.OlCalendarDialogCubit(gh<_i118.GetEventsUseCase>()));
    gh.factory<_i133.OnboardingSheetCubit>(() => _i133.OnboardingSheetCubit(
          gh<_i63.SetSkipOnboardingUseCase>(),
          gh<_i64.SetSkipTutorialUseCase>(),
          gh<_i101.AppCubit>(),
        ));
    gh.lazySingleton<_i134.PageDataSource>(() =>
        _i135.PageDataSourceImpl(gh<_i28.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i136.PageRepository>(
        () => _i137.PageRepositoryImpl(gh<_i134.PageDataSource>()));
    gh.lazySingleton<_i138.PostDataSource>(() =>
        _i139.PostDataSourceImpl(gh<_i28.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i140.PostRepository>(
        () => _i141.PostRepositoryRepositoryImpl(gh<_i138.PostDataSource>()));
    gh.lazySingleton<_i142.RatingDataSource>(() => _i143.RatingDataSourceImpl(
        gh<_i28.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i144.RatingRepository>(
        () => _i145.RatingRepositoryImpl(gh<_i142.RatingDataSource>()));
    gh.lazySingleton<_i146.RatingUseCase>(() => _i146.RatingUseCase(
          gh<_i144.RatingRepository>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
          gh<_i10.GetStoredCorporateIdUseCase>(),
        ));
    gh.factory<_i147.RatingsDialogCubit>(
        () => _i147.RatingsDialogCubit(gh<_i146.RatingUseCase>()));
    gh.lazySingleton<_i148.SearchDataSource>(() => _i149.SearchDataSourceImpl(
        gh<_i28.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i150.SearchRepository>(
        () => _i151.SearchRepositoryImpl(gh<_i148.SearchDataSource>()));
    gh.lazySingleton<_i152.SetNotificationsUseCase>(() =>
        _i152.SetNotificationsUseCase(gh<_i129.NotificationRepository>()));
    gh.lazySingleton<_i153.SmartConfiguratorDataSource>(() =>
        _i154.SmartConfiguratorDataSourceImpl(
            gh<_i28.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i155.SmartConfiguratorRepository>(
        () => _i156.SmartConfiguratorRepositoryImpl(
              gh<_i153.SmartConfiguratorDataSource>(),
              gh<_i43.LanguageDataSource>(),
            ));
    gh.lazySingleton<_i157.SmartLearningDataSource>(() =>
        _i158.SmartLearningDataSourceImpl(
            gh<_i28.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i159.SmartLearningRepository>(() =>
        _i160.SmartLearningRepositoryImpl(gh<_i157.SmartLearningDataSource>()));
    gh.lazySingleton<_i161.StartResumeDataSource>(() =>
        _i162.StartResumeDataSourceImpl(
            gh<_i28.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i163.StartResumeRepository>(() =>
        _i164.StartResumeRepositoryImpl(gh<_i161.StartResumeDataSource>()));
    gh.lazySingleton<_i165.StartResumeUseCase>(() => _i165.StartResumeUseCase(
          gh<_i163.StartResumeRepository>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
          gh<_i10.GetStoredCorporateIdUseCase>(),
        ));
    gh.lazySingleton<_i166.StatementsDataSource>(() =>
        _i167.StatementsDataSourceImpl(
            gh<_i28.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i168.StatementsRepository>(
        () => _i169.StatementsRepositoryImpl(gh<_i166.StatementsDataSource>()));
    gh.lazySingleton<_i170.StatementsUseCase>(() => _i170.StatementsUseCase(
          gh<_i6.Env>(),
          gh<_i168.StatementsRepository>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
          gh<_i10.GetStoredCorporateIdUseCase>(),
        ));
    gh.lazySingleton<_i171.StopCommunityTrackingUseCase>(
        () => _i171.StopCommunityTrackingUseCase(
              gh<_i6.Env>(),
              gh<_i10.GetStoredCorporateIdUseCase>(),
              gh<_i168.StatementsRepository>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i172.StripDataSource>(() =>
        _i173.StripDataSourceImpl(gh<_i28.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i174.StripRepository>(
        () => _i175.StripRepositoryImpl(gh<_i172.StripDataSource>()));
    gh.lazySingleton<_i176.TopicsDataSource>(() => _i177.TopicsDataSourceImpl(
        gh<_i28.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i178.TopicsRepository>(
        () => _i179.TopicsRepositoryImpl(gh<_i176.TopicsDataSource>()));
    gh.lazySingleton<_i180.UpdateSmartLearningSlotUseCase>(() =>
        _i180.UpdateSmartLearningSlotUseCase(
            gh<_i159.SmartLearningRepository>()));
    gh.lazySingleton<_i181.UserImageDataSource>(() =>
        _i182.UserImageDataSourceImpl(
            gh<_i28.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i183.UserImageRepository>(
        () => _i184.UserImageRepositoryImpl(gh<_i181.UserImageDataSource>()));
    gh.lazySingleton<_i185.WallRepository>(
        () => _i186.WallRepositoryImpl(gh<_i172.StripDataSource>()));
    gh.lazySingleton<_i187.WebPlayerDataSource>(() =>
        _i188.WebPlayerDataSourceImpl(
            gh<_i28.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i189.WebViewPlayerRepository>(
        () => _i190.WebPlayerRepositoryImpl(gh<_i187.WebPlayerDataSource>()));
    gh.lazySingleton<_i191.WebViewPlayerUseCase>(
        () => _i191.WebViewPlayerUseCase(
              gh<_i189.WebViewPlayerRepository>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
              gh<_i10.GetStoredCorporateIdUseCase>(),
              gh<_i11.GetStoredSmartConfigurationUseCase>(),
              gh<_i6.Env>(),
            ));
    gh.lazySingleton<_i192.AppResourceDataSource>(() =>
        _i193.AppResourceDataSourceImpl(
            gh<_i28.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i194.AppResourceRepository>(() =>
        _i195.AppResourceRepositoryImpl(gh<_i192.AppResourceDataSource>()));
    gh.lazySingleton<_i196.AutoEnrollmentDataSource>(() =>
        _i197.AutoEnrollmentDataSourceImpl(
            gh<_i28.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i198.AutoEnrollmentRepository>(() =>
        _i199.AutoEnrollmentRepositoryImpl(
            gh<_i196.AutoEnrollmentDataSource>()));
    gh.lazySingleton<_i200.AutoEnrollmentUseCase>(
        () => _i200.AutoEnrollmentUseCase(
              gh<_i198.AutoEnrollmentRepository>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
              gh<_i10.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i201.BottomEnrollmentUseCase>(
        () => _i201.BottomEnrollmentUseCase(
              gh<_i198.AutoEnrollmentRepository>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
              gh<_i10.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i202.CommunityDataSource>(() =>
        _i203.CommunityDataSourceImpl(
            gh<_i28.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i204.CommunityRepository>(
        () => _i205.CommunityRepositoryImpl(gh<_i202.CommunityDataSource>()));
    gh.lazySingleton<_i206.CreatePostUseCase>(() => _i206.CreatePostUseCase(
          gh<_i140.PostRepository>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i207.CreateSmartLearningSlotUseCase>(() =>
        _i207.CreateSmartLearningSlotUseCase(
            gh<_i159.SmartLearningRepository>()));
    gh.lazySingleton<_i208.DeleteCommentUseCase>(
        () => _i208.DeleteCommentUseCase(
              gh<_i204.CommunityRepository>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i209.DeletePostUseCase>(() => _i209.DeletePostUseCase(
          gh<_i140.PostRepository>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i210.DeleteSmartLearningSlotUseCase>(() =>
        _i210.DeleteSmartLearningSlotUseCase(
            gh<_i159.SmartLearningRepository>()));
    gh.lazySingleton<_i211.DetailDataSource>(() => _i212.DetailDataSourceImpl(
        gh<_i28.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i213.DetailRepository>(
        () => _i214.DetailRepositoryImpl(gh<_i211.DetailDataSource>()));
    gh.lazySingleton<_i215.DownloadEventsUseCase>(
        () => _i215.DownloadEventsUseCase(gh<_i106.DownloadIcsRepository>()));
    gh.factory<_i216.EcmFirstStepCubit>(() => _i216.EcmFirstStepCubit(
          gh<_i117.GetEcmProfessionsUseCase>(),
          gh<_i116.GetEcmDisciplinesUseCase>(),
        ));
    gh.factory<_i217.EcmRegisterUseCase>(() => _i217.EcmRegisterUseCase(
          gh<_i110.EcmRepository>(),
          gh<_i10.GetStoredCorporateIdUseCase>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.factory<_i218.EcmSecondStepCubit>(
        () => _i218.EcmSecondStepCubit(gh<_i217.EcmRegisterUseCase>()));
    gh.lazySingleton<_i219.EditCommentUseCase>(() => _i219.EditCommentUseCase(
          gh<_i204.CommunityRepository>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i220.EditPostUseCase>(() => _i220.EditPostUseCase(
          gh<_i140.PostRepository>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i221.EditionRegisterUseCase>(
        () => _i221.EditionRegisterUseCase(
              gh<_i114.EditionRepository>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
              gh<_i10.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i222.GetAnswersUseCase>(
        () => _i222.GetAnswersUseCase(gh<_i204.CommunityRepository>()));
    gh.lazySingleton<_i223.GetAppresourceUseCase>(
        () => _i223.GetAppresourceUseCase(gh<_i194.AppResourceRepository>()));
    gh.lazySingleton<_i224.GetCalendarStripUseCase>(
        () => _i224.GetCalendarStripUseCase(
              gh<_i174.StripRepository>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
              gh<_i10.GetStoredCorporateIdUseCase>(),
              gh<_i8.GetPageSizeStripUseCase>(),
            ));
    gh.lazySingleton<_i225.GetColorsUseCase>(
        () => _i225.GetColorsUseCase(gh<_i155.SmartConfiguratorRepository>()));
    gh.lazySingleton<_i226.GetCommentsUseCase>(() => _i226.GetCommentsUseCase(
          gh<_i204.CommunityRepository>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i227.GetCommunityPostLikesUseCase>(
        () => _i227.GetCommunityPostLikesUseCase(
              gh<_i204.CommunityRepository>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i228.GetCommunityPostUseCase>(
        () => _i228.GetCommunityPostUseCase(
              gh<_i204.CommunityRepository>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i229.GetCommunityPostsUseCase>(
        () => _i229.GetCommunityPostsUseCase(
              gh<_i204.CommunityRepository>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i230.GetContinueLearningStripUseCase>(
        () => _i230.GetContinueLearningStripUseCase(
              gh<_i174.StripRepository>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
              gh<_i10.GetStoredCorporateIdUseCase>(),
              gh<_i8.GetPageSizeStripUseCase>(),
            ));
    gh.lazySingleton<_i231.GetDetailPageUseCase>(
        () => _i231.GetDetailPageUseCase(
              gh<_i213.DetailRepository>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
              gh<_i10.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i232.GetEditionsUseCase>(() => _i232.GetEditionsUseCase(
          gh<_i213.DetailRepository>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
          gh<_i10.GetStoredCorporateIdUseCase>(),
        ));
    gh.lazySingleton<_i233.GetLabelsUseCase>(() => _i233.GetLabelsUseCase(
          gh<_i155.SmartConfiguratorRepository>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
          gh<_i10.GetStoredCorporateIdUseCase>(),
        ));
    gh.lazySingleton<_i234.GetLanguagesUseCase>(() =>
        _i234.GetLanguagesUseCase(gh<_i155.SmartConfiguratorRepository>()));
    gh.lazySingleton<_i235.GetLearnerGoalsUseCase>(
        () => _i235.GetLearnerGoalsUseCase(
              gh<_i121.LearnerProgressRepository>(),
              gh<_i10.GetStoredCorporateIdUseCase>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i236.GetLearnerProgressUseCase>(
        () => _i236.GetLearnerProgressUseCase(
              gh<_i121.LearnerProgressRepository>(),
              gh<_i10.GetStoredCorporateIdUseCase>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i237.GetMenuStructureUseCase>(
        () => _i237.GetMenuStructureUseCase(gh<_i125.MenuRepository>()));
    gh.lazySingleton<_i238.GetNotificationsUseCase>(() =>
        _i238.GetNotificationsUseCase(gh<_i129.NotificationRepository>()));
    gh.lazySingleton<_i239.GetPageStructureUseCase>(
        () => _i239.GetPageStructureUseCase(
              gh<_i136.PageRepository>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
              gh<_i10.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i240.GetProgressGoalsConfigUseCase>(
        () => _i240.GetProgressGoalsConfigUseCase(
              gh<_i121.LearnerProgressRepository>(),
              gh<_i10.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i241.GetRatingUseCase>(() => _i241.GetRatingUseCase(
          gh<_i213.DetailRepository>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
          gh<_i10.GetStoredCorporateIdUseCase>(),
        ));
    gh.lazySingleton<_i242.GetRelatedActivitiesUseCase>(
        () => _i242.GetRelatedActivitiesUseCase(
              gh<_i213.DetailRepository>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
              gh<_i10.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i243.GetSearchResultsUseCase>(
        () => _i243.GetSearchResultsUseCase(
              gh<_i150.SearchRepository>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
              gh<_i10.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i244.GetSharedPostUseCase>(
        () => _i244.GetSharedPostUseCase(
              gh<_i204.CommunityRepository>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i245.GetSharedPostsUseCase>(
        () => _i245.GetSharedPostsUseCase(
              gh<_i213.DetailRepository>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
              gh<_i10.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i246.GetSmartConfigurationUseCase>(() =>
        _i246.GetSmartConfigurationUseCase(
            gh<_i155.SmartConfiguratorRepository>()));
    gh.lazySingleton<_i247.GetSmartLearningSlotsUseCase>(() =>
        _i247.GetSmartLearningSlotsUseCase(
            gh<_i159.SmartLearningRepository>()));
    gh.lazySingleton<_i248.GetStandardStripUseCase>(
        () => _i248.GetStandardStripUseCase(
              gh<_i174.StripRepository>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
              gh<_i10.GetStoredCorporateIdUseCase>(),
              gh<_i8.GetPageSizeStripUseCase>(),
            ));
    gh.lazySingleton<_i249.GetStateUseCase>(() => _i249.GetStateUseCase(
          gh<_i6.Env>(),
          gh<_i168.StatementsRepository>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
          gh<_i10.GetStoredCorporateIdUseCase>(),
        ));
    gh.lazySingleton<_i250.GetSuggestionsUseCase>(
        () => _i250.GetSuggestionsUseCase(gh<_i150.SearchRepository>()));
    gh.lazySingleton<_i251.GetTeacherDetailUseCase>(
        () => _i251.GetTeacherDetailUseCase(
              gh<_i213.DetailRepository>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
              gh<_i10.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i252.GetToolUrlUseCase>(() => _i252.GetToolUrlUseCase(
          gh<_i213.DetailRepository>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
          gh<_i10.GetStoredCorporateIdUseCase>(),
        ));
    gh.lazySingleton<_i253.GetToolsUseCase>(() => _i253.GetToolsUseCase(
          gh<_i213.DetailRepository>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
          gh<_i10.GetStoredCorporateIdUseCase>(),
        ));
    gh.lazySingleton<_i254.GetTopicsUseCase>(
        () => _i254.GetTopicsUseCase(gh<_i178.TopicsRepository>()));
    gh.lazySingleton<_i255.GetUserImageUseCase>(
        () => _i255.GetUserImageUseCase(gh<_i183.UserImageRepository>()));
    gh.lazySingleton<_i256.GetWallStripContentUseCase>(
        () => _i256.GetWallStripContentUseCase(
              gh<_i185.WallRepository>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
              gh<_i10.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i257.LikePostUseCase>(() => _i257.LikePostUseCase(
          gh<_i204.CommunityRepository>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.factory<_i258.LocalCardCubit>(() => _i258.LocalCardCubit(
          gh<_i38.GetStoredDownloadContentInfoUseCase>(),
          gh<_i22.StoreDownloadContentInfoUseCase>(),
          gh<_i249.GetStateUseCase>(),
        ));
    gh.factory<_i259.LocalCardStatusCubit>(() => _i259.LocalCardStatusCubit(
          gh<_i38.GetStoredDownloadContentInfoUseCase>(),
          gh<_i231.GetDetailPageUseCase>(),
          gh<_i22.StoreDownloadContentInfoUseCase>(),
          gh<_i249.GetStateUseCase>(),
        ));
    gh.factory<_i260.LogoHeaderCubit>(() => _i260.LogoHeaderCubit(
          gh<_i255.GetUserImageUseCase>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.singleton<_i261.NotificationCubit>(() => _i261.NotificationCubit(
          gh<_i238.GetNotificationsUseCase>(),
          gh<_i152.SetNotificationsUseCase>(),
        ));
    gh.singleton<_i262.NotificationManager>(() => _i262.NotificationManager(
          gh<_i261.NotificationCubit>(),
          gh<_i21.SharedPreferences>(),
          gh<_i131.NotificationUseCase>(),
        ));
    gh.factory<_i263.OlDownloadDialogCubit>(
        () => _i263.OlDownloadDialogCubit(gh<_i215.DownloadEventsUseCase>()));
    gh.factory<_i264.ProfilePageCubit>(() => _i264.ProfilePageCubit(
          gh<_i255.GetUserImageUseCase>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
          gh<_i240.GetProgressGoalsConfigUseCase>(),
          gh<_i235.GetLearnerGoalsUseCase>(),
          gh<_i236.GetLearnerProgressUseCase>(),
        ));
    gh.factory<_i265.RatingCubit>(() => _i265.RatingCubit(
          gh<_i241.GetRatingUseCase>(),
          gh<_i11.GetStoredSmartConfigurationUseCase>(),
        ));
    gh.lazySingleton<_i266.RemoteLabels>(() => _i266.RemoteLabels(
          gh<_i234.GetLanguagesUseCase>(),
          gh<_i233.GetLabelsUseCase>(),
          gh<_i21.SharedPreferences>(),
        ));
    gh.lazySingleton<_i267.RemoveFavouritesUseCase>(
        () => _i267.RemoveFavouritesUseCase(
              gh<_i213.DetailRepository>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
              gh<_i10.GetStoredCorporateIdUseCase>(),
            ));
    gh.factory<_i268.SearchCubit>(() => _i268.SearchCubit(
          gh<_i243.GetSearchResultsUseCase>(),
          gh<_i250.GetSuggestionsUseCase>(),
          gh<_i33.GetLocalSuggestionsUseCase>(),
          gh<_i61.SetLocalSuggestionsUseCase>(),
          gh<_i24.CleanLocalSuggestionsUseCase>(),
        ));
    gh.lazySingleton<_i269.SetStateUseCase>(() => _i269.SetStateUseCase(
          gh<_i6.Env>(),
          gh<_i168.StatementsRepository>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
          gh<_i10.GetStoredCorporateIdUseCase>(),
        ));
    gh.factory<_i270.SmartLearningBottomSheetCubit>(
        () => _i270.SmartLearningBottomSheetCubit(
              gh<_i247.GetSmartLearningSlotsUseCase>(),
              gh<_i207.CreateSmartLearningSlotUseCase>(),
              gh<_i180.UpdateSmartLearningSlotUseCase>(),
              gh<_i210.DeleteSmartLearningSlotUseCase>(),
              gh<_i224.GetCalendarStripUseCase>(),
            ));
    gh.factory<_i271.StandardStripCubit>(
        () => _i271.StandardStripCubit(gh<_i248.GetStandardStripUseCase>()));
    gh.lazySingleton<_i272.StartCommunityTrackingUseCase>(
        () => _i272.StartCommunityTrackingUseCase(
              gh<_i6.Env>(),
              gh<_i10.GetStoredCorporateIdUseCase>(),
              gh<_i168.StatementsRepository>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.factory<_i273.TeacherDetailSheetCubit>(() =>
        _i273.TeacherDetailSheetCubit(gh<_i251.GetTeacherDetailUseCase>()));
    gh.factory<_i274.ToolItemCubit>(
        () => _i274.ToolItemCubit(gh<_i252.GetToolUrlUseCase>()));
    gh.factory<_i275.TopicsFilterCubit>(
        () => _i275.TopicsFilterCubit(gh<_i254.GetTopicsUseCase>()));
    gh.lazySingleton<_i276.TrackingManager>(() => _i276.TrackingManager(
          gh<_i272.StartCommunityTrackingUseCase>(),
          gh<_i171.StopCommunityTrackingUseCase>(),
        ));
    gh.lazySingleton<_i277.UnlikePostUseCase>(() => _i277.UnlikePostUseCase(
          gh<_i204.CommunityRepository>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.factory<_i278.UserAvatarCubit>(
        () => _i278.UserAvatarCubit(gh<_i255.GetUserImageUseCase>()));
    gh.lazySingleton<_i279.WebViewPlayerLinkedinUseCase>(
        () => _i279.WebViewPlayerLinkedinUseCase(
              gh<_i189.WebViewPlayerRepository>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
              gh<_i10.GetStoredCorporateIdUseCase>(),
              gh<_i11.GetStoredSmartConfigurationUseCase>(),
              gh<_i6.Env>(),
            ));
    gh.lazySingleton<_i280.AddAnswerUseCase>(() => _i280.AddAnswerUseCase(
          gh<_i204.CommunityRepository>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i281.AddCommentUseCase>(() => _i281.AddCommentUseCase(
          gh<_i204.CommunityRepository>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i282.AddFavouritesUseCase>(
        () => _i282.AddFavouritesUseCase(
              gh<_i213.DetailRepository>(),
              gh<_i9.GetSecureStoredUserInfoUseCase>(),
              gh<_i10.GetStoredCorporateIdUseCase>(),
            ));
    gh.factory<_i283.AnswersCubit>(
        () => _i283.AnswersCubit(gh<_i222.GetAnswersUseCase>()));
    gh.factory<_i284.CalendarStripCubit>(
        () => _i284.CalendarStripCubit(gh<_i224.GetCalendarStripUseCase>()));
    gh.factory<_i285.CommentsCubit>(
        () => _i285.CommentsCubit(gh<_i226.GetCommentsUseCase>()));
    gh.lazySingleton<_i286.CommunityWallCubit>(() => _i286.CommunityWallCubit(
          gh<_i229.GetCommunityPostsUseCase>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i287.ContinueLearningStripCubit>(() =>
        _i287.ContinueLearningStripCubit(
            gh<_i230.GetContinueLearningStripUseCase>()));
    gh.factory<_i288.DetailPageCubit>(() => _i288.DetailPageCubit(
          gh<_i231.GetDetailPageUseCase>(),
          gh<_i253.GetToolsUseCase>(),
          gh<_i242.GetRelatedActivitiesUseCase>(),
          gh<_i232.GetEditionsUseCase>(),
          gh<_i245.GetSharedPostsUseCase>(),
          gh<_i200.AutoEnrollmentUseCase>(),
          gh<_i165.StartResumeUseCase>(),
          gh<_i11.GetStoredSmartConfigurationUseCase>(),
          gh<_i221.EditionRegisterUseCase>(),
          gh<_i201.BottomEnrollmentUseCase>(),
          gh<_i287.ContinueLearningStripCubit>(),
          gh<_i209.DeletePostUseCase>(),
          gh<_i244.GetSharedPostUseCase>(),
          gh<_i38.GetStoredDownloadContentInfoUseCase>(),
          gh<_i22.StoreDownloadContentInfoUseCase>(),
          gh<_i85.DownloadStripCubit>(),
        ));
    gh.factory<_i289.DownloadItemCubit>(() => _i289.DownloadItemCubit(
          gh<_i55.ScheduleDownloadUseCase>(),
          gh<_i54.RetrieveDownloadInfoUseCase>(),
          gh<_i22.StoreDownloadContentInfoUseCase>(),
          gh<_i38.GetStoredDownloadContentInfoUseCase>(),
          gh<_i76.CancelDownloadUseCase>(),
          gh<_i53.RemoveStoredDownloadContentInfoUseCase>(),
          gh<_i83.DeleteDownloadUseCase>(),
          gh<_i16.QueryDownloadManagerUseCase>(),
          gh<_i165.StartResumeUseCase>(),
          gh<_i85.DownloadStripCubit>(),
          gh<_i249.GetStateUseCase>(),
        ));
    gh.factory<_i290.EditionCubit>(
        () => _i290.EditionCubit(gh<_i221.EditionRegisterUseCase>()));
    gh.lazySingleton<_i291.FavouritesStripCubit>(
        () => _i291.FavouritesStripCubit(gh<_i248.GetStandardStripUseCase>()));
    gh.factory<_i292.InitiativesCubit>(() => _i292.InitiativesCubit(
          gh<_i60.SetInitiativeUseCase>(),
          gh<_i20.SetStoredUserSelfUseCase>(),
          gh<_i62.SetSecureStoredUserInfoUseCase>(),
          gh<_i237.GetMenuStructureUseCase>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
          gh<_i246.GetSmartConfigurationUseCase>(),
          gh<_i10.GetStoredCorporateIdUseCase>(),
          gh<_i19.SetStoredSmartConfigurationUseCase>(),
          gh<_i262.NotificationManager>(),
          gh<_i93.CleanLocalDatabaseUseCase>(),
          gh<_i77.CheckSessionUseCase>(),
          gh<_i225.GetColorsUseCase>(),
          gh<_i266.RemoteLabels>(),
          gh<_i286.CommunityWallCubit>(),
          gh<_i223.GetAppresourceUseCase>(),
        ));
    gh.factory<_i293.LanguagesCubit>(
        () => _i293.LanguagesCubit(gh<_i266.RemoteLabels>()));
    gh.factory<_i294.LikePostCubit>(() => _i294.LikePostCubit(
          gh<_i227.GetCommunityPostLikesUseCase>(),
          gh<_i257.LikePostUseCase>(),
          gh<_i277.UnlikePostUseCase>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.factory<_i295.LoginCubit>(() => _i295.LoginCubit(
          gh<_i94.CognitoAuthManager>(),
          gh<_i41.GetStoredUsernameUseCase>(),
          gh<_i42.HandlerStoredUsernameUseCase>(),
          gh<_i82.CreateSessionUseCase>(),
          gh<_i89.GetUserSelfUseCase>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
          gh<_i77.CheckSessionUseCase>(),
          gh<_i62.SetSecureStoredUserInfoUseCase>(),
          gh<_i10.GetStoredCorporateIdUseCase>(),
          gh<_i101.AppCubit>(),
          gh<_i21.SharedPreferences>(),
          gh<_i266.RemoteLabels>(),
        ));
    gh.lazySingleton<_i296.OfflineCubit>(() => _i296.OfflineCubit(
          gh<_i88.GetStatementsUseCase>(),
          gh<_i170.StatementsUseCase>(),
          gh<_i269.SetStateUseCase>(),
          gh<_i84.DeleteStatementsUseCase>(),
          gh<_i40.GetStoredUserSelfUseCase>(),
          gh<_i36.GetSkipTutorialUseCase>(),
          gh<_i101.AppCubit>(),
          gh<_i35.GetSkipOnboardingUseCase>(),
          gh<_i287.ContinueLearningStripCubit>(),
          gh<_i38.GetStoredDownloadContentInfoUseCase>(),
          gh<_i22.StoreDownloadContentInfoUseCase>(),
        ));
    gh.factory<_i297.PostCubit>(() => _i297.PostCubit(
          gh<_i255.GetUserImageUseCase>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
          gh<_i206.CreatePostUseCase>(),
          gh<_i220.EditPostUseCase>(),
          gh<_i286.CommunityWallCubit>(),
        ));
    gh.factory<_i298.PostDetailCubit>(() => _i298.PostDetailCubit(
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
          gh<_i244.GetSharedPostUseCase>(),
          gh<_i255.GetUserImageUseCase>(),
          gh<_i228.GetCommunityPostUseCase>(),
          gh<_i209.DeletePostUseCase>(),
          gh<_i286.CommunityWallCubit>(),
        ));
    gh.factory<_i299.VideoPlayerCubit>(() => _i299.VideoPlayerCubit(
          gh<_i170.StatementsUseCase>(),
          gh<_i269.SetStateUseCase>(),
          gh<_i249.GetStateUseCase>(),
          gh<_i54.RetrieveDownloadInfoUseCase>(),
          gh<_i287.ContinueLearningStripCubit>(),
          gh<_i38.GetStoredDownloadContentInfoUseCase>(),
          gh<_i22.StoreDownloadContentInfoUseCase>(),
        ));
    gh.factory<_i300.VideoPlayerOfflineCubit>(
        () => _i300.VideoPlayerOfflineCubit(
              gh<_i66.StoreStatementUseCase>(),
              gh<_i170.StatementsUseCase>(),
              gh<_i269.SetStateUseCase>(),
              gh<_i287.ContinueLearningStripCubit>(),
              gh<_i38.GetStoredDownloadContentInfoUseCase>(),
              gh<_i22.StoreDownloadContentInfoUseCase>(),
            ));
    gh.factory<_i301.WallCubit>(() => _i301.WallCubit(
          gh<_i256.GetWallStripContentUseCase>(),
          gh<_i267.RemoveFavouritesUseCase>(),
          gh<_i291.FavouritesStripCubit>(),
        ));
    gh.factory<_i302.WebViewPageCubit>(() => _i302.WebViewPageCubit(
          gh<_i6.Env>(),
          gh<_i9.GetSecureStoredUserInfoUseCase>(),
          gh<_i94.CognitoAuthManager>(),
          gh<_i191.WebViewPlayerUseCase>(),
          gh<_i279.WebViewPlayerLinkedinUseCase>(),
        ));
    gh.factory<_i303.AddCommentWidgetCubit>(() => _i303.AddCommentWidgetCubit(
          gh<_i281.AddCommentUseCase>(),
          gh<_i280.AddAnswerUseCase>(),
          gh<_i219.EditCommentUseCase>(),
          gh<_i208.DeleteCommentUseCase>(),
          gh<_i286.CommunityWallCubit>(),
        ));
    gh.factory<_i304.CommunityCardCubit>(() => _i304.CommunityCardCubit(
          gh<_i209.DeletePostUseCase>(),
          gh<_i286.CommunityWallCubit>(),
        ));
    gh.factory<_i305.DownloadWallCubit>(() => _i305.DownloadWallCubit(
          gh<_i16.QueryDownloadManagerUseCase>(),
          gh<_i53.RemoveStoredDownloadContentInfoUseCase>(),
          gh<_i76.CancelDownloadUseCase>(),
          gh<_i83.DeleteDownloadUseCase>(),
          gh<_i38.GetStoredDownloadContentInfoUseCase>(),
          gh<_i296.OfflineCubit>(),
          gh<_i88.GetStatementsUseCase>(),
        ));
    gh.factory<_i306.DynamicContentCubit>(() => _i306.DynamicContentCubit(
          gh<_i239.GetPageStructureUseCase>(),
          gh<_i11.GetStoredSmartConfigurationUseCase>(),
          gh<_i296.OfflineCubit>(),
        ));
    gh.factory<_i307.FavouriteCubit>(() => _i307.FavouriteCubit(
          gh<_i282.AddFavouritesUseCase>(),
          gh<_i267.RemoveFavouritesUseCase>(),
          gh<_i291.FavouritesStripCubit>(),
        ));
    return this;
  }
}

class _$ExternalModule extends _i308.ExternalModule {}
