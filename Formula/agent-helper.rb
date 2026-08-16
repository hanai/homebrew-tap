class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.3-snapshot.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.20/agent-helper-macos-arm64.tar.gz"
      sha256 "dfeccc73ab5d28cd1cbb536ef117f203098b45445ed4ada7d740490beeebd2c7"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.20/agent-helper-linux-amd64.tar.gz"
      sha256 "40daa1fd2f5626bbdf2c6d711df7fd0eaa760e0bb796b1ddf2eee04c62a8d09b"
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
