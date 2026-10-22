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
  depends_on macos: ">= :monterey"

  app "MD QuickLook.app"

  postflight do
    system_command "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister",
                   args: ["-f", "-R", "#{appdir}/MD QuickLook.app"]
    system_command "/usr/bin/qlmanage", args: ["-r"]
  end

  zap trash: [
    "~/Library/Containers/io.github.armamut.mdquicklook.preview",
    "~/Library/Containers/io.github.armamut.mdquicklook.thumbnail",
    "~/Library/Preferences/io.github.armamut.mdquicklook.plist",
  ]

  caveats <<~EOS
    If previews do not appear, open MD QuickLook once and check that it is enabled in
    System Settings > General > Login Items & Extensions > Quick Look.
  EOS
end
