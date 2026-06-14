cask "scribe" do
  version "0.1.1"
  sha256 "1d36b37eb10534d9ed6612ba10ef2b2b3c311bbcf7288118b784bad02a501d9b"

  url "https://github.com/dan-brodie/scribe/releases/download/v#{version}/Scribe-#{version}.dmg",
      verified: "github.com/dan-brodie/scribe/"
  name "Scribe"
  desc "On-device meeting transcription, diarization, and summarization menu bar app"
  homepage "https://github.com/dan-brodie/scribe"

  # Apple Silicon, macOS 14.4+ (Sonoma is the cask's major-version granularity).
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Scribe.app"

  # The app is ad-hoc signed (not notarized). Homebrew quarantines downloads by
  # default, so a notarization check would otherwise block first launch — install
  # with `--no-quarantine` (see the tap README) for a prompt-free launch.

  zap trash: [
    "~/Library/Application Support/Scribe",
    "~/Library/Caches/net.danbrodie.Scribe",
    "~/Library/HTTPStorages/net.danbrodie.Scribe",
    "~/Library/Preferences/net.danbrodie.Scribe.plist",
  ]
end
