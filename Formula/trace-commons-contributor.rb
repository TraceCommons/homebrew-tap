class TraceCommonsContributor < Formula
  desc "Share coding traces and earn credit, from the command line"
  homepage "https://tracecommons.ai/"
  version "1.0.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/TraceCommons/trace-commons/releases/download/contributor-v#{version}/trace-commons-contributor-aarch64-apple-darwin.zip"
      sha256 "7598424ad5896c67efe355a59e7e758d4691d8f9fdb79350e1270d78a4a602ba"
    end
    on_intel do
      url "https://github.com/TraceCommons/trace-commons/releases/download/contributor-v#{version}/trace-commons-contributor-x86_64-apple-darwin.zip"
      sha256 "0ba5319b1fb32448d423ad0da095c185de48034d13776bb3b9490e557258f54a"
    end
  end

  def install
    bin.install Dir["trace-commons-contributor*"].first => "trace-commons-contributor"
  end

  test do
    assert_match "trace-commons-contributor", shell_output("#{bin}/trace-commons-contributor --help")
  end
end
