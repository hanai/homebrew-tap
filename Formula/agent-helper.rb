class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.1-snapshot.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.9/agent-helper-macos-arm64.tar.gz"
      sha256 "c9548c256b0b582e21bfa5b3b90028b870535af97bee9f512eb465ff21c59e07"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.9/agent-helper-linux-amd64.tar.gz"
      sha256 "fbd388996d8c0fba41e59001d52c1432f5cf9da372dc367689216ccd3bb4f622"
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
