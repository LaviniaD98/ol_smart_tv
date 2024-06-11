import 'package:flutter/material.dart';

class HighlightedRichText extends StatelessWidget {
  const HighlightedRichText({
        super.key,
        required this.text,
        required this.highlightText,
        this.style,
        this.maxLines,
        this.overflow,
        this.textAlign,
        this.textDirection,
        this.softWrap,
        this.textScaleFactor,
        this.locale,
        this.strutStyle,
        this.textWidthBasis,
        this.highlightStyle,
      });

  final String text;
  final String highlightText;
  final TextStyle? style;
  final TextStyle? highlightStyle;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final double? textScaleFactor;
  final Locale? locale;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;

  @override
  Widget build(BuildContext context) {
    final searchRegExp = RegExp(highlightText, caseSensitive: false);
    if (searchRegExp.pattern.isEmpty) {
      return Text(
        text,
        style: style,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        textDirection: textDirection,
        softWrap: softWrap,
        textScaleFactor: textScaleFactor,
        locale: locale,
        strutStyle: strutStyle,
        textWidthBasis: textWidthBasis,
      );
    }

    final textSpans = <TextSpan>[];
    var lastEnd = 0;
    for (final match in searchRegExp.allMatches(text)) {
      if (match.start > lastEnd) {
        textSpans.add(
          TextSpan(
            text: text.substring(lastEnd, match.start),
            style: style ?? DefaultTextStyle.of(context).style,
          ),
        );
      }
      textSpans.add(
        TextSpan(
          text: text.substring(match.start, match.end),
          style: highlightStyle,
        ),
      );
      lastEnd = match.end;
    }
    if (lastEnd < text.length) {
      textSpans.add(
        TextSpan(
          text: text.substring(lastEnd),
          style: style ?? DefaultTextStyle.of(context).style,
        ),
      );
    }

    return RichText(
      text: TextSpan(
        children: textSpans,
      ),
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.clip,
      textAlign: textAlign ?? TextAlign.start,
      textDirection: textDirection,
      softWrap: softWrap ?? true,
      textScaleFactor: textScaleFactor ?? 1.0,
      locale: locale,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
    );
  }
}
