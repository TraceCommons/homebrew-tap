class TraceCommonsContributor < Formula
  desc "CLI for contributing coding session traces to the Trace Commons corpus"
  homepage "https://tracecommons.ai/"
  version "0.15.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/TraceCommons/trace-commons/releases/download/contributor-v#{version}/trace-commons-contributor-aarch64-apple-darwin.zip"
      sha256 "05fd18c1d4404b2328c6e619864a1f0e3f256e0eb677d26c047ad9b5df892333"
    end
    on_intel do
      url "https://github.com/TraceCommons/trace-commons/releases/download/contributor-v#{version}/trace-commons-contributor-x86_64-apple-darwin.zip"
      sha256 "e46d281f8fcc4144e5136d0a303a9cf24f780cc8280df053b1bc7d3e9406a6dc"
    end
  end

  def install
    bin.install Dir["trace-commons-contributor*"].first => "trace-commons-contributor"
  end

  test do
    assert_match "trace-commons-contributor", shell_output("#{bin}/trace-commons-contributor --help")
  end
end
