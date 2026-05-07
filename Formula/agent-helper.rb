class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "0.3.0-snapshot.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.15/agent-helper-macos-arm64.tar.gz"
      sha256 "cc18ea3ccc78930baecb4fbbbe484c656d70e500b721810e4b203784190e0513"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.15/agent-helper-linux-amd64.tar.gz"
      sha256 "8af0be54801ec1dff1d4a8ada46ad259445c7469da3d3f613432253d732cc4b5"
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
