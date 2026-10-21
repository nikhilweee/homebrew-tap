cask "snapper" do
  version "0.1.0"
  sha256 "5c916100de2d1c3b89533e1e65a5063c8dcda6e51dac1d162ad3dda4f0a4b87c"

  url "https://github.com/nikhilweee/snapper/releases/download/v#{version}/Snapper.zip"
  name "Snapper"
  desc "Menu bar window snapping with layouts remembered per display"
  homepage "https://github.com/nikhilweee/snapper"

  depends_on macos: :sonoma

  app "Snapper.app"

  # The app is ad-hoc signed, so a quarantined first launch would hit the
  # Gatekeeper "could not verify" dialog. Strip just the quarantine flag
  # after install; the sha256 above still pins the download.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Snapper.app"]
  end

  uninstall quit: "com.nikhilweee.snapper"

  zap trash: [
    "~/Library/Application Support/Snapper",
    "~/Library/Preferences/com.nikhilweee.snapper.plist",
  ]
end
