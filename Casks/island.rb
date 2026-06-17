cask "island" do
  version "0.1.5"
  sha256 "1ce3feb2297a51959e84a6e474d94a5b67763aa77fb28be177dc3e88eefdac0c"

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
