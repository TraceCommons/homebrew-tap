class TraceCommonsContributor < Formula
  desc "CLI for contributing coding session traces to the Trace Commons corpus"
  homepage "https://tracecommons.ai/"
  version "0.4.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/TraceCommons/trace-commons-server/releases/download/contributor-v#{version}/trace-commons-contributor-aarch64-apple-darwin.zip"
      sha256 "6fa28279e64f6bbbac422fb6e79120ae1f176afd26b43b014997706a8d5cef01"
    end
    on_intel do
      url "https://github.com/TraceCommons/trace-commons-server/releases/download/contributor-v#{version}/trace-commons-contributor-x86_64-apple-darwin.zip"
      sha256 "0f11ca37246505bbe834a88a0ebaffd133ef3ba9713d29c687ea04a1b80dac78"
    end
  end

  def install
    bin.install Dir["trace-commons-contributor*"].first => "trace-commons-contributor"
  end

  test do
    assert_match "trace-commons-contributor", shell_output("#{bin}/trace-commons-contributor --help")
  end
end
