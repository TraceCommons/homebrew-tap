class TraceCommonsContributor < Formula
  desc "CLI for contributing coding session traces to the Trace Commons corpus"
  homepage "https://tracecommons.ai/"
  version "0.16.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/TraceCommons/trace-commons/releases/download/contributor-v#{version}/trace-commons-contributor-aarch64-apple-darwin.zip"
      sha256 "0ef0fc99e08236210a5ed4bc74a0921b68e8e256d119d63105eeb7fa094d41c1"
    end
    on_intel do
      url "https://github.com/TraceCommons/trace-commons/releases/download/contributor-v#{version}/trace-commons-contributor-x86_64-apple-darwin.zip"
      sha256 "aabffc71577813233b7cbc5f65f7db594261741c3b7a03130d2d99f9dfcb7320"
    end
  end

  def install
    bin.install Dir["trace-commons-contributor*"].first => "trace-commons-contributor"
  end

  test do
    assert_match "trace-commons-contributor", shell_output("#{bin}/trace-commons-contributor --help")
  end
end
