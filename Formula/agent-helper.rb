class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "0.3.0-snapshot.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.6/agent-helper-macos-arm64.tar.gz"
      sha256 "53eb230e4b50638e0c68e176e65f6a6d1be0cbbc3c2e7c666017cef2b1bc86be"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.6/agent-helper-linux-amd64.tar.gz"
      sha256 "aee3c84930c5c50bd7c29ed7aafc9be6fb8bc67c7c4b168c6069f0681736ca7c"
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
