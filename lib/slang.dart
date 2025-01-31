import 'package:chatapp/components/app_colors.dart';
import 'package:chatapp/generated/l10n.dart';
import 'package:chatapp/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Localeprovider.dart';

class Slang extends StatefulWidget {
  const Slang({super.key});

  @override
  State<Slang> createState() => _SlangState();
}

class _SlangState extends State<Slang> {
  String? language = 'English';

  @override
  void initState() {
    super.initState();
    _loadSavedLanguage();
  }

  void _loadSavedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLanguage = prefs.getString('language');
    if (savedLanguage != null) {
      setState(() {
        language = savedLanguage;
      });
      final localeProvider =
          Provider.of<LocaleProvider>(context, listen: false);
      localeProvider
          .setLocale(savedLanguage == 'English' ? Locale('en') : Locale('ar'));
    }
  }

  void _saveLanguage(String langCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', langCode);
  }

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Column(
        children: [
          SizedBox(height: 75),
          Center(
            child: Image.asset(
              'images/wpa.png',
              height: 120,
            ),
          ),
          SizedBox(height: 45),
          Text(
            S.of(context).welcome,
            style: TextStyle(
              color: Colors.white,
              fontSize: isArabic() ? 35 : 30,
              fontFamily: 'Rubik',
              fontWeight: isArabic() ? null : FontWeight.w600,
            ),
          ),
          SizedBox(height: 15),
          Text(
            S.of(context).choose,
            style: TextStyle(
              color: Colors.white,
              fontSize: isArabic() ? 23 : 17.5,
              fontFamily: 'Rubik',
              fontWeight: isArabic() ? null : FontWeight.w600,
            ),
          ),
          SizedBox(height: 50),
          RadioListTile(
            subtitle: Text(
              S.of(context).mainlanguage,
              style: TextStyle(
                color: grey,
                fontSize: 15,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w600,
              ),
            ),
            selectedTileColor: backgroundcolor,
            activeColor: lightgreen,
            title: Text(
              S.of(context).English,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w600,
              ),
            ),
            value: 'English',
            groupValue: language,
            onChanged: (val) {
              localeProvider.setLocale(Locale('en'));
              _saveLanguage('English');
              setState(() {
                language = val;
              });
            },
          ),
          SizedBox(height: 12.5),
          GestureDetector(
            onTap: () {},
            child: RadioListTile(
              subtitle: Text(
                'Arabic',
                style: TextStyle(
                  color: grey,
                  fontSize: 15,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w600,
                ),
              ),
              selectedTileColor: backgroundcolor,
              activeColor: lightgreen,
              title: Text(
                'العربية',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w600,
                ),
              ),
              value: 'Arabic',
              groupValue: language,
              onChanged: (val) {
                localeProvider.setLocale(Locale('ar'));
                _saveLanguage('Arabic');
                setState(() {
                  language = val;
                });
              },
            ),
          ),
          SizedBox(height: isArabic() ? 160 : 180),
          Padding(
            padding: EdgeInsets.only(
              right: isArabic() ? 0 : 25,
              left: isArabic() ? 25 : 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'los');
                  },
                  child: Container(
                    height: 65,
                    width: 70,
                    decoration: BoxDecoration(
                      color: lightgreen,
                      borderRadius: BorderRadius.circular(18.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(2, 2),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: backgroundcolor,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}