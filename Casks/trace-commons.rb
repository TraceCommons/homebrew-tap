cask "trace-commons" do
  version "0.8.0"
  sha256 "43fac3160919c1f56b5d9f18771859c34f4c921a1c9e0fb3edc3511f77da13f0"

  url "https://github.com/TraceCommons/trace-commons-server/releases/download/app-v#{version}/TraceCommons-#{version}.dmg"
  name "Trace Commons"
  desc "Contributes your coding session traces to the Trace Commons corpus"
  homepage "https://tracecommons.ai/"

  # The DMG is a universal (arm64 + x86_64) build -- see
  # docs/release-runbook.md in trace-commons-server -- so there is no
  # arch restriction here.
  depends_on macos: :sonoma

  app "TraceCommons.app"

  # The app registers itself as a login item through SMAppService. Deleting a
  # running bundle strands an entry in System Settings > General > Login
  # Items, which is exactly where a contributor goes to audit background
  # software -- so it must exit first.
  uninstall quit: "ai.tracecommons.shell"

  zap trash: [
    "~/Library/Caches/ai.tracecommons.shell",
    "~/Library/HTTPStorages/ai.tracecommons.shell",
    "~/Library/Preferences/ai.tracecommons.shell.plist",
  ]

  # DELIBERATELY NOT ZAPPED:
  # ~/Library/Application Support/trace-commons/contributor.json
  #
  # That file is the device identity key, and the server's /v1/onboard is not
  # idempotent -- an invite code cannot be redeemed twice. Trashing it would
  # mean `brew uninstall --zap` permanently locks a contributor out of
  # re-enrolling with a code nobody can reissue. This omission is intentional;
  # please do not "complete" the zap stanza.
end
