class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.3-snapshot.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.7/agent-helper-macos-arm64.tar.gz"
      sha256 "ff9d5d5f15c057878ac5c737a6ea779d761691e74f3ef2e86a49f5ec298b63ef"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.7/agent-helper-linux-amd64.tar.gz"
      sha256 "1e11b4ebdbf7352b569778db21d3a2c6291930531a434f68e23c8a1eae5f2bad"
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
