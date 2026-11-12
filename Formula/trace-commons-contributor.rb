class TraceCommonsContributor < Formula
  desc "Share coding traces and earn credit, from the command line"
  homepage "https://tracecommons.ai/"
  version "1.0.6"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/TraceCommons/trace-commons/releases/download/contributor-v#{version}/trace-commons-contributor-aarch64-apple-darwin.zip"
      sha256 "de5f60f0539d2c6d999ad5536572651fcb146cfcee5d203ff88c96bd6257304a"
    end
    on_intel do
      url "https://github.com/TraceCommons/trace-commons/releases/download/contributor-v#{version}/trace-commons-contributor-x86_64-apple-darwin.zip"
      sha256 "87ae70a5b9772c7cf39d3239c73d5ad79934f4ceda560ecd10814ec3a49d169a"
    end
  end

  def install
    bin.install Dir["trace-commons-contributor*"].first => "trace-commons-contributor"
  end

  test do
    assert_match "trace-commons-contributor", shell_output("#{bin}/trace-commons-contributor --help")
  end
end
