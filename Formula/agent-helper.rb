class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.1-snapshot.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.17/agent-helper-macos-arm64.tar.gz"
      sha256 "fa758e890f9c30d4b08e714f794acb987e218489573cccaba2212ac4104db411"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.17/agent-helper-linux-amd64.tar.gz"
      sha256 "df502b15be1b0a0d522c6ce9d4ea967eb9f95eab07635202f40e98ef7a2e1281"
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
