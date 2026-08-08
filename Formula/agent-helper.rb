class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.3-snapshot.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.14/agent-helper-macos-arm64.tar.gz"
      sha256 "e6e8a7fdf7820d6f4dcee120f0f26bc3725e1fa47f07c9dd5229779dafe051dc"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.14/agent-helper-linux-amd64.tar.gz"
      sha256 "675d486acd2b547831a359d3215a82563bf97892d5096702a8cc0214a386d436"
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
