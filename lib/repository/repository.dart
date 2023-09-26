import 'package:namoz_vaqtlari_uzb/service/api_service.dart';

import '../model/day/day_model.dart';
import '../model/month/month_model.dart';
import '../model/week/week_model.dart';

class ApiRepository {
  const ApiRepository({required this.apiService});

  final ApiService apiService;

  Future<DailyPrayerTimes> getDailyPrayerTimes(String region) =>
      apiService.getDailyPrayerTimes(region);

  Future<List<Haftaliknamozvaqtlari>> getHaftaliknamozvaqtlari(
          String region) =>
      apiService.getHaftalikNamozVaqtlari(region);

  Future<List<OyliknamozVaqtlari>> getOylikNamozVaqtlari(int region) =>
      apiService.getOyliknamozVaqtlari(region);
}
