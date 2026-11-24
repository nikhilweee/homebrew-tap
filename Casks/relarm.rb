cask "relarm" do
  version "0.5.0"
  sha256 "e5023e121238eb7f29a3819e4cc15496975fcc0634a67eabbcccf671525a1619"

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
