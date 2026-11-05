class TraceCommonsContributor < Formula
  desc "Share coding traces and earn credit, from the command line"
  homepage "https://tracecommons.ai/"
  version "0.24.7"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/TraceCommons/trace-commons/releases/download/contributor-v#{version}/trace-commons-contributor-aarch64-apple-darwin.zip"
      sha256 "18fd9138310a67abbd18d030d11b23f8e94a08e1b79d1e902f0eb9805f06cb39"
    end
    on_intel do
      url "https://github.com/TraceCommons/trace-commons/releases/download/contributor-v#{version}/trace-commons-contributor-x86_64-apple-darwin.zip"
      sha256 "5989c9c17f214c7526173bb1064f16b3e6f15852e73ec106fb826f0738e53f5e"
    end
  end

  def install
    bin.install Dir["trace-commons-contributor*"].first => "trace-commons-contributor"
  end

  test do
    assert_match "trace-commons-contributor", shell_output("#{bin}/trace-commons-contributor --help")
  end
end
