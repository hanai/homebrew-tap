class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.1-snapshot.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.10/agent-helper-macos-arm64.tar.gz"
      sha256 "10e2b1e6d619839d37e230a6a688868a833e3bff6f9d065467eaaf78179b04f3"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.10/agent-helper-linux-amd64.tar.gz"
      sha256 "3a8f10c8f8a121b62135545123d69ce739d83e943a84da32b73bf537e0a78f42"
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
