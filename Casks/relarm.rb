cask "relarm" do
  version "0.3.0"
  sha256 "9b3cd5c39c10e03793df8edddd5a47e44324c783baf59ac75f09582a2c2987c3"

  url "https://github.com/nikhilweee/relarm/releases/download/v#{version}/Relarm.zip"
  name "Relarm"
  desc "Minimal menu bar repeating alarms"
  homepage "https://github.com/nikhilweee/relarm"

  depends_on macos: :ventura

  app "Relarm.app"

  # The app is ad-hoc signed, so a quarantined first launch would hit the
  # Gatekeeper "could not verify" dialog. Strip just the quarantine flag
  # after install; the sha256 above still pins the download.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Relarm.app"]
  end

  zap trash: "~/Library/Preferences/com.nikhilweee.relarm.plist"
end
