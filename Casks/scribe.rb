cask "scribe" do
  version "0.1.7"
  sha256 "9c8f39589a9ba66a370d41518d913a312e5b3e50e3ceb2aedda9429fc392ea48"

  url "https://github.com/dan-brodie/scribe/releases/download/v#{version}/Scribe-#{version}.dmg"
  name "Scribe"
  desc "On-device meeting transcription, diarization, and summarization menu bar app"
  homepage "https://github.com/dan-brodie/scribe"

  # Apple Silicon, macOS 14.4+ (Sonoma is the cask's major-version granularity).
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Scribe.app"

  # Scribe is self-signed but not notarized (notarization needs a paid Apple
  # Developer account), and Homebrew quarantines downloads, which makes Gatekeeper
  # block an un-notarized app on first launch. Strip the quarantine flag after
  # install so the app launches cleanly. Users opt into this by choosing to
  # install Scribe.
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
