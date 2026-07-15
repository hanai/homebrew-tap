class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.2/agent-helper-macos-arm64.tar.gz"
      sha256 "5294a78d585273529a26b80e66b62ee7449b196851e2bb1c8a5ac108d59c8390"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.2/agent-helper-linux-amd64.tar.gz"
      sha256 "7b6c4c37a40df97cc73a724577e41433ec59591787952837f0c03c8c85ac6d61"
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
