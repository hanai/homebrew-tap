class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "0.3.0-snapshot.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.2/agent-helper-macos-arm64.tar.gz"
      sha256 "3f9b1fcecc651b02e83370a7c25efdd281d234fc1550b17023c5ab4770db1ca1"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.2/agent-helper-linux-amd64.tar.gz"
      sha256 "d336d5f2a62920de1fff9ee0dd2abd25744050fb884daba7254e68611627b946"
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
