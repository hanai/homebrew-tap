class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.1-snapshot.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.3/agent-helper-macos-arm64.tar.gz"
      sha256 "3a6d8f09e04e01fb0144cb7aa5f33d9cd1488fceec876cfa2b00d0f29031b5d3"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.3/agent-helper-linux-amd64.tar.gz"
      sha256 "580159aac79d0451c7ed1b36959376e1f632c76e7e5e06850cf5d90729f14561"
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
