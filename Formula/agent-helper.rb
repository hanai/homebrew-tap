class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.3-snapshot.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.18/agent-helper-macos-arm64.tar.gz"
      sha256 "91cb6a744337e9bc0675cd2170e7b68dd74c1200c76fc1cabcd581be03912153"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.18/agent-helper-linux-amd64.tar.gz"
      sha256 "c2927a096b45ccdf73ae151fc6b9898214147b9cfd15483dc7bb696bbe13210a"
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
