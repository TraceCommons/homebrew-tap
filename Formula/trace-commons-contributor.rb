class TraceCommonsContributor < Formula
  desc "CLI for contributing coding session traces to the Trace Commons corpus"
  homepage "https://tracecommons.ai/"
  version "0.18.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/TraceCommons/trace-commons/releases/download/contributor-v#{version}/trace-commons-contributor-aarch64-apple-darwin.zip"
      sha256 "23ea0eb2368105c852846064dc09d759a1a2231e37960a87471c094e926c3f24"
    end
    on_intel do
      url "https://github.com/TraceCommons/trace-commons/releases/download/contributor-v#{version}/trace-commons-contributor-x86_64-apple-darwin.zip"
      sha256 "d96d5ae2ecdb1ba8c10083007d72bbc994f94ea56c7accd393f47f09bc5f393c"
    end
  end

  def install
    bin.install Dir["trace-commons-contributor*"].first => "trace-commons-contributor"
  end

  test do
    assert_match "trace-commons-contributor", shell_output("#{bin}/trace-commons-contributor --help")
  end
end
