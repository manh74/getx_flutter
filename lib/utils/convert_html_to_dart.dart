import 'package:html2md/html2md.dart' as html2md;

String convertHTMLToDart(String html) {
  return html2md.convert(html);
}
