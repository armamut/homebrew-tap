cask "md-quicklook" do
  version "1.2.1"
  sha256 "d6235270961e13638245fb6eeeac5bcf81894cf0d2247b13d8312d6333de1b6f"

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
    Open MD QuickLook once to register its Quick Look extensions. If previews do not
    appear, check that it is enabled in System Settings > General > Login Items & Extensions > Quick Look.
  EOS
end
