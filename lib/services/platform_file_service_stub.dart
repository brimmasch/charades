// Mobile / desktop: downloading via browser is not applicable.
// Export is handled by share_plus in ImportExportService.
bool get webDownloadSupported => false;

Future<void> triggerWebDownload(String content, String filename) async {
  // No-op on non-web platforms.
}
