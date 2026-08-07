class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.3-snapshot.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.12/agent-helper-macos-arm64.tar.gz"
      sha256 "b31ac2896c6a8302b260340b7336ed0f9811c573f0737b27ba99012eea9240be"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.12/agent-helper-linux-amd64.tar.gz"
      sha256 "0e456cb5867704a6d627607cb6203637c7d44e8168cf91b0e3ac2555b92477b0"
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
