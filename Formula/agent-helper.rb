class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.1-snapshot.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.14/agent-helper-macos-arm64.tar.gz"
      sha256 "7fb13f466a4f18951ae6e96fef1c1c0afa0974317fee0d551b04e7fd3b0f02e5"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.14/agent-helper-linux-amd64.tar.gz"
      sha256 "7fbfec40e6cb42131f21ddfcaeffcf4c121e4fad736c3ca1b480610f9af501d5"
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
