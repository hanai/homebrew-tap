class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "0.3.0-snapshot.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.13/agent-helper-macos-arm64.tar.gz"
      sha256 "f981a3789c3b3f5b875a4efb76ee4b0b74793c0b609436830158fa394be13fad"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.13/agent-helper-linux-amd64.tar.gz"
      sha256 "9594b246100e2c6f9816b06dee824074e243da6662efd61898974b8dff2e69c6"
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
