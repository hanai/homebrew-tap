class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.3-snapshot.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.19/agent-helper-macos-arm64.tar.gz"
      sha256 "18021861d5001acc9e4c5885ffead5ed268cbd06dc99f9c672a4ecec1ab514a2"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.19/agent-helper-linux-amd64.tar.gz"
      sha256 "2f5e3e73ddff5600c45e5aa9e03f870ea87db57d500c3bb2abda597430d642ef"
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
