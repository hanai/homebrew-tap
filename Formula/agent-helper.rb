class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.1-snapshot.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.7/agent-helper-macos-arm64.tar.gz"
      sha256 "5d99457a3dd27f511fb47ac1fc2f9f12040b484a47734d24342e3378a2684fb8"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.7/agent-helper-linux-amd64.tar.gz"
      sha256 "b5e0a085ac9735798fd47059bbe8a5fb43e081ff126620e18de243fd33dc8577"
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
