class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.1-snapshot.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.12/agent-helper-macos-arm64.tar.gz"
      sha256 "9a4c1f320ec2f96712be9bd36bf1669b7b25f04cf6742ef6915637e971816512"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.12/agent-helper-linux-amd64.tar.gz"
      sha256 "be9664684c313c9ec5568ce5aae0a6af97a273397a4a76523566eae9ef950cff"
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
