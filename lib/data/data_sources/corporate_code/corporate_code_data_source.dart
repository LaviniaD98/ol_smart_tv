import '../../models/responses/corporate_code/corporate_code_dto.dart';

abstract class CorporateCodeDataSource {
  Future<CorporateCodeDto> getCorporateCode(String? disambiguationCode);
}