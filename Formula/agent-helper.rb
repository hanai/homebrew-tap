class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "0.3.0-snapshot.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.3/agent-helper-macos-arm64.tar.gz"
      sha256 "eba437d0926ef53e26b2d6b0061419a4aa308b46f57add6f379c9103709cd4fa"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.3/agent-helper-linux-amd64.tar.gz"
      sha256 "342aeb5cc97d3017a1144be38b231c9cc97666a119e7849ba5a727efb297724d"
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
