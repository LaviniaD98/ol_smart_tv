import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/edition_model.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/teacher_model.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/ol_alert_dialog.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/cubit/detail_page_cubit.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/detail_page.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../domain/entities/detail/detail_page_model.dart';
import '../../remote_theming/labels/labels_manager.dart';
import '../../remote_theming/labels/remote_labels_keys.dart';

class CourseDetailEditions extends StatelessWidget {
  final DetailPageModel model;
  final DetailPageArgs args;

  const CourseDetailEditions(
      {super.key, required this.model, required this.args});

  Future<void> launchInBrowser(String url) async {
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      if (kDebugMode)
        print(LabelsManager()
            .getRemoteStringFromLabelKeys(RemoteLabelKeys.error_occurred));
    }
  }

  @override
  Widget build(BuildContext context) {
    List<EditionModel> elist = model.editionsModel != null
        ? (model.editionsModel?.editions ?? [])
        : [];

    return CustomScrollView(
      slivers: elist
          .map((e) => SliverToBoxAdapter(
                child: Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: AppTheme.greyGradient,
                      borderRadius: const BorderRadius.all(
                          Radius.circular(Dimens.radius)),
                    ),
                    child: Column(
                      children: [
                        getFromToWidget(e),
                        const SizedBox(
                          height: 16,
                        ),
                        getOnlineMeetingWidget(e),
                        getLocation(e),
                        getFromToHoursWidget(context, e),
                        const SizedBox(
                          height: 16,
                        ),
                        getTeachers(context, e, model),
                        const SizedBox(
                          height: 16,
                        ),
                        const Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Text(
                              e.occupiedPlaces!.toString(),
                              style: TextStyle(
                                  fontSize: 28,
                                  color: ColorManager().getColorTextPrimary()),
                            ),
                            Text(
                              " / ",
                              style: TextStyle(
                                  fontSize: 28,
                                  color:
                                      ColorManager().getColorTextPrimaryCta()),
                            ),
                            Text(
                              e.totalPlaces!.toString(),
                              style: TextStyle(
                                  fontSize: 28,
                                  color: ColorManager().getColorTextPrimary()),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Transform.scale(
                                scale: 0.9999,
                                child: SvgPicture.asset(
                                    "assets/icons/detail/dettaglio_tempo.svg",
                                    width: 24,
                                    colorFilter: ColorFilter.mode(
                                        ColorManager()
                                            .getColorBackgroundWarning(),
                                        BlendMode.srcIn))),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              LabelsManager()
                                  .getRemoteStringFromLabelKeys(
                                      e.remainingPlaces == 1
                                          ? RemoteLabelKeys.place_available
                                          : RemoteLabelKeys.places_available)
                                  .replaceFirst('{{count}}',
                                      e.remainingPlaces!.toString()),
                              style: TextStyle(
                                  color: ColorManager().getColorTextWarning()),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: buildButton(context, e, model)),
                      ],
                    )),
              ))
          .toList(),
    );
  }

  String _getFromToDateInfo(
      EditionModel editionModel, String outDateFormat, String remoteLabel) {
    String fromToDate = remoteLabel
        .replaceFirst('{{start}}', editionModel.startTime!)
        .replaceFirst('{{end}}', editionModel.endTime!);
    try {
      DateFormat dateFormat = DateFormat("E MMM d H:mm:ss 'UTC' yyyy", "en_US");
      DateFormat outputDateFormat = DateFormat(outDateFormat);
      var startDate = dateFormat.parse(editionModel.startTime!, true).toLocal();
      var startOutputDate = outputDateFormat.format(startDate);
      var endDate = dateFormat.parse(editionModel.endTime!, true).toLocal();
      var endOutputDate = outputDateFormat.format(endDate);
      fromToDate = remoteLabel
          .replaceFirst('{{start}}', startOutputDate)
          .replaceFirst('{{end}}', endOutputDate);
    } catch (e) {
      if (kDebugMode) print("Exception while converting dates $e");
    }
    return fromToDate;
  }

  Widget getFromToWidget(EditionModel editionModel) {
    return Row(
      children: [
        Transform.scale(
            scale: 0.9999,
            child: SvgPicture.asset(
                "assets/icons/detail/dettaglio_scadenza.svg",
                width: 24,
                colorFilter: ColorFilter.mode(
                    ColorManager().getColorTextPrimary(), BlendMode.srcIn))),
        const SizedBox(
          width: 8,
        ),
        Text(
            _getFromToDateInfo(
                editionModel,
                "d/M/yyyy",
                LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.from_to)),
            style: TextStyle(color: ColorManager().getColorTextPrimary()))
      ],
    );
  }

  Widget getOnlineMeetingWidget(EditionModel editionModel) {
    DateFormat dateFormat = DateFormat("E MMM d H:mm:ss 'UTC' yyyy", "en_US");
    var startDate = dateFormat.parse(editionModel.startTime!, true);
    var endDate = dateFormat.parse(editionModel.endTime!, true);
    var now = DateTime.now();
    var canJoin = editionModel.status == "E" &&
        now.isAfter(startDate) &&
        now.isBefore(endDate) &&
        editionModel.link?.isNotEmpty == true;
    if (editionModel.link?.isEmpty == true) {
      return const SizedBox();
    }
    return Column(children: [
      GestureDetector(
          onTap: !canJoin
              ? null
              : () {
                  Uri url = Uri.parse(editionModel.link!);
                  launchUrl(url);
                },
          child: Row(
            children: [
              Transform.scale(
                  scale: 0.9999,
                  child: SvgPicture.asset("assets/icons/camera.svg",
                      width: 24,
                      colorFilter: ColorFilter.mode(
                          ColorManager().getColorTextPrimary(),
                          BlendMode.srcIn))),
              const SizedBox(
                width: 8,
              ),
              Text(
                LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.meeting_online),
                style: TextStyle(color: ColorManager().getColorTextPrimary()),
              )
            ],
          )),
      const SizedBox(
        height: 16,
      ),
    ]);
  }

  Widget getLocation(EditionModel editionModel) {
    String? locationUrl = editionModel.gMapsUrl;
    String? locationName = editionModel.location;
    var hasLocation = locationUrl?.isNotEmpty == true;
    var hasRooms = editionModel.rooms?.isNotEmpty == true;

    String? rooms = _getRoomsAsString(editionModel.rooms);
    if (!hasRooms && !hasLocation) {
      return const SizedBox();
    }
    return Column(children: [
      GestureDetector(
          onTap: !hasLocation
              ? null
              : () {
                  Uri url = Uri.parse(locationUrl!);
                  launchUrl(url);
                },
          child: Row(
            children: [
              Transform.scale(
                  scale: 0.9999,
                  child: SvgPicture.asset("assets/icons/detail/ic_location.svg",
                      width: 24,
                      colorFilter: ColorFilter.mode(
                          ColorManager().getColorTextPrimary(),
                          BlendMode.srcIn))),
              const SizedBox(
                width: 8,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                locationName?.isNotEmpty == true
                    ? Text(
                        locationName!,
                        style: TextStyle(
                            color: ColorManager().getColorTextPrimary()),
                      )
                    : const SizedBox(),
                rooms?.isNotEmpty == true
                    ? Text(
                        "$rooms",
                        style: TextStyle(
                            color: ColorManager().getColorTextPrimary()),
                      )
                    : const SizedBox()
              ])
            ],
          )),
      const SizedBox(
        height: 16,
      ),
    ]);
  }

  String? _getRoomsAsString(List<String>? rooms) {
    if (rooms?.isNotEmpty == true) {
      String firstLocationName = rooms![0];
      int howManyMore = rooms.length - 1;
      String locationName = LabelsManager()
          .getRemoteStringFromLabelKeys(RemoteLabelKeys.editions_room_single)
          .replaceFirst('{{name}}', firstLocationName);
      if (howManyMore == 1) {
        locationName = LabelsManager()
            .getRemoteStringFromLabelKeys(
                RemoteLabelKeys.editions_rooms_one_more)
            .replaceFirst('{{name}}', firstLocationName)
            .replaceFirst('{{count}}', "$howManyMore");
      } else if (howManyMore > 1) {
        locationName = LabelsManager()
            .getRemoteStringFromLabelKeys(
                RemoteLabelKeys.editions_rooms_others_more)
            .replaceFirst('{{name}}', firstLocationName)
            .replaceFirst('{{count}}', "$howManyMore");
      }
      return locationName;
    } else {
      return null;
    }
  }

  Widget getFromToHoursWidget(BuildContext context, EditionModel editionModel) {
    return Row(
      children: [
        Transform.scale(
            scale: 0.9999,
            child: SvgPicture.asset("assets/icons/detail/dettaglio_tempo.svg",
                width: 24,
                colorFilter: ColorFilter.mode(
                    ColorManager().getColorTextPrimary(), BlendMode.srcIn))),
        const SizedBox(
          width: 8,
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 2 / 3,
          child: Text(
            _getFromToDateInfo(
                editionModel,
                "H.mm",
                LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.from_to_hours)),
            style: TextStyle(color: ColorManager().getColorTextPrimary()),
            maxLines: 2,
          ),
        )
      ],
    );
  }

  Widget getTeachers(BuildContext context, EditionModel editionModel,
      DetailPageModel detailPageModel) {
    if (detailPageModel.teachers?.isNotEmpty == true) {
      String? teachers = _getTeachersAsString(detailPageModel.teachers);
      return Row(
        children: [
          Transform.scale(
              scale: 0.9999,
              child: SvgPicture.asset("assets/icons/detail/ic_docenti.svg",
                  width: 24,
                  colorFilter: ColorFilter.mode(
                      ColorManager().getColorTextPrimary(), BlendMode.srcIn))),
          const SizedBox(
            width: 8,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 2 / 3,
            child: Text(
              teachers ?? "",
              style: TextStyle(color: ColorManager().getColorTextPrimary()),
              maxLines: 1,
            ),
          )
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  String? _getTeachersAsString(List<TeacherModel>? teachers) {
    if (teachers?.isNotEmpty == true) {
      String firsTeacherName = teachers![0].completeName ?? "";
      int howManyMore = teachers.length - 1;
      String teacherName = LabelsManager()
          .getRemoteStringFromLabelKeys(RemoteLabelKeys.editions_teacher_single)
          .replaceFirst('{{name}}', firsTeacherName);
      if (howManyMore == 1) {
        teacherName = LabelsManager()
            .getRemoteStringFromLabelKeys(
                RemoteLabelKeys.editions_teachers_one_more)
            .replaceFirst('{{name}}', firsTeacherName)
            .replaceFirst('{{count}}', "$howManyMore");
      } else if (howManyMore > 1) {
        teacherName = LabelsManager()
            .getRemoteStringFromLabelKeys(
                RemoteLabelKeys.editions_teachers_others_more)
            .replaceFirst('{{name}}', firsTeacherName)
            .replaceFirst('{{count}}', "$howManyMore");
      }
      return teacherName;
    } else {
      return null;
    }
  }

  Widget buildButton(
      BuildContext context, EditionModel editionModel, DetailPageModel model) {
    String buttonText =
        LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.register);
    Buttontype buttontype = Buttontype.register;
    bool buttonEnabled = false;
    if (model.status == "N") {
      buttonText = LabelsManager().getRemoteStringFromLabelKeys(
          RemoteLabelKeys.button_detail_request_enrollment);
      buttontype = Buttontype.register;
      buttonEnabled = true;
    } else if (model.status == "W") {
      buttonText = LabelsManager().getRemoteStringFromLabelKeys(
          RemoteLabelKeys.button_detail_request_sent);
      buttontype = Buttontype.request;
    } else if (model.status == "R") {
      buttonText = LabelsManager().getRemoteStringFromLabelKeys(
          RemoteLabelKeys.button_detail_request_refused);
      buttontype = Buttontype.request;
    } else if (model.status == "P" ||
        model.status == "E" ||
        model.status == "C") {
      if (editionModel.status == "C") {
        buttonText = LabelsManager().getRemoteStringFromLabelKeys(
            RemoteLabelKeys.button_detail_completed);
        buttontype = Buttontype.completed;
      } else if (editionModel.status == "E" || editionModel.status == "P") {
        buttonText = LabelsManager().getRemoteStringFromLabelKeys(
            RemoteLabelKeys.button_detail_registered);
        buttontype = Buttontype.registered;
      } else {
        buttonText = LabelsManager().getRemoteStringFromLabelKeys(
            RemoteLabelKeys.button_detail_request_enrollment);
        buttontype = Buttontype.request;
      }
    } else if (model.status == "T") {
      buttonText = LabelsManager().getRemoteStringFromLabelKeys(
          RemoteLabelKeys.button_detail_request_enrollment);
      buttontype = Buttontype.requestwithmessage;
      buttonEnabled = true;
    }
    return ElevatedButton(
      onPressed: buttonEnabled
          ? () => {
                if (buttontype == Buttontype.register)
                  {
                    context
                        .read<DetailPageCubit>()
                        .registerEdition(args, editionModel, model)
                  }
                else if (buttontype == Buttontype.requestwithmessage)
                  {
                    OlAlertDialog.show(
                      context,
                      title: LabelsManager().getRemoteStringFromLabelKeys(
                          RemoteLabelKeys.editions_popup_contact_chief_title),
                      message: LabelsManager().getRemoteStringFromLabelKeys(
                          RemoteLabelKeys.editions_popup_contact_chief_body),
                      actionLabel: LabelsManager().getRemoteStringFromLabelKeys(
                          RemoteLabelKeys.editions_popup_contact_chief_button),
                    )
                  }
              }
          : null,
      child: Text(
        buttonText,
      ),
    );
  }
}

enum Buttontype { register, request, registered, completed, requestwithmessage }
