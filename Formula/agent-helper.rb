class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.1-snapshot.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.15/agent-helper-macos-arm64.tar.gz"
      sha256 "e91924d30492e5e6c637affcf672aaf09156bd1ad0937bc1ebbb84837f946c76"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.15/agent-helper-linux-amd64.tar.gz"
      sha256 "97398f751b8c0c43bd56def6d3b1859749f2388c4e041049c99eaa09f1c463ad"
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
