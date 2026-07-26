class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.3-snapshot.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.5/agent-helper-macos-arm64.tar.gz"
      sha256 "2bfeebe1fdb810758575fe5daeee7c6d34c0ae9259fee22994d001513b492542"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.5/agent-helper-linux-amd64.tar.gz"
      sha256 "418aa9615618e11c2bd6b84351b1550d41bb3e98d7c15c754338eaf5cb7ae282"
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
