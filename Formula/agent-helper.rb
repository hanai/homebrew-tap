class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "0.3.0-snapshot.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.11/agent-helper-macos-arm64.tar.gz"
      sha256 "620f8981cf61999d1e4c52907dda4b5ae11d3a7cc2bd099d408f6c7f79218a75"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.11/agent-helper-linux-amd64.tar.gz"
      sha256 "61c7a2b0e8ecc5a85b74edc35528982ec18b459d2999827873b1aac2ade20afe"
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
