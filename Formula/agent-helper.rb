class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.3-snapshot.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.1/agent-helper-macos-arm64.tar.gz"
      sha256 "40ce7e7ada79a992a63511587c82ab3624fd6bf2975f33806cb14f51e701ed2b"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.1/agent-helper-linux-amd64.tar.gz"
      sha256 "3dbe72b3d42330b76cf031579c4edc904f951d2467fbc84b22be8a6f41aa4605"
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
