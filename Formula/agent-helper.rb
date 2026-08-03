class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.3-snapshot.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.9/agent-helper-macos-arm64.tar.gz"
      sha256 "fd3e15594bb38107afbcbd34576a051af67c6603cfc054be38b4a88f15e16cef"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.9/agent-helper-linux-amd64.tar.gz"
      sha256 "9deae8c5f9d3762759637071ee9a6f426cec5684f723ce86e7429413f9c4ba02"
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
