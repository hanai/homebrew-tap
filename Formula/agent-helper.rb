class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.3-snapshot.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.10/agent-helper-macos-arm64.tar.gz"
      sha256 "06251c1c5c497f64a2a26341dcd54728d80b967193bd6ece824e0a61a9d8926d"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.10/agent-helper-linux-amd64.tar.gz"
      sha256 "a36a1a1e9689c83c7e3111eed4a9e99233cbfe90cf11d21ae3f18378815943d5"
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
