cask "md-quicklook" do
  version "1.2.4"
  sha256 "679750b3feb6352b0a347ed19d7f9ac197b969ac9c04e12f1f1701e3e7cf1187"

  url "https://github.com/armamut/md-quicklook/releases/download/v#{version}/MD-QuickLook-#{version}.zip"
  name "MD QuickLook"
  desc "Fast, native Quick Look extension for Markdown"
  homepage "https://github.com/armamut/md-quicklook"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "MD QuickLook.app"

  zap trash: [
    "~/Library/Containers/io.github.armamut.mdquicklook.preview",
    "~/Library/Containers/io.github.armamut.mdquicklook.thumbnail",
    "~/Library/Preferences/io.github.armamut.mdquicklook.plist",
  ]

  caveats <<~EOS
    MD QuickLook is not notarized by Apple yet, so macOS blocks it the first time.
    Either allow it in System Settings > Privacy & Security > Open Anyway, or run:
      xattr -dr com.apple.quarantine "#{appdir}/MD QuickLook.app"

    Then open MD QuickLook once to register its Quick Look extensions.
  EOS
end
