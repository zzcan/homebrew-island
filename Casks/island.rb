cask "island" do
  version "0.1.4"
  sha256 "f5bba72a57c1c6e34dc553d24fd0c56538664c32d4f8a8b9ba7c68b44aa7d620"

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
