class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.3-snapshot.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.8/agent-helper-macos-arm64.tar.gz"
      sha256 "d5c07e5454ef9a4cb87243ab5bf7a03594959d4aa458704fa4f5fc5be32bef29"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.8/agent-helper-linux-amd64.tar.gz"
      sha256 "48e6dc1027a20f88a63d6c182fa24eaa61991b061ffd64e3af95745dc08ec709"
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
