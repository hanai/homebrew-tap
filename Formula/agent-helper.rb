class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.0/agent-helper-macos-arm64.tar.gz"
      sha256 "f50d6f437abcfdec6fa7be63e0418cd2a15de86725052d7d50ccddf1b70d22b0"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.0/agent-helper-linux-amd64.tar.gz"
      sha256 "323fc2f8658729836ec94016317975b9f6fccbd6fbc97194bb36b4fadbff951a"
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
