class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.3-snapshot.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.11/agent-helper-macos-arm64.tar.gz"
      sha256 "3df7b4ff57b2544dea4473eba2e3985306b45ac687e257060cf365ee0b8b34d9"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.11/agent-helper-linux-amd64.tar.gz"
      sha256 "2f6923205ae4d70b48cec85545c0156572298af7e50c5535275e081c5bf03398"
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
