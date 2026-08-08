class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.3-snapshot.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.15/agent-helper-macos-arm64.tar.gz"
      sha256 "c60b58106e15c7c87e8dc9adb521d6c84317326366c9e95a93f61ee5e9fc2175"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.15/agent-helper-linux-amd64.tar.gz"
      sha256 "64e64fe3725dfb95764e0a35d20ca90d9770f2cd3386f5f32492ac7daf9020da"
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
