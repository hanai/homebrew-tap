class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.1-snapshot.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.11/agent-helper-macos-arm64.tar.gz"
      sha256 "53534949b2aa122c5a6a91d698afa7c54ce08e1ef3c969ac1f280b00aa3aa597"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.11/agent-helper-linux-amd64.tar.gz"
      sha256 "dabc23844284c5b5ad8ac3996e39c6b33b5f9429880d2045e6bd2ec71b97db17"
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
