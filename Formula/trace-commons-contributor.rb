class TraceCommonsContributor < Formula
  desc "Share coding traces and earn credit, from the command line"
  homepage "https://tracecommons.ai/"
  version "0.24.13"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/TraceCommons/trace-commons/releases/download/contributor-v#{version}/trace-commons-contributor-aarch64-apple-darwin.zip"
      sha256 "a8c126dc9ee1464ad0cc76d2d9f8b8c125a9071d0c37b3adf3b095d7d4e2f16c"
    end
    on_intel do
      url "https://github.com/TraceCommons/trace-commons/releases/download/contributor-v#{version}/trace-commons-contributor-x86_64-apple-darwin.zip"
      sha256 "1a9eeda8894ea4d6ccc5e5fba65b872674420d3f9b90c76d7af0047b9ec4d04d"
    end
  end

  def install
    bin.install Dir["trace-commons-contributor*"].first => "trace-commons-contributor"
  end

  test do
    assert_match "trace-commons-contributor", shell_output("#{bin}/trace-commons-contributor --help")
  end
end
