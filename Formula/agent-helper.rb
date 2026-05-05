class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "0.3.0-snapshot.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.8/agent-helper-macos-arm64.tar.gz"
      sha256 "f409cf247af687573985b819951ba61b0f56ee052a9ce2fb5576b67f8b667b31"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.8/agent-helper-linux-amd64.tar.gz"
      sha256 "37a4b1d99bf0f0bb606f34b1aa1107ceff00303b79c8488638115fb82edb638f"
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
