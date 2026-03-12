// Conditional export: web implementation when dart:html is available,
// stub otherwise (mobile/desktop use share_plus instead).
export 'platform_file_service_stub.dart'
    if (dart.library.html) 'platform_file_service_web.dart';
