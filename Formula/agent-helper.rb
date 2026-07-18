class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.3-snapshot.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.2/agent-helper-macos-arm64.tar.gz"
      sha256 "dd025b3e01202708eaefb3143e4dc107f7452cf5c1bfdb3d35b4d99b46ca4a67"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.2/agent-helper-linux-amd64.tar.gz"
      sha256 "af76016c4f401209b8ed53c43e3ba9e55eebee07d0471f12f488746595f1afcf"
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
