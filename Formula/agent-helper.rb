class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.3-snapshot.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.13/agent-helper-macos-arm64.tar.gz"
      sha256 "66c0b49241df8380c05041b9fc4296478ee66892ac0995352f7b19574436e66f"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.13/agent-helper-linux-amd64.tar.gz"
      sha256 "9afb933d0c5d855b777264b81476ea1424e9adc84b15dc41a9446f41f6d2a624"
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
