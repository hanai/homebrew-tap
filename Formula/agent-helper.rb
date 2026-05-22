class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.1-snapshot.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.13/agent-helper-macos-arm64.tar.gz"
      sha256 "2a41072332820823a365469bfbaae2ad6abb2b6fcf1786f814b80a31b3b96df1"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.13/agent-helper-linux-amd64.tar.gz"
      sha256 "9f623131323f5ce5faeceb0e758be5cec27ec29016f5b64f7045c6d4f232ceb8"
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
