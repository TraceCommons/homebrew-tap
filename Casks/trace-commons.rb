cask "trace-commons" do
  version "0.2.0"
  sha256 "REPLACE_ON_FIRST_RELEASE_see_docs_release-runbook.md"

  url "https://github.com/TraceCommons/trace-commons-server/releases/download/app-v#{version}/TraceCommons-#{version}-arm64.dmg"
  name "Trace Commons"
  desc "Contributes your coding session traces to the Trace Commons corpus"
  homepage "https://tracecommons.ai/"

  # The release job builds only on macos-14 (arm64) with no lipo/universal
  # step, so the DMG above is Apple-silicon-only. Without this, an Intel Mac
  # on Sonoma would install successfully and then fail to launch. See
  # docs/release-runbook.md in trace-commons-server for the real fix
  # (a universal build), which is not done yet.
  depends_on arch: :arm64
  # ">= :sonoma", not a bare :sonoma. A bare symbol in the cask DSL means
  # EXACTLY that release, so a bare value would refuse every Mac on Sequoia or
  # later -- which, combined with the arm64 constraint above, is most Apple
  # silicon Macs. `brew style` suggests the bare form as "redundant"; it is not
  # redundant here, it changes a floor into an equality.
  depends_on macos: ">= :sonoma"

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
