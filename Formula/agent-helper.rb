class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "0.3.0-snapshot.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.7/agent-helper-macos-arm64.tar.gz"
      sha256 "7b71a0a13adc46b6a409c90487c19b4cb8407781c9e1bcc23baac440e6eaa68b"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.7/agent-helper-linux-amd64.tar.gz"
      sha256 "b1904e42696696a134c683e36995e3058319fcde0760efa9f5ab742550b404d9"
    else
      odie "agent-helper does not support Linux ARM"
    end
  end

  def install
    bin.install "agent-helper"
  end

  test do
    system "#{bin}/agent-helper", "--help"
  end
end
