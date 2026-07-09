cask "island" do
  version "0.1.9"
  sha256 "d37c7a1394ef1d65e203b595280e053f1f24f58b0bde151704d278d0a163ff66"

  url "https://github.com/zzcan/island/releases/download/v#{version}/island.app.zip"
  name "island"
  desc "Dynamic-island style monitor for Claude Code sessions around the notch"
  homepage "https://github.com/zzcan/island"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "island.app"

  zap trash: "~/Library/Preferences/app.island.local.plist"

  caveats <<~EOS
    island is ad-hoc signed (no Apple Developer certificate), so Gatekeeper
    will block it unless you clear the quarantine flag after install:

      xattr -dr com.apple.quarantine "#{appdir}/island.app"
  EOS
end
