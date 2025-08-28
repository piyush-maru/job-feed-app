import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:interview_prectical/app/routes/app_pages.dart';
import 'package:interview_prectical/core/theme/app_theme.dart';
import 'package:interview_prectical/core/utils/my_size.dart';
import 'package:interview_prectical/features/home/model/job_data_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Get.put(ThemeController());

  Hive.registerAdapter(JobUserAdapter());
  Hive.registerAdapter(CompanyAdapter());

  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();



  }
  final ThemeController themeController = Get.find();
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(

        title: 'Clean Arch + GetX + Dio Demo',
        //initialRoute: AppPages.initial,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme(context),
        darkTheme: AppTheme.darkTheme(context),
        themeMode: themeController.theme,
        builder: (context, child) {
          MySize.init(context);
          return child!;
        },
      );
    },);
  }
}


class ThemeController extends GetxController {

  final _box = GetStorage();
  final _key = "isDarkMode";

  // observable theme
  var isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    isDarkMode.value = _loadTheme();
  }

  bool _loadTheme() => _box.read(_key) ?? false;

  void saveTheme(bool isDark) {
    _box.write(_key, isDark);
    isDarkMode.value = isDark;
  }

  ThemeMode get theme => isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
}

