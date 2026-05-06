class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "0.3.0-snapshot.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.12/agent-helper-macos-arm64.tar.gz"
      sha256 "e55b83192d282d01866a23e930a1c1e0c7af55eaba99245c58dd7d5636066fc1"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.12/agent-helper-linux-amd64.tar.gz"
      sha256 "9a8302ea6cc6c80c354a81fbf4d57ecb62717ef2fda4738cec4bd4a97a5c3150"
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
