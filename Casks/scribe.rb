cask "scribe" do
  version "0.1.2"
  sha256 "b8b1428b3bb5fa6cf2ec3c249b139973823cf07041a367b0dd4c93069215e337"

  url "https://github.com/dan-brodie/scribe/releases/download/v#{version}/Scribe-#{version}.dmg"
  name "Scribe"
  desc "On-device meeting transcription, diarization, and summarization menu bar app"
  homepage "https://github.com/dan-brodie/scribe"

  # Apple Silicon, macOS 14.4+ (Sonoma is the cask's major-version granularity).
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Scribe.app"

  # Scribe is ad-hoc signed (notarization needs a paid Apple Developer account),
  # and Homebrew quarantines downloads, which makes Gatekeeper block an
  # un-notarized app on first launch. Strip the quarantine flag after install so
  # the app launches cleanly. Users opt into this by choosing to install Scribe.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Scribe.app"]
  end

  zap trash: [
    "~/Library/Application Support/Scribe",
    "~/Library/Caches/net.danbrodie.Scribe",
    "~/Library/HTTPStorages/net.danbrodie.Scribe",
    "~/Library/Preferences/net.danbrodie.Scribe.plist",
  ]
end
