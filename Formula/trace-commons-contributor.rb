class TraceCommonsContributor < Formula
  desc "CLI for contributing coding session traces to the Trace Commons corpus"
  homepage "https://tracecommons.ai/"
  version "0.10.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/TraceCommons/trace-commons/releases/download/contributor-v#{version}/trace-commons-contributor-aarch64-apple-darwin.zip"
      sha256 "8c0b34bd7d904d31d85c6a8491dbb26e4c40e47de04a2a9c9c059c4c2b709bc1"
    end
    on_intel do
      url "https://github.com/TraceCommons/trace-commons/releases/download/contributor-v#{version}/trace-commons-contributor-x86_64-apple-darwin.zip"
      sha256 "f74302e721d2dcc8b7adc3eb8ab2551817ea06e1729893315219c2186681f05c"
    end
  end

  def install
    bin.install Dir["trace-commons-contributor*"].first => "trace-commons-contributor"
  end

  test do
    assert_match "trace-commons-contributor", shell_output("#{bin}/trace-commons-contributor --help")
  end
end
