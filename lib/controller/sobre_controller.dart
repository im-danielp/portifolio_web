import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web/web.dart' as web;

class SobreController {
  // Abre uma nova página para a URL especificada.
  Future<void> abrirPagina(int index) async {
    const List<String> urls = [
      'https://github.com/im-danielp',
      'https://www.linkedin.com/in/daniel-pacheco-ferreira',
      'mailto:danielpfcont@gmail.com?subject=Entrevista%20de%20emprego',
      'https://api.whatsapp.com/send/?phone=%2B5562992980263&text=Ol%C3%A1+Daniel%21+Vi+seu+curr%C3%ADculo+e+gostaria+de+marcar+uma+entrevista+de+emprego+com+voc%C3%AA&type=phone_number&app_absent=0',
    ];

    web.window.open(urls[index], '_blank');
  }

  // Copia e-mail para área de transferência.
  Future<void> copiarEmail(BuildContext context, double maxWidth) async {
    await Clipboard.setData(const ClipboardData(text: 'danielpfcont@gmail.com'));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        width: 700,
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        content: Row(
          spacing: 16,
          children: [
            Icon(Icons.check_circle_sharp, color: Colors.white),
            Text('E-mail danielpfcont@gmail.com copiado para área de tansferência'),
          ],
        ),
        showCloseIcon: true,
      ),
    );
  }

  // Currículo.
  Future<void> abrirCurriculo() async {
    final String url = 'assets/pdf/curriculo.pdf';
    await launchUrl(
      Uri.parse(url),
      webOnlyWindowName: '_blank',
    );
  }
}
