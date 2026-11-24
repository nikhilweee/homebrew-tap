cask "relarm" do
  version "0.7.0"
  sha256 "ca52f4bbe47f2795ffc5e6ac976ba441f0cf39d77f479157625a4b3853a80b62"

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
