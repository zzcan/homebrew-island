cask "island" do
  version "0.1.2"
  sha256 "f73d39840e0e5a573107203b96162adb7a3c3fe6e3c80a6406f29cbc8be37880"

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
