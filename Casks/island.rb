cask "island" do
  version "0.1.6"
  sha256 "551e39554c6906448c093031e81ba09427f960bf3b214dd7b5a4c3e783c53049"

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
