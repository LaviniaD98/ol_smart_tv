// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i33;
import 'package:drift/drift.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:open_learning_smart_tv/core/database/app_database.dart' as _i31;
import 'package:open_learning_smart_tv/core/database/tables/local_notifications/local_notifications_dao.dart'
    as _i58;
import 'package:open_learning_smart_tv/core/database/tables/offline_player_tracking/offline_statements_dao.dart'
    as _i57;
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart'
    as _i310;
import 'package:open_learning_smart_tv/core/env/env.dart' as _i17;
import 'package:open_learning_smart_tv/core/web_client_config/web_client_config.dart'
    as _i104;
import 'package:open_learning_smart_tv/data/data_sources/assets/app_resource_data_source.dart'
    as _i118;
import 'package:open_learning_smart_tv/data/data_sources/assets/app_resource_data_source_impl.dart'
    as _i119;
import 'package:open_learning_smart_tv/data/data_sources/auto_enrollment/auto_enrollment_data_source.dart'
    as _i146;
import 'package:open_learning_smart_tv/data/data_sources/auto_enrollment/auto_enrollment_data_source_impl.dart'
    as _i147;
import 'package:open_learning_smart_tv/data/data_sources/community/community_data_source.dart'
    as _i126;
import 'package:open_learning_smart_tv/data/data_sources/community/community_data_source_impl.dart'
    as _i127;
import 'package:open_learning_smart_tv/data/data_sources/corporate_code/corporate_code_data_source.dart'
    as _i51;
import 'package:open_learning_smart_tv/data/data_sources/corporate_code/corporate_code_data_source_impl.dart'
    as _i52;
import 'package:open_learning_smart_tv/data/data_sources/detail/detail_data_source.dart'
    as _i155;
import 'package:open_learning_smart_tv/data/data_sources/detail/detail_data_source_impl.dart'
    as _i156;
import 'package:open_learning_smart_tv/data/data_sources/download/download_data_source.dart'
    as _i43;
import 'package:open_learning_smart_tv/data/data_sources/download/download_data_source_impl.dart'
    as _i44;
import 'package:open_learning_smart_tv/data/data_sources/download_ics/download_ics_data_source.dart'
    as _i136;
import 'package:open_learning_smart_tv/data/data_sources/download_ics/download_ics_data_source_impl.dart'
    as _i137;
import 'package:open_learning_smart_tv/data/data_sources/ecm/ecm_data_source.dart'
    as _i106;
import 'package:open_learning_smart_tv/data/data_sources/ecm/ecm_data_source_impl.dart'
    as _i107;
import 'package:open_learning_smart_tv/data/data_sources/edition/edition_data_source.dart'
    as _i108;
import 'package:open_learning_smart_tv/data/data_sources/edition/edition_data_source_impl.dart'
    as _i109;
import 'package:open_learning_smart_tv/data/data_sources/language/language_data_source.dart'
    as _i47;
import 'package:open_learning_smart_tv/data/data_sources/language/language_data_source_impl.dart'
    as _i48;
import 'package:open_learning_smart_tv/data/data_sources/menu/menu_data_source.dart'
    as _i142;
import 'package:open_learning_smart_tv/data/data_sources/menu/menu_data_source_impl.dart'
    as _i143;
import 'package:open_learning_smart_tv/data/data_sources/notification/notification_data_source.dart'
    as _i134;
import 'package:open_learning_smart_tv/data/data_sources/notification/notification_data_source_impl.dart'
    as _i135;
import 'package:open_learning_smart_tv/data/data_sources/openid_config/openid_config_data_source.dart'
    as _i64;
import 'package:open_learning_smart_tv/data/data_sources/openid_config/openid_config_data_source_impl.dart'
    as _i65;
import 'package:open_learning_smart_tv/data/data_sources/page/page_data_source.dart'
    as _i110;
import 'package:open_learning_smart_tv/data/data_sources/page/page_data_source_impl.dart'
    as _i111;
import 'package:open_learning_smart_tv/data/data_sources/post/post_data_source.dart'
    as _i150;
import 'package:open_learning_smart_tv/data/data_sources/post/post_data_source_impl.dart'
    as _i151;
import 'package:open_learning_smart_tv/data/data_sources/progress/learner_progress_data_source.dart'
    as _i132;
import 'package:open_learning_smart_tv/data/data_sources/progress/learner_progress_data_source_impl.dart'
    as _i133;
import 'package:open_learning_smart_tv/data/data_sources/rating/rating_data_source.dart'
    as _i140;
import 'package:open_learning_smart_tv/data/data_sources/rating/rating_data_source_impl.dart'
    as _i141;
import 'package:open_learning_smart_tv/data/data_sources/search/search_data_source.dart'
    as _i138;
import 'package:open_learning_smart_tv/data/data_sources/search/search_data_source_impl.dart'
    as _i139;
import 'package:open_learning_smart_tv/data/data_sources/session/session_data_source.dart'
    as _i49;
import 'package:open_learning_smart_tv/data/data_sources/session/session_data_source_impl.dart'
    as _i50;
import 'package:open_learning_smart_tv/data/data_sources/smart_configurator/smart_configurator_data_source.dart'
    as _i114;
import 'package:open_learning_smart_tv/data/data_sources/smart_configurator/smart_configurator_data_source_impl.dart'
    as _i115;
import 'package:open_learning_smart_tv/data/data_sources/smart_learning/smart_learning_data_source.dart'
    as _i124;
import 'package:open_learning_smart_tv/data/data_sources/smart_learning/smart_learning_data_source_impl.dart'
    as _i125;
import 'package:open_learning_smart_tv/data/data_sources/start_resume/start_resume_data_source.dart'
    as _i122;
import 'package:open_learning_smart_tv/data/data_sources/start_resume/start_resume_data_source_impl.dart'
    as _i123;
import 'package:open_learning_smart_tv/data/data_sources/statements/statements_data_source.dart'
    as _i128;
import 'package:open_learning_smart_tv/data/data_sources/statements/statements_data_source_impl.dart'
    as _i129;
import 'package:open_learning_smart_tv/data/data_sources/strip/strip_data_source.dart'
    as _i144;
import 'package:open_learning_smart_tv/data/data_sources/strip/strip_data_source_impl.dart'
    as _i145;
import 'package:open_learning_smart_tv/data/data_sources/topic/topics_data_source.dart'
    as _i112;
import 'package:open_learning_smart_tv/data/data_sources/topic/topics_data_source_impl.dart'
    as _i113;
import 'package:open_learning_smart_tv/data/data_sources/user/auth_data_source.dart'
    as _i54;
import 'package:open_learning_smart_tv/data/data_sources/user/auth_data_source_impl.dart'
    as _i55;
import 'package:open_learning_smart_tv/data/data_sources/user/user_data_source.dart'
    as _i66;
import 'package:open_learning_smart_tv/data/data_sources/user/user_data_source_impl.dart'
    as _i67;
import 'package:open_learning_smart_tv/data/data_sources/user_image/user_image_data_source.dart'
    as _i116;
import 'package:open_learning_smart_tv/data/data_sources/user_image/user_image_data_source_impl.dart'
    as _i117;
import 'package:open_learning_smart_tv/data/data_sources/web_player/web_player_data_source.dart'
    as _i130;
import 'package:open_learning_smart_tv/data/data_sources/web_player/web_player_data_source_impl.dart'
    as _i131;
import 'package:open_learning_smart_tv/data/repositories/assets/app_resource_repository_impl.dart'
    as _i205;
import 'package:open_learning_smart_tv/data/repositories/auto_enrollment/auto_enrollment_repository_impl.dart'
    as _i172;
import 'package:open_learning_smart_tv/data/repositories/community/community_repository_impl.dart'
    as _i167;
import 'package:open_learning_smart_tv/data/repositories/corporate_code/corporate_code_repository_impl.dart'
    as _i60;
import 'package:open_learning_smart_tv/data/repositories/detail/detail_repository_impl.dart'
    as _i218;
import 'package:open_learning_smart_tv/data/repositories/download/download_repository_impl.dart'
    as _i72;
import 'package:open_learning_smart_tv/data/repositories/download_ics/download_ics_repository_impl.dart'
    as _i220;
import 'package:open_learning_smart_tv/data/repositories/ecm/ecm_repository_impl.dart'
    as _i169;
import 'package:open_learning_smart_tv/data/repositories/edition/edition_repository_impl.dart'
    as _i121;
import 'package:open_learning_smart_tv/data/repositories/menu/menu_repository_impl.dart'
    as _i160;
import 'package:open_learning_smart_tv/data/repositories/notification/notification_repository_impl.dart'
    as _i211;
import 'package:open_learning_smart_tv/data/repositories/openid_config/openid_config_repository_impl.dart'
    as _i82;
import 'package:open_learning_smart_tv/data/repositories/page/page_repository_impl.dart'
    as _i174;
import 'package:open_learning_smart_tv/data/repositories/post/post_repository_impl.dart'
    as _i222;
import 'package:open_learning_smart_tv/data/repositories/progress/learner_progress_repository_impl.dart'
    as _i154;
import 'package:open_learning_smart_tv/data/repositories/rating/rating_repository_impl.dart'
    as _i198;
import 'package:open_learning_smart_tv/data/repositories/search/search_repository_impl.dart'
    as _i225;
import 'package:open_learning_smart_tv/data/repositories/session/session_repository_impl.dart'
    as _i78;
import 'package:open_learning_smart_tv/data/repositories/smart_configurator/smart_configurator_repository_impl.dart'
    as _i179;
import 'package:open_learning_smart_tv/data/repositories/smart_learning/smart_learning_repository_impl.dart'
    as _i190;
import 'package:open_learning_smart_tv/data/repositories/start_resume/start_resume_repository_impl.dart'
    as _i158;
import 'package:open_learning_smart_tv/data/repositories/statements/statements_repository_impl.dart'
    as _i207;
import 'package:open_learning_smart_tv/data/repositories/strip/strip_repository_impl.dart'
    as _i164;
import 'package:open_learning_smart_tv/data/repositories/topics/topics_repository_impl.dart'
    as _i182;
import 'package:open_learning_smart_tv/data/repositories/user/auth_repository_impl.dart'
    as _i86;
import 'package:open_learning_smart_tv/data/repositories/user/user_repository_impl.dart'
    as _i80;
import 'package:open_learning_smart_tv/data/repositories/user_image/user_image_repository_impl.dart'
    as _i176;
import 'package:open_learning_smart_tv/data/repositories/wall/wall_repository_impl.dart'
    as _i162;
import 'package:open_learning_smart_tv/data/repositories/web_player/web_player_repository_impl.dart'
    as _i149;
import 'package:open_learning_smart_tv/domain/repositories/assets/app_resource_repository.dart'
    as _i204;
import 'package:open_learning_smart_tv/domain/repositories/auto_enrollment/auto_enrollment_repository.dart'
    as _i171;
import 'package:open_learning_smart_tv/domain/repositories/community/community_repository.dart'
    as _i166;
import 'package:open_learning_smart_tv/domain/repositories/corporate_code/corporate_code_repository.dart'
    as _i59;
import 'package:open_learning_smart_tv/domain/repositories/detail/detail_repository.dart'
    as _i217;
import 'package:open_learning_smart_tv/domain/repositories/download/download_repository.dart'
    as _i71;
import 'package:open_learning_smart_tv/domain/repositories/download_ics/download_ics_repository.dart'
    as _i219;
import 'package:open_learning_smart_tv/domain/repositories/ecm/ecm_repository.dart'
    as _i168;
import 'package:open_learning_smart_tv/domain/repositories/edition/edition_repository.dart'
    as _i120;
import 'package:open_learning_smart_tv/domain/repositories/menu/menu_repository.dart'
    as _i159;
import 'package:open_learning_smart_tv/domain/repositories/notification/notification_repository.dart'
    as _i210;
import 'package:open_learning_smart_tv/domain/repositories/openid_config/openid_config_repository.dart'
    as _i81;
import 'package:open_learning_smart_tv/domain/repositories/page/page_repository.dart'
    as _i173;
import 'package:open_learning_smart_tv/domain/repositories/post/post_repository.dart'
    as _i221;
import 'package:open_learning_smart_tv/domain/repositories/progress/learner_progress_repository.dart'
    as _i153;
import 'package:open_learning_smart_tv/domain/repositories/rating/rating_repository.dart'
    as _i197;
import 'package:open_learning_smart_tv/domain/repositories/search/search_repository.dart'
    as _i224;
import 'package:open_learning_smart_tv/domain/repositories/session/session_repository.dart'
    as _i77;
import 'package:open_learning_smart_tv/domain/repositories/smart_configurator/smart_configurator_repository.dart'
    as _i178;
import 'package:open_learning_smart_tv/domain/repositories/smart_learning/smart_learning_repository.dart'
    as _i189;
import 'package:open_learning_smart_tv/domain/repositories/start_resume/start_resume_repository.dart'
    as _i157;
import 'package:open_learning_smart_tv/domain/repositories/statements/statements_repository.dart'
    as _i206;
import 'package:open_learning_smart_tv/domain/repositories/strip/strip_repository.dart'
    as _i163;
import 'package:open_learning_smart_tv/domain/repositories/topics/topics_repository.dart'
    as _i181;
import 'package:open_learning_smart_tv/domain/repositories/user/auth_repository.dart'
    as _i85;
import 'package:open_learning_smart_tv/domain/repositories/user/user_repository.dart'
    as _i79;
import 'package:open_learning_smart_tv/domain/repositories/user_image/user_image_repository.dart'
    as _i175;
import 'package:open_learning_smart_tv/domain/repositories/wall/wall_repository.dart'
    as _i161;
import 'package:open_learning_smart_tv/domain/repositories/web_view_player/web_view_player_repository.dart'
    as _i148;
import 'package:open_learning_smart_tv/domain/use_cases/assets/get_app_resource_use_case.dart'
    as _i216;
import 'package:open_learning_smart_tv/domain/use_cases/auto_enrollment/auto_enrollment_use_case.dart'
    as _i212;
import 'package:open_learning_smart_tv/domain/use_cases/auto_enrollment/bottom_enrollment_use_case.dart'
    as _i213;
import 'package:open_learning_smart_tv/domain/use_cases/clean_local_datatbase_use_case.dart'
    as _i89;
import 'package:open_learning_smart_tv/domain/use_cases/clear_secure_stored_info_use_case.dart'
    as _i41;
import 'package:open_learning_smart_tv/domain/use_cases/clear_secure_stored_use_case.dart'
    as _i34;
import 'package:open_learning_smart_tv/domain/use_cases/community/add_answer_use_case.dart'
    as _i231;
import 'package:open_learning_smart_tv/domain/use_cases/community/add_comment_use_case.dart'
    as _i237;
import 'package:open_learning_smart_tv/domain/use_cases/community/delete_comment_use_case.dart'
    as _i238;
import 'package:open_learning_smart_tv/domain/use_cases/community/edit_comment_use_case.dart'
    as _i233;
import 'package:open_learning_smart_tv/domain/use_cases/community/get_answers_use_case.dart'
    as _i191;
import 'package:open_learning_smart_tv/domain/use_cases/community/get_comments_use_case.dart'
    as _i232;
import 'package:open_learning_smart_tv/domain/use_cases/community/get_community_post_likes_use_case.dart'
    as _i236;
import 'package:open_learning_smart_tv/domain/use_cases/community/get_community_post_use_case.dart'
    as _i234;
import 'package:open_learning_smart_tv/domain/use_cases/community/get_community_posts_use_case.dart'
    as _i229;
import 'package:open_learning_smart_tv/domain/use_cases/community/get_shared_post_use_case.dart'
    as _i230;
import 'package:open_learning_smart_tv/domain/use_cases/community/like_post_use_case.dart'
    as _i228;
import 'package:open_learning_smart_tv/domain/use_cases/community/start_community_tracking_use_case.dart'
    as _i215;
import 'package:open_learning_smart_tv/domain/use_cases/community/stop_community_tracking_use_case.dart'
    as _i214;
import 'package:open_learning_smart_tv/domain/use_cases/community/unlike_post_use_case.dart'
    as _i235;
import 'package:open_learning_smart_tv/domain/use_cases/detail/add_favourites_use_case.dart'
    as _i266;
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_detail_page_use_case.dart'
    as _i271;
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_editions_use_case.dart'
    as _i270;
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_rating_use_case.dart'
    as _i275;
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_related_activities_use_case.dart'
    as _i267;
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_shared_posts_use_case.dart'
    as _i269;
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_teacher_detail_use_case.dart'
    as _i274;
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_tool_url_use_case.dart'
    as _i273;
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_tools_use_case.dart'
    as _i268;
import 'package:open_learning_smart_tv/domain/use_cases/detail/remove_favourite_use_case.dart'
    as _i272;
import 'package:open_learning_smart_tv/domain/use_cases/download/cancel_download_use_case.dart'
    as _i74;
import 'package:open_learning_smart_tv/domain/use_cases/download/delete_download_use_case.dart'
    as _i76;
import 'package:open_learning_smart_tv/domain/use_cases/download/get_stored_download_content_info_use_case.dart'
    as _i27;
import 'package:open_learning_smart_tv/domain/use_cases/download/query_download_manager_use_case.dart'
    as _i13;
import 'package:open_learning_smart_tv/domain/use_cases/download/remove_stored_download_content_info_use_case.dart'
    as _i26;
import 'package:open_learning_smart_tv/domain/use_cases/download/retrieve_download_info_use_case.dart'
    as _i75;
import 'package:open_learning_smart_tv/domain/use_cases/download/schedule_download_use_case.dart'
    as _i73;
import 'package:open_learning_smart_tv/domain/use_cases/download/store_download_content_info_use_case.dart'
    as _i28;
import 'package:open_learning_smart_tv/domain/use_cases/download_ics/download_events_use_case.dart'
    as _i227;
import 'package:open_learning_smart_tv/domain/use_cases/download_ics/get_events_use_case.dart'
    as _i226;
import 'package:open_learning_smart_tv/domain/use_cases/ecm/ecm_register_use_case.dart'
    as _i170;
import 'package:open_learning_smart_tv/domain/use_cases/ecm/get_ecm_disciplines_use_case.dart'
    as _i194;
import 'package:open_learning_smart_tv/domain/use_cases/ecm/get_ecm_professions_use_case.dart'
    as _i195;
import 'package:open_learning_smart_tv/domain/use_cases/edition/edition_register_use_case.dart'
    as _i152;
import 'package:open_learning_smart_tv/domain/use_cases/get_corporate_id_use_case.dart'
    as _i61;
import 'package:open_learning_smart_tv/domain/use_cases/get_menu_structure_use_case.dart'
    as _i165;
import 'package:open_learning_smart_tv/domain/use_cases/get_page_size_strip_use_case.dart'
    as _i12;
import 'package:open_learning_smart_tv/domain/use_cases/get_secure_stored_user_info_ss_use_case.dart'
    as _i35;
import 'package:open_learning_smart_tv/domain/use_cases/get_secure_stored_user_info_use_case.dart'
    as _i14;
import 'package:open_learning_smart_tv/domain/use_cases/get_skip_onboarding_use_case.dart'
    as _i29;
import 'package:open_learning_smart_tv/domain/use_cases/get_skip_tutorial_use_case.dart'
    as _i22;
import 'package:open_learning_smart_tv/domain/use_cases/get_stored_user_self_use_case.dart'
    as _i38;
import 'package:open_learning_smart_tv/domain/use_cases/get_stored_username_use_case.dart'
    as _i20;
import 'package:open_learning_smart_tv/domain/use_cases/get_user_self.dart'
    as _i84;
import 'package:open_learning_smart_tv/domain/use_cases/handler_stored_username_use_case.dart'
    as _i30;
import 'package:open_learning_smart_tv/domain/use_cases/notification/get_notifications_use_case.dart'
    as _i259;
import 'package:open_learning_smart_tv/domain/use_cases/notification/notification_use_case.dart'
    as _i284;
import 'package:open_learning_smart_tv/domain/use_cases/notification/set_notification_read_use_case.dart'
    as _i260;
import 'package:open_learning_smart_tv/domain/use_cases/oauth_token_use_case.dart'
    as _i88;
import 'package:open_learning_smart_tv/domain/use_cases/offline/delete_statement_use_case.dart'
    as _i70;
import 'package:open_learning_smart_tv/domain/use_cases/offline/get_statements_use_case.dart'
    as _i68;
import 'package:open_learning_smart_tv/domain/use_cases/offline/store_statement_use_case.dart'
    as _i69;
import 'package:open_learning_smart_tv/domain/use_cases/openid_config/get_openid_config_use_case.dart'
    as _i87;
import 'package:open_learning_smart_tv/domain/use_cases/openid_config/get_stored_openid_config_use_case.dart'
    as _i37;
import 'package:open_learning_smart_tv/domain/use_cases/openid_config/set_stored_openid_config_use_case.dart'
    as _i36;
import 'package:open_learning_smart_tv/domain/use_cases/page/get_page_structure_use_case.dart'
    as _i252;
import 'package:open_learning_smart_tv/domain/use_cases/post/create_post_use_case.dart'
    as _i247;
import 'package:open_learning_smart_tv/domain/use_cases/post/delete_post_use_case.dart'
    as _i246;
import 'package:open_learning_smart_tv/domain/use_cases/post/edit_post_use_case.dart'
    as _i245;
import 'package:open_learning_smart_tv/domain/use_cases/progress/get_learner_goals_use_case.dart'
    as _i187;
import 'package:open_learning_smart_tv/domain/use_cases/progress/get_learner_progress_use_case.dart'
    as _i188;
import 'package:open_learning_smart_tv/domain/use_cases/progress/get_progress_goals_config_use_case.dart'
    as _i180;
import 'package:open_learning_smart_tv/domain/use_cases/rating/rating_use_case.dart'
    as _i254;
import 'package:open_learning_smart_tv/domain/use_cases/search/clean_local_suggestions_use_case.dart'
    as _i23;
import 'package:open_learning_smart_tv/domain/use_cases/search/get_local_suggestions_use_case.dart'
    as _i24;
import 'package:open_learning_smart_tv/domain/use_cases/search/get_search_results_use_case.dart'
    as _i257;
import 'package:open_learning_smart_tv/domain/use_cases/search/get_suggestions_use_case.dart'
    as _i281;
import 'package:open_learning_smart_tv/domain/use_cases/search/set_local_suggestions_use_case.dart'
    as _i25;
import 'package:open_learning_smart_tv/domain/use_cases/self/set_privacyconsent_use_case.dart'
    as _i83;
import 'package:open_learning_smart_tv/domain/use_cases/session/check_session_use_case.dart'
    as _i92;
import 'package:open_learning_smart_tv/domain/use_cases/session/create_session_use_case.dart'
    as _i93;
import 'package:open_learning_smart_tv/domain/use_cases/session/get_stored_corporate_id_ss_use_case.dart'
    as _i42;
import 'package:open_learning_smart_tv/domain/use_cases/session/get_stored_corporate_id_use_case.dart'
    as _i15;
import 'package:open_learning_smart_tv/domain/use_cases/session/set_initiative_use_case.dart'
    as _i91;
import 'package:open_learning_smart_tv/domain/use_cases/set_secure_stored_user_info_use_case.dart'
    as _i45;
import 'package:open_learning_smart_tv/domain/use_cases/set_skip_onboarding_use_case.dart'
    as _i19;
import 'package:open_learning_smart_tv/domain/use_cases/set_skip_tutorial_use_case.dart'
    as _i21;
import 'package:open_learning_smart_tv/domain/use_cases/set_stored_corporate_id_use_case.dart'
    as _i39;
import 'package:open_learning_smart_tv/domain/use_cases/set_stored_user_self_use_case.dart'
    as _i40;
import 'package:open_learning_smart_tv/domain/use_cases/smart_configurator/get_colors_use_case.dart'
    as _i185;
import 'package:open_learning_smart_tv/domain/use_cases/smart_configurator/get_labels_use_case.dart'
    as _i203;
import 'package:open_learning_smart_tv/domain/use_cases/smart_configurator/get_languages_use_case.dart'
    as _i186;
import 'package:open_learning_smart_tv/domain/use_cases/smart_configurator/get_smart_configuration_use_case.dart'
    as _i184;
import 'package:open_learning_smart_tv/domain/use_cases/smart_configurator/get_stored_smart_configuration_use_case.dart'
    as _i32;
import 'package:open_learning_smart_tv/domain/use_cases/smart_configurator/set_stored_smart_configuration_use_case.dart'
    as _i11;
import 'package:open_learning_smart_tv/domain/use_cases/smart_learning/create_smart_learning_slot_use_case.dart'
    as _i199;
import 'package:open_learning_smart_tv/domain/use_cases/smart_learning/delete_smart_learning_slot_use_case.dart'
    as _i200;
import 'package:open_learning_smart_tv/domain/use_cases/smart_learning/get_smart_learning_slots_use_case.dart'
    as _i201;
import 'package:open_learning_smart_tv/domain/use_cases/smart_learning/update_smart_learning_slot_use_case.dart'
    as _i202;
import 'package:open_learning_smart_tv/domain/use_cases/start_resume_use_case/start_resume_use_case.dart'
    as _i183;
import 'package:open_learning_smart_tv/domain/use_cases/statements/get_state_use_case.dart'
    as _i250;
import 'package:open_learning_smart_tv/domain/use_cases/statements/set_state_use_case.dart'
    as _i248;
import 'package:open_learning_smart_tv/domain/use_cases/statements/statements_use_case.dart'
    as _i249;
import 'package:open_learning_smart_tv/domain/use_cases/strip/get_calendar_strip_use_case.dart'
    as _i244;
import 'package:open_learning_smart_tv/domain/use_cases/strip/get_continue_learning_strip_use_case.dart'
    as _i243;
import 'package:open_learning_smart_tv/domain/use_cases/strip/get_standard_strip_use_case.dart'
    as _i242;
import 'package:open_learning_smart_tv/domain/use_cases/strip/get_wall_strip_content_use_case.dart'
    as _i196;
import 'package:open_learning_smart_tv/domain/use_cases/topics/get_topics_use_case.dart'
    as _i256;
import 'package:open_learning_smart_tv/domain/use_cases/user_profile_image/get_user_image_use_case.dart'
    as _i223;
import 'package:open_learning_smart_tv/domain/use_cases/webview/web_view_player_linkedin_use_case.dart'
    as _i193;
import 'package:open_learning_smart_tv/domain/use_cases/webview/web_view_player_use_case.dart'
    as _i192;
import 'package:open_learning_smart_tv/presentation/app_state/cubit/app_cubit.dart'
    as _i102;
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/download/cubit/local_card_cubit.dart'
    as _i258;
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/download/download_card_status/cubit/local_card_status_cubit.dart'
    as _i297;
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/calendar/cubit/ol_calendar_dialog_cubit.dart'
    as _i241;
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/cubit/ol_download_dialog_cubit.dart'
    as _i276;
import 'package:open_learning_smart_tv/presentation/common/widgets/logo_app_header/cubit/app_logo_cubit.dart'
    as _i6;
import 'package:open_learning_smart_tv/presentation/common/widgets/logo_app_header/logo_header_cubit.dart'
    as _i283;
import 'package:open_learning_smart_tv/presentation/common/widgets/rating/ratings_dialog_cubit.dart'
    as _i288;
import 'package:open_learning_smart_tv/presentation/common/widgets/smart_learning_bottom_sheet/cubit/smart_learning_bottom_sheet_cubit.dart'
    as _i278;
import 'package:open_learning_smart_tv/presentation/common/widgets/topics_filter/cubit/topics_filter_cubit.dart'
    as _i302;
import 'package:open_learning_smart_tv/presentation/common/widgets/user_avatar/cubit/user_avatar_cubit.dart'
    as _i287;
import 'package:open_learning_smart_tv/presentation/community_webview/cubit/community_web_view_page_cubit.dart'
    as _i46;
import 'package:open_learning_smart_tv/presentation/corporate_code/cubit/corporate_code_cubit.dart'
    as _i105;
import 'package:open_learning_smart_tv/presentation/course_detail/cubit/detail_page_cubit.dart'
    as _i301;
import 'package:open_learning_smart_tv/presentation/course_detail/ecm/registration/cubit/ecm_registration_cubit.dart'
    as _i8;
import 'package:open_learning_smart_tv/presentation/course_detail/ecm/registration/steps/first_step/cubit/ecm_first_step_cubit.dart'
    as _i208;
import 'package:open_learning_smart_tv/presentation/course_detail/ecm/registration/steps/second_step/cubit/ecm_second_step_cubit.dart'
    as _i209;
import 'package:open_learning_smart_tv/presentation/course_detail/editions/edition_cubit.dart'
    as _i177;
import 'package:open_learning_smart_tv/presentation/course_detail/favorites/cubit/favourite_cubit.dart'
    as _i300;
import 'package:open_learning_smart_tv/presentation/course_detail/rating/rating_cubit.dart'
    as _i294;
import 'package:open_learning_smart_tv/presentation/course_detail/widgets/download_button/cubit/download_item_cubit.dart'
    as _i261;
import 'package:open_learning_smart_tv/presentation/course_detail/widgets/teachers_sheet/cubit/teacher_detail_sheet_cubit.dart'
    as _i291;
import 'package:open_learning_smart_tv/presentation/course_detail/widgets/tools/tool_item/cubit/tool_item_cubit.dart'
    as _i304;
import 'package:open_learning_smart_tv/presentation/dynamic_content/cubit/dynamic_all_content_cubit.dart'
    as _i286;
import 'package:open_learning_smart_tv/presentation/dynamic_content/cubit/dynamic_content_cubit.dart'
    as _i307;
import 'package:open_learning_smart_tv/presentation/dynamic_content/onboarding/cubit/onboarding_manager_cubit.dart'
    as _i62;
import 'package:open_learning_smart_tv/presentation/dynamic_content/onboarding/cubit/onboarding_sheet_cubit.dart'
    as _i103;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/calendar/cubit/calendar_strip_cubit.dart'
    as _i277;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/comments/cubit/comments_cubit.dart'
    as _i240;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/comments/item/answers/cubit/answers_cubit.dart'
    as _i255;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/cubit/community_wall_cubit.dart'
    as _i265;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/detail/cubit/post_detail_cubit.dart'
    as _i298;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/detail/widgets/add_comment_widget/cubit/add_comment_widget_cubit.dart'
    as _i305;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/post/add_link/cubit/add_link_cubit.dart'
    as _i7;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/post/cubit/post_cubit.dart'
    as _i289;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/widgets/cubit/community_card_cubit.dart'
    as _i279;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/widgets/cubit/like_post_cubit.dart'
    as _i285;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/continue_learning/cubit/continue_learning_strip_cubit.dart'
    as _i262;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/favourites/cubit/favourites_strip_cubit.dart'
    as _i264;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/standard/cubit/standard_strip_cubit.dart'
    as _i282;
import 'package:open_learning_smart_tv/presentation/initiatives/cubit/initiatives_cubit.dart'
    as _i309;
import 'package:open_learning_smart_tv/presentation/languages/cubit/languages_cubit.dart'
    as _i303;
import 'package:open_learning_smart_tv/presentation/login/cubit/login_cubit.dart'
    as _i293;
import 'package:open_learning_smart_tv/presentation/login/mfa/cubit/mfa_cubit.dart'
    as _i100;
import 'package:open_learning_smart_tv/presentation/login/sso/cubit/sso_cubit.dart'
    as _i95;
import 'package:open_learning_smart_tv/presentation/notification/cubit/notification_cubit.dart'
    as _i290;
import 'package:open_learning_smart_tv/presentation/offline_state/offline_cubit.dart'
    as _i280;
import 'package:open_learning_smart_tv/presentation/privacy/cubit/privacy_cubit.dart'
    as _i94;
import 'package:open_learning_smart_tv/presentation/profile/cubit/profile_page_cubit.dart'
    as _i239;
import 'package:open_learning_smart_tv/presentation/profile/download/cubit/download_strip_cubit.dart'
    as _i53;
import 'package:open_learning_smart_tv/presentation/profile/download/wall/cubit/download_wall_cubit.dart'
    as _i308;
import 'package:open_learning_smart_tv/presentation/pwd_recover/cubit/pwd_confirm_page_cubit.dart'
    as _i98;
import 'package:open_learning_smart_tv/presentation/pwd_recover/cubit/pwd_recover_page_cubit.dart'
    as _i101;
import 'package:open_learning_smart_tv/presentation/pwd_reset/cubit/pwd_reset_page_cubit.dart'
    as _i97;
import 'package:open_learning_smart_tv/presentation/pwd_reset/cubit/pwd_set_old_page_cubit.dart'
    as _i5;
import 'package:open_learning_smart_tv/presentation/search/cubit/search_cubit.dart'
    as _i306;
import 'package:open_learning_smart_tv/presentation/search/cubit/suggestions_cubit.dart'
    as _i63;
import 'package:open_learning_smart_tv/presentation/settings/cubit/settings_cubit.dart'
    as _i99;
import 'package:open_learning_smart_tv/presentation/splashscreen/cubit/splash_screen_cubit.dart'
    as _i56;
import 'package:open_learning_smart_tv/presentation/video_player/community/cubit/video_player_thumbnail_cubit.dart'
    as _i90;
import 'package:open_learning_smart_tv/presentation/video_player/cubit/video_player_cubit.dart'
    as _i292;
import 'package:open_learning_smart_tv/presentation/video_player/offline/cubit/video_player_offline_cubit.dart'
    as _i296;
import 'package:open_learning_smart_tv/presentation/wall/cubit/wall_cubit.dart'
    as _i299;
import 'package:open_learning_smart_tv/presentation/web_player/cubit/web_view_page_cubit.dart'
    as _i253;
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels.dart'
    as _i263;
import 'package:open_learning_smart_tv/wrappers/cognito_auth.dart' as _i96;
import 'package:open_learning_smart_tv/wrappers/notification/notification_manager.dart'
    as _i295;
import 'package:open_learning_smart_tv/wrappers/ol_cognito_storage.dart'
    as _i18;
import 'package:open_learning_smart_tv/wrappers/ol_secure_storage.dart' as _i16;
import 'package:open_learning_smart_tv/wrappers/tracking/tracking_manager.dart'
    as _i251;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i10;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

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
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => externalModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i4.LazyDatabase>(() => externalModule.lazyDatabase);
    gh.factory<_i5.PwdSetOldPageCubit>(() => _i5.PwdSetOldPageCubit());
    gh.factory<_i6.AppLogoCubit>(() => _i6.AppLogoCubit());
    gh.factory<_i7.AddLinkCubit>(() => _i7.AddLinkCubit());
    gh.factory<_i8.EcmRegistrationCubit>(() => _i8.EcmRegistrationCubit());
    gh.lazySingleton<_i9.FlutterSecureStorage>(
        () => externalModule.secureStorage);
    gh.lazySingleton<_i10.PrettyDioLogger>(() => externalModule.logInterceptor);
    gh.lazySingleton<_i11.SetStoredSmartConfigurationUseCase>(
        () => _i11.SetStoredSmartConfigurationUseCase());
    gh.lazySingleton<_i12.GetPageSizeStripUseCase>(
        () => _i12.GetPageSizeStripUseCase());
    gh.lazySingleton<_i13.QueryDownloadManagerUseCase>(
        () => _i13.QueryDownloadManagerUseCase());
    gh.lazySingleton<_i14.GetSecureStoredUserInfoUseCase>(
        () => _i14.GetSecureStoredUserInfoUseCase());
    gh.lazySingleton<_i15.GetStoredCorporateIdUseCase>(
        () => _i15.GetStoredCorporateIdUseCase());
    gh.factory<_i16.OlSecureStorage>(
        () => _i16.OlSecureStorage(gh<_i9.FlutterSecureStorage>()));
    gh.lazySingleton<_i17.Env>(
      () => _i17.Test(),
      registerFor: {_dev},
    );
    gh.factory<_i18.OlCognitoStorage>(
        () => _i18.OlCognitoStorage(gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i19.SetSkipOnboardingUseCase>(
        () => _i19.SetSkipOnboardingUseCase(gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i20.GetStoredUsernameUseCase>(
        () => _i20.GetStoredUsernameUseCase(gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i21.SetSkipTutorialUseCase>(
        () => _i21.SetSkipTutorialUseCase(gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i22.GetSkipTutorialUseCase>(
        () => _i22.GetSkipTutorialUseCase(gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i23.CleanLocalSuggestionsUseCase>(
        () => _i23.CleanLocalSuggestionsUseCase(gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i24.GetLocalSuggestionsUseCase>(
        () => _i24.GetLocalSuggestionsUseCase(gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i25.SetLocalSuggestionsUseCase>(
        () => _i25.SetLocalSuggestionsUseCase(gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i26.RemoveStoredDownloadContentInfoUseCase>(() =>
        _i26.RemoveStoredDownloadContentInfoUseCase(
            gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i27.GetStoredDownloadContentInfoUseCase>(() =>
        _i27.GetStoredDownloadContentInfoUseCase(gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i28.StoreDownloadContentInfoUseCase>(() =>
        _i28.StoreDownloadContentInfoUseCase(gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i29.GetSkipOnboardingUseCase>(
        () => _i29.GetSkipOnboardingUseCase(gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i30.HandlerStoredUsernameUseCase>(
        () => _i30.HandlerStoredUsernameUseCase(gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i31.AppDatabase>(
        () => _i31.AppDatabase(gh<_i4.LazyDatabase>()));
    gh.lazySingleton<_i32.GetStoredSmartConfigurationUseCase>(
        () => _i32.GetStoredSmartConfigurationUseCase(gh<_i17.Env>()));
    gh.factory<_i33.Dio>(
      () => externalModule.dioDefault(
        gh<_i10.PrettyDioLogger>(),
        gh<_i17.Env>(),
      ),
      instanceName: 'default',
    );
    gh.factory<_i33.Dio>(
      () => externalModule.dioCognito(
        gh<_i10.PrettyDioLogger>(),
        gh<_i17.Env>(),
      ),
      instanceName: 'cognitoAuthClient',
    );
    gh.factory<_i33.Dio>(
      () => externalModule.dioDynamic(
        gh<_i10.PrettyDioLogger>(),
        gh<_i17.Env>(),
      ),
      instanceName: 'dynamicUrlClient',
    );
    gh.lazySingleton<_i34.ClearSecureStoredUseCase>(
        () => _i34.ClearSecureStoredUseCase(gh<_i16.OlSecureStorage>()));
    gh.lazySingleton<_i35.GetSecureStoredUserInfoSsUseCase>(() =>
        _i35.GetSecureStoredUserInfoSsUseCase(gh<_i16.OlSecureStorage>()));
    gh.lazySingleton<_i36.SetStoredOpenidConfigUseCase>(
        () => _i36.SetStoredOpenidConfigUseCase(gh<_i16.OlSecureStorage>()));
    gh.lazySingleton<_i37.GetStoredOpenidConfigUseCase>(
        () => _i37.GetStoredOpenidConfigUseCase(gh<_i16.OlSecureStorage>()));
    gh.lazySingleton<_i38.GetStoredUserSelfUseCase>(
        () => _i38.GetStoredUserSelfUseCase(gh<_i16.OlSecureStorage>()));
    gh.lazySingleton<_i39.SetStoredCorporateIdUseCase>(
        () => _i39.SetStoredCorporateIdUseCase(gh<_i16.OlSecureStorage>()));
    gh.lazySingleton<_i40.SetStoredUserSelfUseCase>(
        () => _i40.SetStoredUserSelfUseCase(gh<_i16.OlSecureStorage>()));
    gh.lazySingleton<_i41.ClearSecureStoredUserInfoUseCase>(() =>
        _i41.ClearSecureStoredUserInfoUseCase(gh<_i16.OlSecureStorage>()));
    gh.lazySingleton<_i41.ClearSecureStoredInitiativeUseCase>(() =>
        _i41.ClearSecureStoredInitiativeUseCase(gh<_i16.OlSecureStorage>()));
    gh.lazySingleton<_i42.GetStoredCorporateIdSsUseCase>(
        () => _i42.GetStoredCorporateIdSsUseCase(gh<_i16.OlSecureStorage>()));
    gh.lazySingleton<_i43.DownloadDataSource>(() => _i44.DownloadDataSourceImpl(
        gh<_i33.Dio>(instanceName: 'dynamicUrlClient')));
    gh.lazySingleton<_i45.SetSecureStoredUserInfoUseCase>(
        () => _i45.SetSecureStoredUserInfoUseCase(
              gh<_i16.OlSecureStorage>(),
              gh<_i3.SharedPreferences>(),
            ));
    gh.factory<_i46.CommunityWebViewPageCubit>(
        () => _i46.CommunityWebViewPageCubit(
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
              gh<_i32.GetStoredSmartConfigurationUseCase>(),
            ));
    gh.lazySingleton<_i17.Env>(
      () => _i17.Prod(),
      registerFor: {_production},
    );
    gh.lazySingleton<_i47.LanguageDataSource>(
        () => _i48.LanguageSourceImpl(gh<_i33.Dio>(instanceName: 'default')));
    gh.lazySingleton<_i49.SessionDataSource>(() =>
        _i50.SessionDataSourceImpl(gh<_i33.Dio>(instanceName: 'default')));
    gh.lazySingleton<_i51.CorporateCodeDataSource>(() =>
        _i52.CorporateCodeDataSourceImpl(
            gh<_i33.Dio>(instanceName: 'default')));
    gh.lazySingleton<_i53.DownloadStripCubit>(() => _i53.DownloadStripCubit(
          gh<_i13.QueryDownloadManagerUseCase>(),
          gh<_i27.GetStoredDownloadContentInfoUseCase>(),
        ));
    gh.lazySingleton<_i54.AuthDataSource>(() => _i55.AuthDataSourceImpl(
        gh<_i33.Dio>(instanceName: 'cognitoAuthClient')));
    gh.factory<_i56.SplashScreenCubit>(() =>
        _i56.SplashScreenCubit(gh<_i35.GetSecureStoredUserInfoSsUseCase>()));
    gh.lazySingleton<_i57.OfflineStatementsDao>(
        () => _i57.OfflineStatementsDao(gh<_i31.AppDatabase>()));
    gh.lazySingleton<_i58.LocalNotificationsDao>(
        () => _i58.LocalNotificationsDao(gh<_i31.AppDatabase>()));
    gh.lazySingleton<_i59.CorporateCodeRepository>(() =>
        _i60.CorporateCodeRepositoryImpl(gh<_i51.CorporateCodeDataSource>()));
    gh.lazySingleton<_i61.GetCorporateIdUseCase>(
        () => _i61.GetCorporateIdUseCase(gh<_i59.CorporateCodeRepository>()));
    gh.factory<_i62.OnboardingManagerCubit>(() => _i62.OnboardingManagerCubit(
          gh<_i38.GetStoredUserSelfUseCase>(),
          gh<_i29.GetSkipOnboardingUseCase>(),
        ));
    gh.factory<_i63.SuggestionsCubit>(() => _i63.SuggestionsCubit(
          gh<_i24.GetLocalSuggestionsUseCase>(),
          gh<_i25.SetLocalSuggestionsUseCase>(),
          gh<_i23.CleanLocalSuggestionsUseCase>(),
        ));
    gh.lazySingleton<_i64.OpenidConfigDataSource>(() =>
        _i65.OpenidConfigDataSourceImpl(gh<_i33.Dio>(instanceName: 'default')));
    gh.lazySingleton<_i66.UserDataSource>(
        () => _i67.UserDataSourceImpl(gh<_i33.Dio>(instanceName: 'default')));
    gh.lazySingleton<_i68.GetStatementsUseCase>(
        () => _i68.GetStatementsUseCase(gh<_i57.OfflineStatementsDao>()));
    gh.lazySingleton<_i69.StoreStatementUseCase>(
        () => _i69.StoreStatementUseCase(gh<_i57.OfflineStatementsDao>()));
    gh.lazySingleton<_i70.DeleteStatementsUseCase>(
        () => _i70.DeleteStatementsUseCase(gh<_i57.OfflineStatementsDao>()));
    gh.lazySingleton<_i71.DownloadlRepository>(
        () => _i72.DownloadlRepositoryImpl(
              gh<_i43.DownloadDataSource>(),
              gh<_i17.Env>(),
            ));
    gh.lazySingleton<_i73.ScheduleDownloadUseCase>(
        () => _i73.ScheduleDownloadUseCase(gh<_i71.DownloadlRepository>()));
    gh.lazySingleton<_i74.CancelDownloadUseCase>(
        () => _i74.CancelDownloadUseCase(gh<_i71.DownloadlRepository>()));
    gh.lazySingleton<_i75.RetrieveDownloadInfoUseCase>(
        () => _i75.RetrieveDownloadInfoUseCase(gh<_i71.DownloadlRepository>()));
    gh.lazySingleton<_i76.DeleteDownloadUseCase>(
        () => _i76.DeleteDownloadUseCase(gh<_i71.DownloadlRepository>()));
    gh.lazySingleton<_i77.SessionRepository>(
        () => _i78.SessionRepositoryImpl(gh<_i49.SessionDataSource>()));
    gh.lazySingleton<_i79.UserRepository>(
        () => _i80.UserRepositoryImpl(gh<_i66.UserDataSource>()));
    gh.lazySingleton<_i81.OpenidConfigRepository>(() =>
        _i82.OpenidConfigRepositoryImpl(gh<_i64.OpenidConfigDataSource>()));
    gh.lazySingleton<_i83.SetPrivacyConsentUseCase>(
        () => _i83.SetPrivacyConsentUseCase(gh<_i79.UserRepository>()));
    gh.lazySingleton<_i84.GetUserSelfUseCase>(
        () => _i84.GetUserSelfUseCase(gh<_i79.UserRepository>()));
    gh.lazySingleton<_i85.AuthRepository>(() => _i86.AuthRepositoryImpl(
          gh<_i54.AuthDataSource>(),
          gh<_i37.GetStoredOpenidConfigUseCase>(),
        ));
    gh.lazySingleton<_i87.GetOpenidConfigUseCase>(
        () => _i87.GetOpenidConfigUseCase(gh<_i81.OpenidConfigRepository>()));
    gh.lazySingleton<_i88.OauthTokenUseCase>(
        () => _i88.OauthTokenUseCase(gh<_i85.AuthRepository>()));
    gh.lazySingleton<_i89.CleanLocalDatabaseUseCase>(
        () => _i89.CleanLocalDatabaseUseCase(
              gh<_i31.AppDatabase>(),
              gh<_i3.SharedPreferences>(),
              gh<_i13.QueryDownloadManagerUseCase>(),
              gh<_i26.RemoveStoredDownloadContentInfoUseCase>(),
              gh<_i74.CancelDownloadUseCase>(),
              gh<_i76.DeleteDownloadUseCase>(),
            ));
    gh.factory<_i90.VideoPlayerThumbnailCubit>(() =>
        _i90.VideoPlayerThumbnailCubit(gh<_i75.RetrieveDownloadInfoUseCase>()));
    gh.lazySingleton<_i91.SetInitiativeUseCase>(
        () => _i91.SetInitiativeUseCase(gh<_i77.SessionRepository>()));
    gh.lazySingleton<_i92.CheckSessionUseCase>(
        () => _i92.CheckSessionUseCase(gh<_i77.SessionRepository>()));
    gh.lazySingleton<_i93.CreateSessionUseCase>(
        () => _i93.CreateSessionUseCase(gh<_i77.SessionRepository>()));
    gh.factory<_i94.PrivacyCubit>(
        () => _i94.PrivacyCubit(gh<_i83.SetPrivacyConsentUseCase>()));
    gh.factory<_i95.SsoCubit>(() => _i95.SsoCubit(
          gh<_i18.OlCognitoStorage>(),
          gh<_i88.OauthTokenUseCase>(),
          gh<_i93.CreateSessionUseCase>(),
          gh<_i84.GetUserSelfUseCase>(),
          gh<_i15.GetStoredCorporateIdUseCase>(),
          gh<_i37.GetStoredOpenidConfigUseCase>(),
          gh<_i3.SharedPreferences>(),
          gh<_i17.Env>(),
        ));
    gh.lazySingleton<_i96.CognitoAuthManager>(() => _i96.CognitoAuthManager(
          gh<_i18.OlCognitoStorage>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
          gh<_i91.SetInitiativeUseCase>(),
          gh<_i45.SetSecureStoredUserInfoUseCase>(),
          gh<_i93.CreateSessionUseCase>(),
          gh<_i92.CheckSessionUseCase>(),
          gh<_i15.GetStoredCorporateIdUseCase>(),
        ));
    gh.factory<_i97.PwdResetCubit>(
        () => _i97.PwdResetCubit(gh<_i96.CognitoAuthManager>()));
    gh.factory<_i98.PwdConfirmCubit>(
        () => _i98.PwdConfirmCubit(gh<_i96.CognitoAuthManager>()));
    gh.factory<_i99.SettingsCubit>(() => _i99.SettingsCubit(
          gh<_i32.GetStoredSmartConfigurationUseCase>(),
          gh<_i96.CognitoAuthManager>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
          gh<_i41.ClearSecureStoredInitiativeUseCase>(),
          gh<_i84.GetUserSelfUseCase>(),
          gh<_i3.SharedPreferences>(),
          gh<_i17.Env>(),
        ));
    gh.factory<_i100.MfaCubit>(() => _i100.MfaCubit(
          gh<_i96.CognitoAuthManager>(),
          gh<_i30.HandlerStoredUsernameUseCase>(),
          gh<_i93.CreateSessionUseCase>(),
          gh<_i84.GetUserSelfUseCase>(),
        ));
    gh.factory<_i101.PwdRecoverCubit>(() => _i101.PwdRecoverCubit(
          gh<_i96.CognitoAuthManager>(),
          gh<_i20.GetStoredUsernameUseCase>(),
        ));
    gh.singleton<_i102.AppCubit>(() => _i102.AppCubit(
          gh<_i96.CognitoAuthManager>(),
          gh<_i34.ClearSecureStoredUseCase>(),
          gh<_i3.SharedPreferences>(),
        ));
    gh.factory<_i103.OnboardingSheetCubit>(() => _i103.OnboardingSheetCubit(
          gh<_i19.SetSkipOnboardingUseCase>(),
          gh<_i21.SetSkipTutorialUseCase>(),
          gh<_i102.AppCubit>(),
        ));
    gh.lazySingleton<_i104.AuthenticationInterceptor>(
        () => _i104.AuthenticationInterceptor(
              gh<_i96.CognitoAuthManager>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
              gh<_i102.AppCubit>(),
              gh<_i33.Dio>(instanceName: 'default'),
            ));
    gh.factory<_i105.CorporateCodeCubit>(() => _i105.CorporateCodeCubit(
          gh<_i17.Env>(),
          gh<_i39.SetStoredCorporateIdUseCase>(),
          gh<_i61.GetCorporateIdUseCase>(),
          gh<_i96.CognitoAuthManager>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
          gh<_i92.CheckSessionUseCase>(),
          gh<_i102.AppCubit>(),
          gh<_i84.GetUserSelfUseCase>(),
          gh<_i93.CreateSessionUseCase>(),
          gh<_i45.SetSecureStoredUserInfoUseCase>(),
          gh<_i87.GetOpenidConfigUseCase>(),
          gh<_i36.SetStoredOpenidConfigUseCase>(),
          gh<_i34.ClearSecureStoredUseCase>(),
          gh<_i42.GetStoredCorporateIdSsUseCase>(),
          gh<_i35.GetSecureStoredUserInfoSsUseCase>(),
        ));
    gh.factory<_i33.Dio>(
      () => externalModule.dioAuthenticated(
        gh<_i104.AuthenticationInterceptor>(),
        gh<_i10.PrettyDioLogger>(),
        gh<_i17.Env>(),
      ),
      instanceName: 'authenticated',
    );
    gh.lazySingleton<_i106.EcmDataSource>(() =>
        _i107.EcmDataSourceImpl(gh<_i33.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i108.EditionDataSource>(() => _i109.EditionDataSourceImpl(
        gh<_i33.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i110.PageDataSource>(() =>
        _i111.PageDataSourceImpl(gh<_i33.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i112.TopicsDataSource>(() => _i113.TopicsDataSourceImpl(
        gh<_i33.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i114.SmartConfiguratorDataSource>(() =>
        _i115.SmartConfiguratorDataSourceImpl(
            gh<_i33.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i116.UserImageDataSource>(() =>
        _i117.UserImageDataSourceImpl(
            gh<_i33.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i118.AppResourceDataSource>(() =>
        _i119.AppResourceDataSourceImpl(
            gh<_i33.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i120.EditionRepository>(
        () => _i121.EditionRepositoryImpl(gh<_i108.EditionDataSource>()));
    gh.lazySingleton<_i122.StartResumeDataSource>(() =>
        _i123.StartResumeDataSourceImpl(
            gh<_i33.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i124.SmartLearningDataSource>(() =>
        _i125.SmartLearningDataSourceImpl(
            gh<_i33.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i126.CommunityDataSource>(() =>
        _i127.CommunityDataSourceImpl(
            gh<_i33.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i128.StatementsDataSource>(() =>
        _i129.StatementsDataSourceImpl(
            gh<_i33.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i130.WebPlayerDataSource>(() =>
        _i131.WebPlayerDataSourceImpl(
            gh<_i33.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i132.LearnerProgressDataSource>(() =>
        _i133.LearnerProgressDataSourceImpl(
            gh<_i33.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i134.NotificationDataSource>(() =>
        _i135.NotificationDataSourceImpl(
            gh<_i33.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i136.DownloadIcsDataSource>(() =>
        _i137.DownloadIcsDataSourceImpl(
            gh<_i33.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i138.SearchDataSource>(() => _i139.SearchDataSourceImpl(
        gh<_i33.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i140.RatingDataSource>(() => _i141.RatingDataSourceImpl(
        gh<_i33.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i142.MenuDataSource>(() =>
        _i143.MenuDataSourceImpl(gh<_i33.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i144.StripDataSource>(() =>
        _i145.StripDataSourceImpl(gh<_i33.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i146.AutoEnrollmentDataSource>(() =>
        _i147.AutoEnrollmentDataSourceImpl(
            gh<_i33.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i148.WebViewPlayerRepository>(
        () => _i149.WebPlayerRepositoryImpl(gh<_i130.WebPlayerDataSource>()));
    gh.lazySingleton<_i150.PostDataSource>(() =>
        _i151.PostDataSourceImpl(gh<_i33.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i152.EditionRegisterUseCase>(
        () => _i152.EditionRegisterUseCase(
              gh<_i120.EditionRepository>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
              gh<_i15.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i153.LearnerProgressRepository>(() =>
        _i154.LearnerProgressRepositoryImpl(
            gh<_i132.LearnerProgressDataSource>()));
    gh.lazySingleton<_i155.DetailDataSource>(() => _i156.DetailDataSourceImpl(
        gh<_i33.Dio>(instanceName: 'authenticated')));
    gh.lazySingleton<_i157.StartResumeRepository>(() =>
        _i158.StartResumeRepositoryImpl(gh<_i122.StartResumeDataSource>()));
    gh.lazySingleton<_i159.MenuRepository>(
        () => _i160.MenuRepositoryImpl(gh<_i142.MenuDataSource>()));
    gh.lazySingleton<_i161.WallRepository>(
        () => _i162.WallRepositoryImpl(gh<_i144.StripDataSource>()));
    gh.lazySingleton<_i163.StripRepository>(
        () => _i164.StripRepositoryImpl(gh<_i144.StripDataSource>()));
    gh.lazySingleton<_i165.GetMenuStructureUseCase>(
        () => _i165.GetMenuStructureUseCase(gh<_i159.MenuRepository>()));
    gh.lazySingleton<_i166.CommunityRepository>(
        () => _i167.CommunityRepositoryImpl(gh<_i126.CommunityDataSource>()));
    gh.lazySingleton<_i168.EcmRepository>(
        () => _i169.EcmRepositoryImpl(gh<_i106.EcmDataSource>()));
    gh.factory<_i170.EcmRegisterUseCase>(() => _i170.EcmRegisterUseCase(
          gh<_i168.EcmRepository>(),
          gh<_i15.GetStoredCorporateIdUseCase>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i171.AutoEnrollmentRepository>(() =>
        _i172.AutoEnrollmentRepositoryImpl(
            gh<_i146.AutoEnrollmentDataSource>()));
    gh.lazySingleton<_i173.PageRepository>(
        () => _i174.PageRepositoryImpl(gh<_i110.PageDataSource>()));
    gh.lazySingleton<_i175.UserImageRepository>(
        () => _i176.UserImageRepositoryImpl(gh<_i116.UserImageDataSource>()));
    gh.factory<_i177.EditionCubit>(
        () => _i177.EditionCubit(gh<_i152.EditionRegisterUseCase>()));
    gh.lazySingleton<_i178.SmartConfiguratorRepository>(
        () => _i179.SmartConfiguratorRepositoryImpl(
              gh<_i114.SmartConfiguratorDataSource>(),
              gh<_i47.LanguageDataSource>(),
            ));
    gh.lazySingleton<_i180.GetProgressGoalsConfigUseCase>(
        () => _i180.GetProgressGoalsConfigUseCase(
              gh<_i153.LearnerProgressRepository>(),
              gh<_i15.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i181.TopicsRepository>(
        () => _i182.TopicsRepositoryImpl(gh<_i112.TopicsDataSource>()));
    gh.lazySingleton<_i183.StartResumeUseCase>(() => _i183.StartResumeUseCase(
          gh<_i157.StartResumeRepository>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
          gh<_i15.GetStoredCorporateIdUseCase>(),
        ));
    gh.lazySingleton<_i184.GetSmartConfigurationUseCase>(() =>
        _i184.GetSmartConfigurationUseCase(
            gh<_i178.SmartConfiguratorRepository>()));
    gh.lazySingleton<_i185.GetColorsUseCase>(
        () => _i185.GetColorsUseCase(gh<_i178.SmartConfiguratorRepository>()));
    gh.lazySingleton<_i186.GetLanguagesUseCase>(() =>
        _i186.GetLanguagesUseCase(gh<_i178.SmartConfiguratorRepository>()));
    gh.lazySingleton<_i187.GetLearnerGoalsUseCase>(
        () => _i187.GetLearnerGoalsUseCase(
              gh<_i153.LearnerProgressRepository>(),
              gh<_i15.GetStoredCorporateIdUseCase>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i188.GetLearnerProgressUseCase>(
        () => _i188.GetLearnerProgressUseCase(
              gh<_i153.LearnerProgressRepository>(),
              gh<_i15.GetStoredCorporateIdUseCase>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i189.SmartLearningRepository>(() =>
        _i190.SmartLearningRepositoryImpl(gh<_i124.SmartLearningDataSource>()));
    gh.lazySingleton<_i191.GetAnswersUseCase>(
        () => _i191.GetAnswersUseCase(gh<_i166.CommunityRepository>()));
    gh.lazySingleton<_i192.WebViewPlayerUseCase>(
        () => _i192.WebViewPlayerUseCase(
              gh<_i148.WebViewPlayerRepository>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
              gh<_i15.GetStoredCorporateIdUseCase>(),
              gh<_i32.GetStoredSmartConfigurationUseCase>(),
              gh<_i17.Env>(),
            ));
    gh.lazySingleton<_i193.WebViewPlayerLinkedinUseCase>(
        () => _i193.WebViewPlayerLinkedinUseCase(
              gh<_i148.WebViewPlayerRepository>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
              gh<_i15.GetStoredCorporateIdUseCase>(),
              gh<_i32.GetStoredSmartConfigurationUseCase>(),
              gh<_i17.Env>(),
            ));
    gh.factory<_i194.GetEcmDisciplinesUseCase>(
        () => _i194.GetEcmDisciplinesUseCase(gh<_i168.EcmRepository>()));
    gh.factory<_i195.GetEcmProfessionsUseCase>(
        () => _i195.GetEcmProfessionsUseCase(gh<_i168.EcmRepository>()));
    gh.lazySingleton<_i196.GetWallStripContentUseCase>(
        () => _i196.GetWallStripContentUseCase(
              gh<_i161.WallRepository>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
              gh<_i15.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i197.RatingRepository>(
        () => _i198.RatingRepositoryImpl(gh<_i140.RatingDataSource>()));
    gh.lazySingleton<_i199.CreateSmartLearningSlotUseCase>(() =>
        _i199.CreateSmartLearningSlotUseCase(
            gh<_i189.SmartLearningRepository>()));
    gh.lazySingleton<_i200.DeleteSmartLearningSlotUseCase>(() =>
        _i200.DeleteSmartLearningSlotUseCase(
            gh<_i189.SmartLearningRepository>()));
    gh.lazySingleton<_i201.GetSmartLearningSlotsUseCase>(() =>
        _i201.GetSmartLearningSlotsUseCase(
            gh<_i189.SmartLearningRepository>()));
    gh.lazySingleton<_i202.UpdateSmartLearningSlotUseCase>(() =>
        _i202.UpdateSmartLearningSlotUseCase(
            gh<_i189.SmartLearningRepository>()));
    gh.lazySingleton<_i203.GetLabelsUseCase>(() => _i203.GetLabelsUseCase(
          gh<_i178.SmartConfiguratorRepository>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
          gh<_i15.GetStoredCorporateIdUseCase>(),
        ));
    gh.lazySingleton<_i204.AppResourceRepository>(() =>
        _i205.AppResourceRepositoryImpl(gh<_i118.AppResourceDataSource>()));
    gh.lazySingleton<_i206.StatementsRepository>(
        () => _i207.StatementsRepositoryImpl(gh<_i128.StatementsDataSource>()));
    gh.factory<_i208.EcmFirstStepCubit>(() => _i208.EcmFirstStepCubit(
          gh<_i195.GetEcmProfessionsUseCase>(),
          gh<_i194.GetEcmDisciplinesUseCase>(),
        ));
    gh.factory<_i209.EcmSecondStepCubit>(
        () => _i209.EcmSecondStepCubit(gh<_i170.EcmRegisterUseCase>()));
    gh.lazySingleton<_i210.NotificationRepository>(() =>
        _i211.NotificationRepositoryImpl(gh<_i134.NotificationDataSource>()));
    gh.lazySingleton<_i212.AutoEnrollmentUseCase>(
        () => _i212.AutoEnrollmentUseCase(
              gh<_i171.AutoEnrollmentRepository>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
              gh<_i15.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i213.BottomEnrollmentUseCase>(
        () => _i213.BottomEnrollmentUseCase(
              gh<_i171.AutoEnrollmentRepository>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
              gh<_i15.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i214.StopCommunityTrackingUseCase>(
        () => _i214.StopCommunityTrackingUseCase(
              gh<_i17.Env>(),
              gh<_i15.GetStoredCorporateIdUseCase>(),
              gh<_i206.StatementsRepository>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i215.StartCommunityTrackingUseCase>(
        () => _i215.StartCommunityTrackingUseCase(
              gh<_i17.Env>(),
              gh<_i15.GetStoredCorporateIdUseCase>(),
              gh<_i206.StatementsRepository>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i216.GetAppresourceUseCase>(
        () => _i216.GetAppresourceUseCase(gh<_i204.AppResourceRepository>()));
    gh.lazySingleton<_i217.DetailRepository>(
        () => _i218.DetailRepositoryImpl(gh<_i155.DetailDataSource>()));
    gh.lazySingleton<_i219.DownloadIcsRepository>(
        () => _i220.DownloadIcsRepositoryImpl(
              gh<_i136.DownloadIcsDataSource>(),
              gh<_i15.GetStoredCorporateIdUseCase>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i221.PostRepository>(
        () => _i222.PostRepositoryRepositoryImpl(gh<_i150.PostDataSource>()));
    gh.lazySingleton<_i223.GetUserImageUseCase>(
        () => _i223.GetUserImageUseCase(gh<_i175.UserImageRepository>()));
    gh.lazySingleton<_i224.SearchRepository>(
        () => _i225.SearchRepositoryImpl(gh<_i138.SearchDataSource>()));
    gh.lazySingleton<_i226.GetEventsUseCase>(
        () => _i226.GetEventsUseCase(gh<_i219.DownloadIcsRepository>()));
    gh.lazySingleton<_i227.DownloadEventsUseCase>(
        () => _i227.DownloadEventsUseCase(gh<_i219.DownloadIcsRepository>()));
    gh.lazySingleton<_i228.LikePostUseCase>(() => _i228.LikePostUseCase(
          gh<_i166.CommunityRepository>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i229.GetCommunityPostsUseCase>(
        () => _i229.GetCommunityPostsUseCase(
              gh<_i166.CommunityRepository>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i230.GetSharedPostUseCase>(
        () => _i230.GetSharedPostUseCase(
              gh<_i166.CommunityRepository>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i231.AddAnswerUseCase>(() => _i231.AddAnswerUseCase(
          gh<_i166.CommunityRepository>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i232.GetCommentsUseCase>(() => _i232.GetCommentsUseCase(
          gh<_i166.CommunityRepository>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i233.EditCommentUseCase>(() => _i233.EditCommentUseCase(
          gh<_i166.CommunityRepository>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i234.GetCommunityPostUseCase>(
        () => _i234.GetCommunityPostUseCase(
              gh<_i166.CommunityRepository>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i235.UnlikePostUseCase>(() => _i235.UnlikePostUseCase(
          gh<_i166.CommunityRepository>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i236.GetCommunityPostLikesUseCase>(
        () => _i236.GetCommunityPostLikesUseCase(
              gh<_i166.CommunityRepository>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.lazySingleton<_i237.AddCommentUseCase>(() => _i237.AddCommentUseCase(
          gh<_i166.CommunityRepository>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i238.DeleteCommentUseCase>(
        () => _i238.DeleteCommentUseCase(
              gh<_i166.CommunityRepository>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
            ));
    gh.factory<_i239.ProfilePageCubit>(() => _i239.ProfilePageCubit(
          gh<_i223.GetUserImageUseCase>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
          gh<_i180.GetProgressGoalsConfigUseCase>(),
          gh<_i187.GetLearnerGoalsUseCase>(),
          gh<_i188.GetLearnerProgressUseCase>(),
        ));
    gh.factory<_i240.CommentsCubit>(
        () => _i240.CommentsCubit(gh<_i232.GetCommentsUseCase>()));
    gh.factory<_i241.OlCalendarDialogCubit>(
        () => _i241.OlCalendarDialogCubit(gh<_i226.GetEventsUseCase>()));
    gh.lazySingleton<_i242.GetStandardStripUseCase>(
        () => _i242.GetStandardStripUseCase(
              gh<_i163.StripRepository>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
              gh<_i15.GetStoredCorporateIdUseCase>(),
              gh<_i12.GetPageSizeStripUseCase>(),
            ));
    gh.lazySingleton<_i243.GetContinueLearningStripUseCase>(
        () => _i243.GetContinueLearningStripUseCase(
              gh<_i163.StripRepository>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
              gh<_i15.GetStoredCorporateIdUseCase>(),
              gh<_i12.GetPageSizeStripUseCase>(),
            ));
    gh.lazySingleton<_i244.GetCalendarStripUseCase>(
        () => _i244.GetCalendarStripUseCase(
              gh<_i163.StripRepository>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
              gh<_i15.GetStoredCorporateIdUseCase>(),
              gh<_i12.GetPageSizeStripUseCase>(),
            ));
    gh.lazySingleton<_i245.EditPostUseCase>(() => _i245.EditPostUseCase(
          gh<_i221.PostRepository>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i246.DeletePostUseCase>(() => _i246.DeletePostUseCase(
          gh<_i221.PostRepository>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i247.CreatePostUseCase>(() => _i247.CreatePostUseCase(
          gh<_i221.PostRepository>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i248.SetStateUseCase>(() => _i248.SetStateUseCase(
          gh<_i17.Env>(),
          gh<_i206.StatementsRepository>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
          gh<_i15.GetStoredCorporateIdUseCase>(),
        ));
    gh.lazySingleton<_i249.StatementsUseCase>(() => _i249.StatementsUseCase(
          gh<_i17.Env>(),
          gh<_i206.StatementsRepository>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
          gh<_i15.GetStoredCorporateIdUseCase>(),
        ));
    gh.lazySingleton<_i250.GetStateUseCase>(() => _i250.GetStateUseCase(
          gh<_i17.Env>(),
          gh<_i206.StatementsRepository>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
          gh<_i15.GetStoredCorporateIdUseCase>(),
        ));
    gh.lazySingleton<_i251.TrackingManager>(() => _i251.TrackingManager(
          gh<_i215.StartCommunityTrackingUseCase>(),
          gh<_i214.StopCommunityTrackingUseCase>(),
        ));
    gh.lazySingleton<_i252.GetPageStructureUseCase>(
        () => _i252.GetPageStructureUseCase(
              gh<_i173.PageRepository>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
              gh<_i15.GetStoredCorporateIdUseCase>(),
            ));
    gh.factory<_i253.WebViewPageCubit>(() => _i253.WebViewPageCubit(
          gh<_i17.Env>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
          gh<_i96.CognitoAuthManager>(),
          gh<_i192.WebViewPlayerUseCase>(),
          gh<_i193.WebViewPlayerLinkedinUseCase>(),
        ));
    gh.lazySingleton<_i254.RatingUseCase>(() => _i254.RatingUseCase(
          gh<_i197.RatingRepository>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
          gh<_i15.GetStoredCorporateIdUseCase>(),
        ));
    gh.factory<_i255.AnswersCubit>(
        () => _i255.AnswersCubit(gh<_i191.GetAnswersUseCase>()));
    gh.lazySingleton<_i256.GetTopicsUseCase>(
        () => _i256.GetTopicsUseCase(gh<_i181.TopicsRepository>()));
    gh.lazySingleton<_i257.GetSearchResultsUseCase>(
        () => _i257.GetSearchResultsUseCase(
              gh<_i224.SearchRepository>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
              gh<_i15.GetStoredCorporateIdUseCase>(),
            ));
    gh.factory<_i258.LocalCardCubit>(() => _i258.LocalCardCubit(
          gh<_i27.GetStoredDownloadContentInfoUseCase>(),
          gh<_i28.StoreDownloadContentInfoUseCase>(),
          gh<_i250.GetStateUseCase>(),
        ));
    gh.lazySingleton<_i259.GetNotificationsUseCase>(() =>
        _i259.GetNotificationsUseCase(gh<_i210.NotificationRepository>()));
    gh.lazySingleton<_i260.SetNotificationsUseCase>(() =>
        _i260.SetNotificationsUseCase(gh<_i210.NotificationRepository>()));
    gh.factory<_i261.DownloadItemCubit>(() => _i261.DownloadItemCubit(
          gh<_i73.ScheduleDownloadUseCase>(),
          gh<_i75.RetrieveDownloadInfoUseCase>(),
          gh<_i28.StoreDownloadContentInfoUseCase>(),
          gh<_i27.GetStoredDownloadContentInfoUseCase>(),
          gh<_i74.CancelDownloadUseCase>(),
          gh<_i26.RemoveStoredDownloadContentInfoUseCase>(),
          gh<_i76.DeleteDownloadUseCase>(),
          gh<_i13.QueryDownloadManagerUseCase>(),
          gh<_i183.StartResumeUseCase>(),
          gh<_i53.DownloadStripCubit>(),
          gh<_i250.GetStateUseCase>(),
        ));
    gh.lazySingleton<_i262.ContinueLearningStripCubit>(() =>
        _i262.ContinueLearningStripCubit(
            gh<_i243.GetContinueLearningStripUseCase>()));
    gh.lazySingleton<_i263.RemoteLabels>(() => _i263.RemoteLabels(
          gh<_i186.GetLanguagesUseCase>(),
          gh<_i203.GetLabelsUseCase>(),
          gh<_i3.SharedPreferences>(),
        ));
    gh.lazySingleton<_i264.FavouritesStripCubit>(
        () => _i264.FavouritesStripCubit(gh<_i242.GetStandardStripUseCase>()));
    gh.lazySingleton<_i265.CommunityWallCubit>(() => _i265.CommunityWallCubit(
          gh<_i229.GetCommunityPostsUseCase>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i266.AddFavouritesUseCase>(
        () => _i266.AddFavouritesUseCase(
              gh<_i217.DetailRepository>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
              gh<_i15.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i267.GetRelatedActivitiesUseCase>(
        () => _i267.GetRelatedActivitiesUseCase(
              gh<_i217.DetailRepository>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
              gh<_i15.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i268.GetToolsUseCase>(() => _i268.GetToolsUseCase(
          gh<_i217.DetailRepository>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
          gh<_i15.GetStoredCorporateIdUseCase>(),
        ));
    gh.lazySingleton<_i269.GetSharedPostsUseCase>(
        () => _i269.GetSharedPostsUseCase(
              gh<_i217.DetailRepository>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
              gh<_i15.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i270.GetEditionsUseCase>(() => _i270.GetEditionsUseCase(
          gh<_i217.DetailRepository>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
          gh<_i15.GetStoredCorporateIdUseCase>(),
        ));
    gh.lazySingleton<_i271.GetDetailPageUseCase>(
        () => _i271.GetDetailPageUseCase(
              gh<_i217.DetailRepository>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
              gh<_i15.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i272.RemoveFavouritesUseCase>(
        () => _i272.RemoveFavouritesUseCase(
              gh<_i217.DetailRepository>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
              gh<_i15.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i273.GetToolUrlUseCase>(() => _i273.GetToolUrlUseCase(
          gh<_i217.DetailRepository>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
          gh<_i15.GetStoredCorporateIdUseCase>(),
        ));
    gh.lazySingleton<_i274.GetTeacherDetailUseCase>(
        () => _i274.GetTeacherDetailUseCase(
              gh<_i217.DetailRepository>(),
              gh<_i14.GetSecureStoredUserInfoUseCase>(),
              gh<_i15.GetStoredCorporateIdUseCase>(),
            ));
    gh.lazySingleton<_i275.GetRatingUseCase>(() => _i275.GetRatingUseCase(
          gh<_i217.DetailRepository>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
          gh<_i15.GetStoredCorporateIdUseCase>(),
        ));
    gh.factory<_i276.OlDownloadDialogCubit>(
        () => _i276.OlDownloadDialogCubit(gh<_i227.DownloadEventsUseCase>()));
    gh.factory<_i277.CalendarStripCubit>(
        () => _i277.CalendarStripCubit(gh<_i244.GetCalendarStripUseCase>()));
    gh.factory<_i278.SmartLearningBottomSheetCubit>(
        () => _i278.SmartLearningBottomSheetCubit(
              gh<_i201.GetSmartLearningSlotsUseCase>(),
              gh<_i199.CreateSmartLearningSlotUseCase>(),
              gh<_i202.UpdateSmartLearningSlotUseCase>(),
              gh<_i200.DeleteSmartLearningSlotUseCase>(),
              gh<_i244.GetCalendarStripUseCase>(),
            ));
    gh.factory<_i279.CommunityCardCubit>(() => _i279.CommunityCardCubit(
          gh<_i246.DeletePostUseCase>(),
          gh<_i265.CommunityWallCubit>(),
        ));
    gh.lazySingleton<_i280.OfflineCubit>(() => _i280.OfflineCubit(
          gh<_i68.GetStatementsUseCase>(),
          gh<_i249.StatementsUseCase>(),
          gh<_i248.SetStateUseCase>(),
          gh<_i70.DeleteStatementsUseCase>(),
          gh<_i38.GetStoredUserSelfUseCase>(),
          gh<_i22.GetSkipTutorialUseCase>(),
          gh<_i102.AppCubit>(),
          gh<_i29.GetSkipOnboardingUseCase>(),
          gh<_i262.ContinueLearningStripCubit>(),
          gh<_i27.GetStoredDownloadContentInfoUseCase>(),
          gh<_i28.StoreDownloadContentInfoUseCase>(),
        ));
    gh.lazySingleton<_i281.GetSuggestionsUseCase>(
        () => _i281.GetSuggestionsUseCase(gh<_i224.SearchRepository>()));
    gh.factory<_i282.StandardStripCubit>(
        () => _i282.StandardStripCubit(gh<_i242.GetStandardStripUseCase>()));
    gh.factory<_i283.LogoHeaderCubit>(() => _i283.LogoHeaderCubit(
          gh<_i223.GetUserImageUseCase>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.lazySingleton<_i284.NotificationUseCase>(() => _i284.NotificationUseCase(
          gh<_i210.NotificationRepository>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.factory<_i285.LikePostCubit>(() => _i285.LikePostCubit(
          gh<_i236.GetCommunityPostLikesUseCase>(),
          gh<_i228.LikePostUseCase>(),
          gh<_i235.UnlikePostUseCase>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
        ));
    gh.factory<_i286.DynamicAllContentCubit>(() => _i286.DynamicAllContentCubit(
          gh<_i252.GetPageStructureUseCase>(),
          gh<_i32.GetStoredSmartConfigurationUseCase>(),
          gh<_i242.GetStandardStripUseCase>(),
          gh<_i280.OfflineCubit>(),
        ));
    gh.factory<_i287.UserAvatarCubit>(
        () => _i287.UserAvatarCubit(gh<_i223.GetUserImageUseCase>()));
    gh.factory<_i288.RatingsDialogCubit>(
        () => _i288.RatingsDialogCubit(gh<_i254.RatingUseCase>()));
    gh.factory<_i289.PostCubit>(() => _i289.PostCubit(
          gh<_i223.GetUserImageUseCase>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
          gh<_i247.CreatePostUseCase>(),
          gh<_i245.EditPostUseCase>(),
          gh<_i265.CommunityWallCubit>(),
        ));
    gh.singleton<_i290.NotificationCubit>(() => _i290.NotificationCubit(
          gh<_i259.GetNotificationsUseCase>(),
          gh<_i260.SetNotificationsUseCase>(),
        ));
    gh.factory<_i291.TeacherDetailSheetCubit>(() =>
        _i291.TeacherDetailSheetCubit(gh<_i274.GetTeacherDetailUseCase>()));
    gh.factory<_i292.VideoPlayerCubit>(() => _i292.VideoPlayerCubit(
          gh<_i249.StatementsUseCase>(),
          gh<_i248.SetStateUseCase>(),
          gh<_i250.GetStateUseCase>(),
          gh<_i75.RetrieveDownloadInfoUseCase>(),
          gh<_i262.ContinueLearningStripCubit>(),
          gh<_i27.GetStoredDownloadContentInfoUseCase>(),
          gh<_i28.StoreDownloadContentInfoUseCase>(),
        ));
    gh.factory<_i293.LoginCubit>(() => _i293.LoginCubit(
          gh<_i96.CognitoAuthManager>(),
          gh<_i20.GetStoredUsernameUseCase>(),
          gh<_i30.HandlerStoredUsernameUseCase>(),
          gh<_i93.CreateSessionUseCase>(),
          gh<_i84.GetUserSelfUseCase>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
          gh<_i92.CheckSessionUseCase>(),
          gh<_i45.SetSecureStoredUserInfoUseCase>(),
          gh<_i15.GetStoredCorporateIdUseCase>(),
          gh<_i102.AppCubit>(),
          gh<_i3.SharedPreferences>(),
          gh<_i263.RemoteLabels>(),
        ));
    gh.factory<_i294.RatingCubit>(() => _i294.RatingCubit(
          gh<_i275.GetRatingUseCase>(),
          gh<_i32.GetStoredSmartConfigurationUseCase>(),
        ));
    gh.singleton<_i295.NotificationManager>(() => _i295.NotificationManager(
          gh<_i290.NotificationCubit>(),
          gh<_i3.SharedPreferences>(),
          gh<_i284.NotificationUseCase>(),
        ));
    gh.factory<_i296.VideoPlayerOfflineCubit>(
        () => _i296.VideoPlayerOfflineCubit(
              gh<_i69.StoreStatementUseCase>(),
              gh<_i249.StatementsUseCase>(),
              gh<_i248.SetStateUseCase>(),
              gh<_i262.ContinueLearningStripCubit>(),
              gh<_i27.GetStoredDownloadContentInfoUseCase>(),
              gh<_i28.StoreDownloadContentInfoUseCase>(),
            ));
    gh.factory<_i297.LocalCardStatusCubit>(() => _i297.LocalCardStatusCubit(
          gh<_i27.GetStoredDownloadContentInfoUseCase>(),
          gh<_i271.GetDetailPageUseCase>(),
          gh<_i28.StoreDownloadContentInfoUseCase>(),
          gh<_i250.GetStateUseCase>(),
        ));
    gh.factory<_i298.PostDetailCubit>(() => _i298.PostDetailCubit(
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
          gh<_i230.GetSharedPostUseCase>(),
          gh<_i223.GetUserImageUseCase>(),
          gh<_i234.GetCommunityPostUseCase>(),
          gh<_i246.DeletePostUseCase>(),
          gh<_i265.CommunityWallCubit>(),
        ));
    gh.factory<_i299.WallCubit>(() => _i299.WallCubit(
          gh<_i196.GetWallStripContentUseCase>(),
          gh<_i272.RemoveFavouritesUseCase>(),
          gh<_i264.FavouritesStripCubit>(),
        ));
    gh.factory<_i300.FavouriteCubit>(() => _i300.FavouriteCubit(
          gh<_i266.AddFavouritesUseCase>(),
          gh<_i272.RemoveFavouritesUseCase>(),
          gh<_i264.FavouritesStripCubit>(),
        ));
    gh.factory<_i301.DetailPageCubit>(() => _i301.DetailPageCubit(
          gh<_i271.GetDetailPageUseCase>(),
          gh<_i268.GetToolsUseCase>(),
          gh<_i267.GetRelatedActivitiesUseCase>(),
          gh<_i270.GetEditionsUseCase>(),
          gh<_i269.GetSharedPostsUseCase>(),
          gh<_i212.AutoEnrollmentUseCase>(),
          gh<_i183.StartResumeUseCase>(),
          gh<_i32.GetStoredSmartConfigurationUseCase>(),
          gh<_i152.EditionRegisterUseCase>(),
          gh<_i213.BottomEnrollmentUseCase>(),
          gh<_i262.ContinueLearningStripCubit>(),
          gh<_i246.DeletePostUseCase>(),
          gh<_i230.GetSharedPostUseCase>(),
          gh<_i27.GetStoredDownloadContentInfoUseCase>(),
          gh<_i28.StoreDownloadContentInfoUseCase>(),
          gh<_i53.DownloadStripCubit>(),
        ));
    gh.factory<_i302.TopicsFilterCubit>(
        () => _i302.TopicsFilterCubit(gh<_i256.GetTopicsUseCase>()));
    gh.factory<_i303.LanguagesCubit>(
        () => _i303.LanguagesCubit(gh<_i263.RemoteLabels>()));
    gh.factory<_i304.ToolItemCubit>(
        () => _i304.ToolItemCubit(gh<_i273.GetToolUrlUseCase>()));
    gh.factory<_i305.AddCommentWidgetCubit>(() => _i305.AddCommentWidgetCubit(
          gh<_i237.AddCommentUseCase>(),
          gh<_i231.AddAnswerUseCase>(),
          gh<_i233.EditCommentUseCase>(),
          gh<_i238.DeleteCommentUseCase>(),
          gh<_i265.CommunityWallCubit>(),
        ));
    gh.factory<_i306.SearchCubit>(() => _i306.SearchCubit(
          gh<_i257.GetSearchResultsUseCase>(),
          gh<_i281.GetSuggestionsUseCase>(),
          gh<_i24.GetLocalSuggestionsUseCase>(),
          gh<_i25.SetLocalSuggestionsUseCase>(),
          gh<_i23.CleanLocalSuggestionsUseCase>(),
        ));
    gh.factory<_i307.DynamicContentCubit>(() => _i307.DynamicContentCubit(
          gh<_i252.GetPageStructureUseCase>(),
          gh<_i32.GetStoredSmartConfigurationUseCase>(),
          gh<_i280.OfflineCubit>(),
        ));
    gh.factory<_i308.DownloadWallCubit>(() => _i308.DownloadWallCubit(
          gh<_i13.QueryDownloadManagerUseCase>(),
          gh<_i26.RemoveStoredDownloadContentInfoUseCase>(),
          gh<_i74.CancelDownloadUseCase>(),
          gh<_i76.DeleteDownloadUseCase>(),
          gh<_i27.GetStoredDownloadContentInfoUseCase>(),
          gh<_i280.OfflineCubit>(),
          gh<_i68.GetStatementsUseCase>(),
        ));
    gh.factory<_i309.InitiativesCubit>(() => _i309.InitiativesCubit(
          gh<_i91.SetInitiativeUseCase>(),
          gh<_i40.SetStoredUserSelfUseCase>(),
          gh<_i45.SetSecureStoredUserInfoUseCase>(),
          gh<_i165.GetMenuStructureUseCase>(),
          gh<_i14.GetSecureStoredUserInfoUseCase>(),
          gh<_i184.GetSmartConfigurationUseCase>(),
          gh<_i15.GetStoredCorporateIdUseCase>(),
          gh<_i11.SetStoredSmartConfigurationUseCase>(),
          gh<_i295.NotificationManager>(),
          gh<_i89.CleanLocalDatabaseUseCase>(),
          gh<_i92.CheckSessionUseCase>(),
          gh<_i185.GetColorsUseCase>(),
          gh<_i263.RemoteLabels>(),
          gh<_i265.CommunityWallCubit>(),
          gh<_i216.GetAppresourceUseCase>(),
        ));
    return this;
  }
}

class _$ExternalModule extends _i310.ExternalModule {}
