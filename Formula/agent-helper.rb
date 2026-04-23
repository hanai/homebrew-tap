class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "0.3.0-snapshot.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.5/agent-helper-macos-arm64.tar.gz"
      sha256 "9da45ab23665fa28e4b96f9855341e60b0b32c606b2d5af92e9e7751a6300267"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.5/agent-helper-linux-amd64.tar.gz"
      sha256 "2f6ed84b86897687bc7169335326aa174d67614f87c81df62163b0b3b03cc93c"
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
