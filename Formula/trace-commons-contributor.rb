class TraceCommonsContributor < Formula
  desc "Share coding traces and earn credit, from the command line"
  homepage "https://tracecommons.ai/"
  version "1.0.5"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/TraceCommons/trace-commons/releases/download/contributor-v#{version}/trace-commons-contributor-aarch64-apple-darwin.zip"
      sha256 "791be1d6562c7f2dffa9968434e71335bfa39b6b67f2346895698807cf59019f"
    end
    on_intel do
      url "https://github.com/TraceCommons/trace-commons/releases/download/contributor-v#{version}/trace-commons-contributor-x86_64-apple-darwin.zip"
      sha256 "8566c9bb71144b91db1bb448d0de1935207a99109d5be4ef1686866952b11d9e"
    end
  end

  def install
    bin.install Dir["trace-commons-contributor*"].first => "trace-commons-contributor"
  end

  test do
    assert_match "trace-commons-contributor", shell_output("#{bin}/trace-commons-contributor --help")
  end
end
